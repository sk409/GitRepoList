//
//  SplashSplashViewModel.swift
//  GitRepoList
//
//  Created by shoutokobayashi on 2021/02/28.
//  Copyright 2021 Shoto Kobayashi. All rights reserved.
//

import Combine
import Foundation

class SplashViewModel: ObservableObject, Identifiable {
    var store: Store!
    
    private var splashReducer = SplashReducer()
    private var splashRepository = SplashRepository()

    private var cancellables = Set<AnyCancellable>()
    
    func start() {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { [weak self] _ in
            guard let self = self else {
                return
            }
            self.store.isSplashShown = true
        }
    }
}
