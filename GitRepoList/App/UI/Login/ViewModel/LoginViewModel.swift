//
//  LoginLoginViewModel.swift
//  GitRepoList
//
//  Created by shoutokobayashi on 2021/02/28.
//  Copyright 2021 Shoto Kobayashi. All rights reserved.
//

import Combine
import Foundation

class LoginViewModel: ObservableObject, Identifiable {
    @Published var username = ""
    @Published var password = ""
    @Published var error = ""
    
    var store: Store?
    
    private var loginReducer = LoginReducer()
    private var loginRepository = LoginRepository()

    private var cancellables = Set<AnyCancellable>()
    
    func login() {
        guard !username.isEmpty && !password.isEmpty else {
            error = "ユーザ名またはパスワードが空です"
            return
        }
        
        store?.loggedIn = true
    }
}
