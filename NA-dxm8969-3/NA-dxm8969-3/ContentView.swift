//
//  ContentView.swift
//  NA-dxm8969-3
//
//  Created by Dominik Maric on 20.11.2021..
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var articlesViewModel = ArticlesViewModel()
    @ObservedObject private var newsViewModel = NewsStandsViewModel()
    
    @State private var compact: Bool = true
    
    private var btn: String {
        switch compact {
        case true:
            return "Compact"
        case false:
            return "Non-compact"
        }
    }
    
    private var articles: [Article] {
        return articlesViewModel.articleData
    }
    
    private var newsStand: [NewsStand] {
        return newsViewModel.newsStandData
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
        TabView {
            NavigationView{
                List{
                    ForEach(articles) { article in
                        if(compact) {
                            Image.loadFrom(url: article.imageUrl) {}
                                .cornerRadius(15)
                                .frame(width: 330, height: 200)
                            Text(article.title).lineLimit(3)
                        } else {
                            HStack{
                                VStack(alignment: .trailing) {
                                    Text(article.title).fontWeight(.bold).lineLimit(1)
                                    Text(article.content).lineLimit(2)
                                }
                                Image.loadFrom(url: article.imageUrl) {}
                                    .scaledToFill()
                                    .frame(width: 100, height: 100)
                                    .cornerRadius(15)
                            }
                        }
                    }
                    //I don't get why is this not working, solve later
                    .onDelete(perform: articlesViewModel.deleteBookmark)
                    .navigationBarItems(trailing: Button(action: {
                        compact.toggle()
                    }) {
                        Text(btn)
                    })
                }.navigationTitle("News")
            }.tabItem {
                Label("News", systemImage: "waveform.path.ecg")
                Text("News")
            }
            
            NavigationView {
                //.navigationTitle("Bookmarks")
                Text("")
            } .tabItem({
                Image(systemName: "bookmark")
                Text("Bookmarks")
            })
            
            NavigationView {
                List{
                    ForEach(newsStand) { stand in
                        VStack(alignment: .leading, spacing: 5) {
                            Text(stand.name).fontWeight(.bold)
                            Text(stand.category.description)
                        }
                    }
                }
                .navigationTitle("News Stands")
            } .tabItem({
                Image(systemName: "location")
                Text("News Stands")
            })
            
        }
    }
    }}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
