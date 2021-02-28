//
//  RepoListSearchResult.swift
//  GitRepoList
//
//  Created by 小林聖人 on 2021/02/28.
//

import Foundation

struct RepoListSearchResult: Codable {
    enum CodingKeys: String, CodingKey {
        case items
    }
    
    let items: [RepoListSearchResultItem]
}
