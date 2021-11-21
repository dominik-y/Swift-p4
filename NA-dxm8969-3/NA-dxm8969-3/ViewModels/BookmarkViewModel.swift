//
//  BookmarkViewModel.swift
//  NA-dxm8969-3
//
//  Created by Dominik Maric on 21.11.2021..
//

import Foundation
import Combine

final class BookmarkViewModel: ObservableObject {

    @Published private(set) var bookmarkData: [Article] = []

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
                  receiveValue: { self.bookmarkData = $0 })
            .store(in: &cancellable)
    }
    
    private func toggleBookmark() {
        
    }
    
    private func deleteBookmark() {
        
    }
}

