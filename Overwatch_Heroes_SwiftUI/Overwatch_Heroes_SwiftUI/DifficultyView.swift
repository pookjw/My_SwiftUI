//
//  DifficultyView.swift
//  Overwatch_Heroes_SwiftUI
//
//  Created by pook on 10/30/19.
//  Copyright © 2019 pookjw. All rights reserved.
//

import SwiftUI

struct DifficultyView: View {
    var hero: Hero
    var body: some View {
        HStack{
            ForEach((1...hero.difficulty), id: \.self) {_ in
                Image(systemName: "star.fill")
                    .foregroundColor(Color.yellow)
            }
            if hero.difficulty != 3{
                ForEach((1...3-hero.difficulty), id: \.self) {_ in
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
