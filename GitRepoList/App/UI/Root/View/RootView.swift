//
//  RootRootView.swift
//  GitRepoList
//
//  Created by shoutokobayashi on 2021/02/28.
//  Copyright 2021 Shoto Kobayashi. All rights reserved.
//

import SwiftUI

struct RootView: View {
    @EnvironmentObject var store: Store
    @ObservedObject var rootViewModel = RootViewModel()

    var body: some View {
        ZStack {
            if !store.isSplashShown {
                SplashView()
            } else if !store.loggedIn {
                LoginView()
            } else {
                MainView()
            }
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
