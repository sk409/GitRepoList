//
//  RepoListRow.swift
//  GitRepoList
//
//  Created by 小林聖人 on 2021/02/28.
//

import Foundation

struct RepoListRow: Identifiable {
    let id: Int
    let name: String
    let description: String
    let stars: Int
    let forks: Int
    let watchers: Int
    let ownerName: String
    let ownerAvatarData: Data
}
