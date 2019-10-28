//
//  RowView.swift
//  Test1
//
//  Created by pook on 10/29/19.
//  Copyright © 2019 pookjw. All rights reserved.
//

import SwiftUI

struct RowView: View {
    let hero: Hero
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
