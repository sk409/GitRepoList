//
//  RepoListRepoListView.swift
//  GitRepoList
//
//  Created by shoutokobayashi on 2021/02/28.
//  Copyright 2021 Shoto Kobayashi. All rights reserved.
//

import SwiftUI

struct RepoListView: View {
    @EnvironmentObject var store: Store
    
    @ObservedObject var repoListViewModel = RepoListViewModel()

    var body: some View {
        VStack {
            HStack {
                Image(systemName: "magnifyingglass")
                TextField("検索", text: $repoListViewModel.query)
                    .cornerRadius(4)
            }
            .padding([.horizontal, .top])
            
            List {
                ForEach(repoListViewModel.rows) { row in
                    NavigationLink(destination: makeRepoDetailView(row: row)) {
                        RepoListRowView(
                            name: row.name,
                            description: row.description,
                            ownerName: row.ownerName,
                            ownerAvatarData: row.ownerAvatarData
                        )
                    }
                }
            }
        }
        .navigationBarTitle(Text("リポジトリ一覧"), displayMode: .inline)
        .onAppear {
            repoListViewModel.store = store
        }
    }
    
    private func makeRepoDetailView(row: RepoListRow) -> RepoDetailView {
        RepoDetailView(
            repoDetailViewModel: RepoDetailViewModel(
                name: row.name,
                description: row.description,
                stars: row.stars,
                forks: row.forks,
                watchers: row.watchers,
                ownerName: row.ownerName,
                ownerAvatarData: row.ownerAvatarData
            )
        )
    }
}

struct RepoListView_Previews: PreviewProvider {
    static var previews: some View {
        RepoListView()
    }
}
