//
//  DetailView.swift
//  Overwatch_Heroes_SwiftUI
//
//  Created by pook on 10/29/19.
//  Copyright © 2019 pookjw. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    let hero: Hero
    var body: some View {
        VStack{
            Image(hero.backgroundImage)
                .resizable()
                .frame(width: 1600/3, height: 300)
                .edgesIgnoringSafeArea(.top)
            Image(hero.profileImage)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.gray, lineWidth: 6))
                .shadow(radius: 15)
                .offset(y: -30)
                .padding(.bottom, -30)
            Text(hero.name)
                .font(.largeTitle)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
            Spacer()
                .frame(height: 100)
            Text("Category: \(hero.category.rawValue)")
            Text("Health: \(hero.health)")
                
            Spacer()
            
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            DetailView(hero: heroes[0])
            DetailView(hero: heroes[1])
        }
    }
}
