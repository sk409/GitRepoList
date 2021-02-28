//
//  RepoListRepoListViewModel.swift
//  GitRepoList
//
//  Created by shoutokobayashi on 2021/02/28.
//  Copyright 2021 Shoto Kobayashi. All rights reserved.
//

import Combine
import Foundation

class RepoListViewModel: ObservableObject, Identifiable {
    @Published var query = ""
    @Published var rows = [RepoListRow]()
    
    var store: Store!

    private var repoListReducer = RepoListReducer()
    private var repoListRepository = RepoListRepository()
   
    private var cancellables = Set<AnyCancellable>()
    private var repositoriesById = [Int: Repository]()
    private var ownersById = [Int: Owner]()
    
    init() {
        $query
            .dropFirst()
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue(label: "RepoListViewModel"))
            .sink(receiveValue: fetchRepositories)
            .store(in: &cancellables)
    }
    
    private func fetchRepositories(by query: String) {
        repoListRepository.fetchRepositories(by: query)
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { error in
                switch error {
                case .failure(let error):
                    print(error.localizedDescription)
                    
                case .finished:
                    break
                }
            }, receiveValue: { [weak self] result in
                guard let self = self else {
                    return
                }
                self.repoListReducer.reduceRepositories(
                    result: result,
                    rows: &self.rows,
                    repositoriesById: &self.repositoriesById,
                    ownersById: &self.ownersById
                )
            })
            .store(in: &cancellables)
    }
}
