//
//  Store.swift
//  GitRepoList
//
//  Created by 小林聖人 on 2021/02/28.
//

import Foundation

class Store: ObservableObject {
    private static let loggedInKey = "loggedInKey"
    
    @Published var loggedIn = false {
        didSet {
            UserDefaults.standard.set(loggedIn, forKey: Store.loggedInKey)
        }
    }
    @Published var isSplashShown = false
    
    init() {
        loggedIn = UserDefaults.standard.bool(forKey: Store.loggedInKey)
    }
}
