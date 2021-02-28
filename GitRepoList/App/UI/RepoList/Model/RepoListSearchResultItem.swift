//
//  RepoListSearchResultItem.swift
//  GitRepoList
//
//  Created by 小林聖人 on 2021/02/28.
//

import Foundation

struct RepoListSearchResultItem: Codable, Identifiable {
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
        case stars = "stargazers_count"
        case forks
        case watchers = "watchers_count"
        case owner
    }
    
    let id: Int
    let name: String
    let description: String?
    let stars: Int
    let forks: Int
    let watchers: Int
    let owner: RepoListSearchResultOwner
}
