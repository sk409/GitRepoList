//
//  SplashSplashView.swift
//  GitRepoList
//
//  Created by shoutokobayashi on 2021/02/28.
//  Copyright 2021 Shoto Kobayashi. All rights reserved.
//

import SwiftUI

struct SplashView: View {
    @EnvironmentObject var store: Store
    
    @ObservedObject var splashViewModel = SplashViewModel()

    var body: some View {
        VStack {
            Text("Splash")
        }
        .onAppear {
            splashViewModel.store = store
            splashViewModel.start()
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
