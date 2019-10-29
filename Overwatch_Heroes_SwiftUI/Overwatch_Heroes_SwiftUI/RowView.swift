//
//  RowView.swift
//  Test1
//
//  Created by pook on 10/29/19.
//  Copyright © 2019 pookjw. All rights reserved.
//

import SwiftUI

struct RowView: View {
    @EnvironmentObject var userData: userData
    let hero: Hero
    var heroIndex: Int{
        userData.heroData.firstIndex(where: {$0.id == hero.id})!
    }
    var body: some View {
        HStack{
            Image(hero.name)
                .resizable()
                .frame(width: 50, height: 50)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.gray, lineWidth: 3))
                .shadow(radius: 15)
            Text(hero.name)
                .font(.largeTitle)
            Spacer()
            Button(action: {self.userData.heroData[self.heroIndex].favorite.toggle()}){
                if userData.heroData[heroIndex].favorite{
                    Image(systemName: "star.fill")
                        .foregroundColor(Color.yellow)
                }else{
                    Image(systemName: "star")
                        .foregroundColor(Color.gray)
                }
            }
        }.padding()
    }
}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            RowView(hero: heroes[0])
                .previewLayout(.fixed(width: 300, height: 70))
            RowView(hero: heroes[1])
            .previewLayout(.fixed(width: 300, height: 70))
        }
    }
}
