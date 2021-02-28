//
//  RepoDetailRepoDetailView.swift
//  GitRepoList
//
//  Created by shoutokobayashi on 2021/02/28.
//  Copyright 2021 Shoto Kobayashi. All rights reserved.
//

import SwiftUI

struct RepoDetailView: View {
    @EnvironmentObject var store: Store
    
    @ObservedObject var repoDetailViewModel: RepoDetailViewModel

    var body: some View {
        ScrollView {
            Text(repoDetailViewModel.description)
                .fixedSize(horizontal: false, vertical: true)
                .padding(.horizontal)
            HStack {
                HStack {
                    Image(systemName: "star")
                    Text("\(repoDetailViewModel.stars)")
                }
                HStack {
                    Image(systemName: "tuningfork")
                    Text("\(repoDetailViewModel.forks)")
                }
                .padding(.leading)
                HStack {
                    Image(systemName: "eye")
                    Text("\(repoDetailViewModel.watchers)")
                }
                .padding(.leading)
            }
            .padding(.top)
            Divider()
            
            HStack {
                Image(uiImage: UIImage(data: repoDetailViewModel.ownerAvatarData)!)
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 100, height: 100)
                
                Text(repoDetailViewModel.ownerName)
            }
            .padding(.top)
        }
        .navigationBarTitle(Text(repoDetailViewModel.name), displayMode: .large)
        .onAppear {
            repoDetailViewModel.store = store
        }
    }
}

struct RepoDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RepoDetailView(
            repoDetailViewModel: RepoDetailViewModel(
                name: "repository",
                description: "description",
                stars: 1,
                forks: 1,
                watchers: 1,
                ownerName: "owner",
                ownerAvatarData: try! Data(
                    contentsOf: URL(string: "https://placekitten.com/600/600")!
                )
            )
        )
    }
}
