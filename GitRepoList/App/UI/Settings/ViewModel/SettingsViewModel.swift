//
//  SettingsSettingsViewModel.swift
//  GitRepoList
//
//  Created by shoutokobayashi on 2021/02/28.
//  Copyright 2021 Shoto Kobayashi. All rights reserved.
//

import Combine
import Foundation

class SettingsViewModel: ObservableObject, Identifiable {
    var store: Store!

    private var settingsReducer = SettingsReducer()
    private var settingsRepository = SettingsRepository()

    private var cancellables = Set<AnyCancellable>()
}
