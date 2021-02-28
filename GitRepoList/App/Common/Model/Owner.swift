//
//  Owner.swift
//  GitRepoList
//
//  Created by 小林聖人 on 2021/02/28.
//

import Foundation

struct Owner: Codable, Identifiable {
    let id: Int
    var name: String?
    var avatarUrl: String?
    var repositoryIds: [Int]
}
