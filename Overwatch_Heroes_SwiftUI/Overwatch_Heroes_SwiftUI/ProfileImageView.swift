//
//  ProfileImageView.swift
//  Overwatch_Heroes_SwiftUI
//
//  Created by pook on 10/31/19.
//  Copyright © 2019 pookjw. All rights reserved.
//

import SwiftUI

struct ProfileImageView: View {
    var hero: Hero
    var size: CGFloat = 180
    var lineWidth: CGFloat
    var body: some View {
        Image(hero.profileImage)
            .resizable()
            .frame(width: size, height: size)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.gray, lineWidth: lineWidth))
            .shadow(radius: 15)
    }
}

struct ProfileImageView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileImageView(hero: heroes[9], size: 50, lineWidth: 3.0)
    }
}
