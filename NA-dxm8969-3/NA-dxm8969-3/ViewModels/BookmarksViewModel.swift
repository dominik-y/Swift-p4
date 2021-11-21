//
//  ArticlesViewModel.swift
//
//  Created by Andrej Saric.
//

import Foundation
import Combine

final class BookmarksViewModel: ObservableObject {
    //@Published private(set) var articleData: [Article] = []

    private var cancellable: Set<AnyCancellable> = []

    init() {
        getData()
    }

    private func getData() {
        guard let url = URL(string: "https://70o99.mocklab.io/news") else {
            fatalError("Url cannot be created.")
        }

        URLSession.shared
            .dataTaskPublisher(for: url)
            .tryMap({ $0.data })
            .decode(type: [Article].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { print($0) },
                  receiveValue: { self.articleData = $0 })
            .store(in: &cancellable)
    }
}
