//
//  RootRootViewModel.swift
//  GitRepoList
//
//  Created by shoutokobayashi on 2021/02/28.
//  Copyright 2021 Shoto Kobayashi. All rights reserved.
//

import Combine
import Foundation

class RootViewModel: ObservableObject, Identifiable {
    var store: Store!
    
    private var rootReducer = RootReducer()
    private var rootRepository = RootRepository()

    private var cancellables = Set<AnyCancellable>()
}
