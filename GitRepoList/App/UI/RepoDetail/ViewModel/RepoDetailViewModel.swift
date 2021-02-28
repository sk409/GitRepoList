//
//  RepoDetailRepoDetailViewModel.swift
//  GitRepoList
//
//  Created by shoutokobayashi on 2021/02/28.
//  Copyright 2021 Shoto Kobayashi. All rights reserved.
//

import Combine
import Foundation

class RepoDetailViewModel: ObservableObject, Identifiable {
    @Published var name: String
    @Published var description: String
    @Published var stars: Int
    @Published var forks: Int
    @Published var watchers: Int
    @Published var ownerName: String
    @Published var ownerAvatarData: Data
    
    var store: Store!
    
    private var repoDetailReducer = RepoDetailReducer()
    private var repoDetailRepository = RepoDetailRepository()

    private var cancellables = Set<AnyCancellable>()
    
    init(
        name: String,
        description: String,
        stars: Int,
        forks: Int,
        watchers: Int,
        ownerName: String,
        ownerAvatarData: Data
    ) {
        self.name = name
        self.description = description
        self.stars = stars
        self.forks = forks
        self.watchers = watchers
        self.ownerName = ownerName
        self.ownerAvatarData = ownerAvatarData
    }
}
