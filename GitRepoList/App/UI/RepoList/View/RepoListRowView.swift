//
//  RepoListRowView.swift
//  GitRepoList
//
//  Created by 小林聖人 on 2021/02/28.
//

import SwiftUI

struct RepoListRowView: View {
    let name: String
    let description: String
    let ownerName: String
    let ownerAvatarData: Data
    
    var body: some View {
        HStack {
            VStack {
                Image(uiImage: UIImage(data: ownerAvatarData)!)
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 100, height: 100)
                
                Text(ownerName)
                    .padding(.top)
            }
            
            VStack {
                Text(name)
                    .font(.title3)
                
                Text(description)
                    .font(.body)
                    .padding(.top)
            }
        }
    }
}

struct RepoListRowView_Previews: PreviewProvider {
    static var previews: some View {
        RepoListRowView(
            name: "repository",
            description: "description",
            ownerName: "owner",
            ownerAvatarData: try! Data(contentsOf: URL(string: "https://placekitten.com/600/600")!)
        )
    }
}
