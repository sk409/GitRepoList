//
//  MainMainViewModel.swift
//  GitRepoList
//
//  Created by shoutokobayashi on 2021/02/28.
//  Copyright 2021 Shoto Kobayashi. All rights reserved.
//

import Combine
import Foundation

class MainViewModel: ObservableObject, Identifiable {
    @Published var mainRepresenter = MainRepresenter()
    
    var store: Store!

    private var mainRepository = MainRepository()
    private var disposables = Set<AnyCancellable>()
}
