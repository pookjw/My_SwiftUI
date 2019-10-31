//
//  HomeView.swift
//  Test1
//
//  Created by pook on 10/29/19.
//  Copyright © 2019 pookjw. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var userData: userData
    @State var showLogoSheet = false
    
    var category: [String: [Hero]]{
        Dictionary(
            grouping: heroes,
            by: {$0.category.rawValue}
        )
    }
    
    var logoButton: some View{
        Button(action: {self.showLogoSheet.toggle()}){
            Image("logo")
                .renderingMode(.original)
                .resizable()
                .frame(width: 30, height: 30)
                .shadow(radius: 15)
        }
    }
    
    var body: some View {
        NavigationView{
            List{
                Toggle(isOn: $userData.showLegacyList){
                    Text("Show With Lagacy List")
                }
                if self.userData.showLegacyList{
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
                }else{
                    Group{
                        CategoryView(categoryName: "Favorited", items: self.userData.heroData.filter{$0.favorite})
                            .listRowInsets(EdgeInsets())
                        ForEach(self.category.keys.sorted(), id: \.self){ value in
                            CategoryView(categoryName: value, items: self.category[value]!)
                        }
                    }
                        .listRowInsets(EdgeInsets())
                    
                }
            }
                .navigationBarTitle(Text("Overwatch Heroes"))
            .navigationBarItems(trailing: HStack{
                Text("View Logo")
                    .font(.footnote)
                logoButton
            })
                .sheet(isPresented: $showLogoSheet){
                    LogoView()
                }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
