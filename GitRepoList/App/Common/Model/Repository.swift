//
//  Repository.swift
//  GitRepoList
//
//  Created by 小林聖人 on 2021/02/28.
//

import Foundation

struct Repository: Codable, Identifiable {
    let id: Int
    var name: String
    var stars: Int
    var forks: Int
    var watchers: Int
    var ownerId: Int
}
