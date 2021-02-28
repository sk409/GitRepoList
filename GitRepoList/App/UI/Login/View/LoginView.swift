//
//  LoginLoginView.swift
//  GitRepoList
//
//  Created by shoutokobayashi on 2021/02/28.
//  Copyright 2021 Shoto Kobayashi. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var store: Store
    
    @ObservedObject var loginViewModel = LoginViewModel()

    var body: some View {
        VStack {
            TextField("ユーザ名", text: $loginViewModel.username)
            TextField("パスワード", text: $loginViewModel.password)
            
            Text(loginViewModel.error)
                .padding(.top)
            
            Button("ログイン") {
                loginViewModel.login()
            }
            .padding(.top)
        }
        .onAppear {
            loginViewModel.store = store
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
