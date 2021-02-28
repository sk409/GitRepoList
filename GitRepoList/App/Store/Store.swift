//
//  Store.swift
//  GitRepoList
//
//  Created by 小林聖人 on 2021/02/28.
//

import Foundation

class Store: ObservableObject {
    private static let loggedInKey = UserDefaultsManager.uniqueKey(
        of: Store.self,
        for: "loggedInKey"
    )
    
    @Published var isSplashShown = false
    
    @Published var loggedIn: Bool {
        didSet {
            UserDefaultsManager.set(loggedIn, forKey: Store.loggedInKey)
        }
    }
    
    init() {
        loggedIn = UserDefaultsManager.bool(forKey: Store.loggedInKey)
    }
}
