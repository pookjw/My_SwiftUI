//
//  DifficultyView.swift
//  Overwatch_Heroes_SwiftUI
//
//  Created by pook on 10/30/19.
//  Copyright © 2019 pookjw. All rights reserved.
//

import SwiftUI

struct DifficultyView: View {
    @EnvironmentObject var userData: userData
    var hero: Hero
    var heroIndex: Int {
        self.userData.heroData.firstIndex(where: {$0.id == hero.id})!
    }
    var body: some View {
        HStack{
            ForEach((1...(self.userData.heroData[heroIndex].difficulty)), id: \.self) {_ in
                Image(systemName: "star.fill")
                    .foregroundColor(Color.yellow)
            }
            
            if (self.userData.heroData[heroIndex].difficulty) != 3{
                
                ForEach((1...(3-(self.userData.heroData[heroIndex].difficulty))), id: \.self) {_ in
                    Image(systemName: "star")
                }
            }
        }
    }
}

struct DifficultyView_Previews: PreviewProvider {
    static var previews: some View {
        DifficultyView(hero: heroes[1])
    }
}
