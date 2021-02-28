//
//  MainMainView.swift
//  GitRepoList
//
//  Created by shoutokobayashi on 2021/02/28.
//  Copyright 2021 Shoto Kobayashi. All rights reserved.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var store: Store
    
    @ObservedObject var mainViewModel = MainViewModel()

    var body: some View {
        TabView {
            NavigationView {
                RepoListView()
            }
            .tabItem {
                Image(systemName: "cloud")
                Text("リポジトリ")
            }
            .tag(0)
            
            SettingsView()
                .tabItem {
                    Image(systemName: "gearshape")
                    Text("設定")
                }
                .tag(1)
        }
        .onAppear {
            mainViewModel.store = store
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
