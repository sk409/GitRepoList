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
    private static let queryKey = UserDefaultsManager.uniqueKey(
        of: RepoListViewModel.self,
        for: "queryKey"
    )
    private static let resultKey = UserDefaultsManager.uniqueKey(
        of: RepoListViewModel.self,
        for: "resultKey"
    )
    
    @Published var query = ""
    @Published var rows = [RepoListRow]()
    
    var store: Store!

    private var repoListReducer = RepoListReducer()
    private var repoListRepository = RepoListRepository()
   
    private var cancellables = Set<AnyCancellable>()
    private var repositoriesById = [Int: Repository]()
    private var ownersById = [Int: Owner]()
    
    init() {
        observe()
        restore()
    }
    
    private func observe() {
        $query
            .dropFirst()
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue(label: "RepoListViewModel"))
            .sink(receiveValue: fetchRepositories)
            .store(in: &cancellables)
    }
    
    private func restore() {
        guard let query = UserDefaultsManager.string(forKey: RepoListViewModel.queryKey),
              let result = UserDefaultsManager.unarchive(
                RepoListSearchResult.self,
                forKey: RepoListViewModel.resultKey
              )
        else {
                return
        }
        
        self.query = query
        reduceSearchResult(result)
    }
    
    private func reduceSearchResult(_ result: RepoListSearchResult) {
        self.repoListReducer.reduceSearchResult(
            result,
            rows: &self.rows,
            repositoriesById: &self.repositoriesById,
            ownersById: &self.ownersById
        )
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
                
                UserDefaultsManager.set(self.query, forKey: RepoListViewModel.queryKey)
                UserDefaultsManager.archive(result, forKey: RepoListViewModel.resultKey)
                
                self.reduceSearchResult(result)
            })
            .store(in: &cancellables)
    }
}
