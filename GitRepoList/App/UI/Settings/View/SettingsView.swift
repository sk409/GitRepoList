//
//  SettingsSettingsView.swift
//  GitRepoList
//
//  Created by shoutokobayashi on 2021/02/28.
//  Copyright 2021 Shoto Kobayashi. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var store: Store

    @ObservedObject var settingsViewModel = SettingsViewModel()

    var body: some View {
        NavigationView {
        }
        .onAppear {
            settingsViewModel.store = store
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
