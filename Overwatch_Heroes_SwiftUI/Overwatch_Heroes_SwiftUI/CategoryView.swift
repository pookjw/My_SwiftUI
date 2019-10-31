//
//  CategoryView.swift
//  Overwatch_Heroes_SwiftUI
//
//  Created by pook on 10/31/19.
//  Copyright © 2019 pookjw. All rights reserved.
//

import SwiftUI

struct CategoryView: View {
    var categoryName: String
    var items: [Hero]
    
    var body: some View {
        VStack(alignment: .leading){
            Text(categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            ScrollView(.horizontal, showsIndicators: false){
                Spacer()
                    .frame(height: 30)
                HStack(alignment: .top, spacing: 30){
                    Spacer()
                        .frame(width: 3)
                    ForEach(self.items){ item in
                        NavigationLink(destination: DetailView(hero: item)){
                            ItemView(hero: item)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                    Spacer()
                        .frame(height: 50)
                }
            }
            Spacer()
                .frame(width: 30)
        }
    }
}

struct ItemView: View{
    var hero: Hero
    var body: some View{
        VStack{
            ProfileImageView(hero: hero, size: 100, lineWidth: 3)
            Spacer()
                .frame(height: 30)
            Text(hero.name)
                .multilineTextAlignment(.center)
        }
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            CategoryView(categoryName: "Support", items: heroes.filter{$0.category == .support})
            ItemView(hero: heroes[1])
        }

    }
}

