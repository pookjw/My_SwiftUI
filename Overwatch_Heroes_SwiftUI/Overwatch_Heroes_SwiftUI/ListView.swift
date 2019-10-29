//
//  ListView.swift
//  Test1
//
//  Created by pook on 10/29/19.
//  Copyright © 2019 pookjw. All rights reserved.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var userData: userData
    var body: some View {
        NavigationView{
            List{
                Toggle(isOn: $userData.showOnlyFavorite){
                    Text("Show Favorite Only")
                }
                ForEach(self.userData.heroData){ value in
                    if !self.userData.showOnlyFavorite || value.favorite{
                        NavigationLink(destination: DetailView(hero: value)){
                            RowView(hero: value)
                        }
                    }
                }
            }.navigationBarTitle(Text("Overwatch Heroes"))
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
