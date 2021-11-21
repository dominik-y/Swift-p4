//
//  NewsStandsViewModel.swift
//
//  Created by Andrej Saric.
//

import Foundation
import Combine

final class NewsStandsViewModel: ObservableObject {
    @Published private(set) var newsStandData: [NewsStand] = []

    private var cancellable: Set<AnyCancellable> = []

    init() {
        getData()
    }

    private func getData() {
        guard let url = URL(string: "https://70o99.mocklab.io/newsstand") else {
            fatalError("Url cannot be created.")
        }

        URLSession.shared
            .dataTaskPublisher(for: url)
            .tryMap({ $0.data })
            .decode(type: [NewsStand].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { print($0) },
                  receiveValue: { self.newsStandData = $0 })
            .store(in: &cancellable)
    }
}

