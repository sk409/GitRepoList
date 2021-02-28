//
//  RepoListSearchResultOwner.swift
//  GitRepoList
//
//  Created by 小林聖人 on 2021/02/28.
//

import Foundation

struct RepoListSearchResultOwner: Codable, Identifiable {
    enum CodingKeys: String, CodingKey {
        case id
        case name = "login"
        case avatarUrl = "avatar_url"
    }
    
    let id: Int
    let name: String?
    let avatarUrl: String?
}
