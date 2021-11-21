//
//  ArticlesViewModel.swift
//
//  Created by Andrej Saric.
//

import Foundation
import Combine
import SwiftUI

final class ArticlesViewModel: ObservableObject {
    @Published private(set) var articleData: [Article] = []
    @Published private(set) var bookmarkData: [Article] = []
    
    private var cancellable: Set<AnyCancellable> = []
    

    init() {
        getData()
    }

    private func getData() {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        guard let url = URL(string: "https://70o99.mocklab.io/news") else {
            fatalError("Url cannot be created.")
        }

        URLSession.shared
            .dataTaskPublisher(for: url)
            .tryMap({ $0.data })
            .decode(type: [Article].self, decoder: decoder)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { print($0) },
                  receiveValue: { self.articleData = $0 })
            .store(in: &cancellable)
    }
    
    // DELETE PART
      func deleteBookmark(at offsets: IndexSet) {
        bookmarkData.remove(atOffsets: offsets)
    }
    
    //TOGGLE PART
}
