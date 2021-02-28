//
//  RepoListRepoListRepository.swift
//  GitRepoList
//
//  Created by shoutokobayashi on 2021/02/28.
//  Copyright 2021 Shoto Kobayashi. All rights reserved.
//

import Combine
import Foundation

struct RepoListRepository {
    func fetchRepositories(by query: String) -> AnyPublisher<RepoListSearchResult, Error> {
        let url = URL(string: "https://api.github.com/search/repositories?q=\(query)&sort=stars&page=1&per_page=10")!
        return URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { data, _ in
                try JSONDecoder().decode(RepoListSearchResult.self, from: data)
            }
            .eraseToAnyPublisher()
    }
}
