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
                NavigationLink(destination: LogoView()){
                    HStack{
                        Image("logo")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .shadow(radius: 15)
                        Spacer()
                            .frame(width: 30)
                        Text("Logo").font(.largeTitle)
                        Spacer()
                    }.padding()
                }
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
            }.navigationBarTitle(
                Text("Overwatch Heroes")
            )
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
