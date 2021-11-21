//
//  NewsView.swift
//  NA-dxm8969-3
//
//  Created by Dominik Maric on 21.11.2021..
//

import SwiftUI

struct NewsView: View {
    
    
    @ObservedObject private var articlesViewModel = ArticlesViewModel()
    
    @Binding var compact: Bool
    
    
    var articleModel: ArticlesViewModel
    var articleData: [Article] = []
    
    private var articles: [Article] {
        return articlesViewModel.articleData
    }
    
//    private var b: String {
//        if(true) {
//            return "Not-compact"
//        } else {
//            return "Compact"
//        }
//    }
    
    private var btn: String {
        switch compact {
        case true:
            return "Not-Compact"
        case false:
            return "Compact"
        }
    }
    
    var body: some View {
        TabView {
            NavigationView{
                    List{
                        ForEach(articles) { article in
                            VStack(alignment: .leading) {
                                Image.loadFrom(url: article.imageUrl) {
                                    Rectangle().foregroundColor(.white)
                        }          .cornerRadius(25)
                                  .frame(width: 330, height: 200)
                                Text(article.title).lineLimit(1)
                            }

                        }
                    }.navigationTitle("News")
            }.tabItem({
                Image(systemName: "waveform.path.ecg")
                Text("News")
            })
    }
 }
}


