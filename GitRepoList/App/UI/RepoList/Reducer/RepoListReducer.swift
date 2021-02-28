//
//  RepoListReducer.swift
//  GitRepoList
//
//  Created by shoutokobayashi on 2021/02/28.
//  Copyright 2021 Shoto Kobayashi. All rights reserved.
//

import Foundation

struct RepoListReducer {
    func reduceSearchResult(
        _ result: RepoListSearchResult,
        rows: inout [RepoListRow],
        repositoriesById: inout [Int: Repository],
        ownersById: inout [Int: Owner]
    ) {
        for repository in result.items {
            repositoriesById[repository.id] = Repository(
                id: repository.id,
                name: repository.name,
                stars: repository.stars,
                forks: repository.forks,
                watchers: repository.watchers,
                ownerId: repository.owner.id
            )
            if ownersById[repository.owner.id] == nil {
                ownersById[repository.owner.id] = Owner(
                    id: repository.owner.id,
                    name: repository.owner.name,
                    avatarUrl: repository.owner.avatarUrl,
                    repositoryIds: [repository.id]
                )
            } else {
                ownersById[repository.owner.id]?.repositoryIds.append(repository.id)
            }
        }
        
        rows = result.items.map { repository in
            let description = repository.description ?? "Empty Description"
            let ownerName = repository.owner.name ?? "Anonymous"
            let ownerAvatarData: Data
            if let string = repository.owner.avatarUrl,
               let url = URL(string: string),
               let data = try? Data(contentsOf: url) {
                ownerAvatarData = data
            } else {
                ownerAvatarData = R.image.no_image()!.jpegData(compressionQuality: 1)!
            }
            
            return RepoListRow(
                id: repository.id,
                name: repository.name,
                description: description,
                stars: repository.stars,
                forks: repository.forks,
                watchers: repository.watchers,
                ownerName: ownerName,
                ownerAvatarData: ownerAvatarData
            )
        }
    }
}
