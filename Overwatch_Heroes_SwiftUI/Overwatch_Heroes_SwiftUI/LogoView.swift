//
//  Logo.swift
//  Overwatch_Heroes_SwiftUI
//
//  Created by pook on 10/30/19.
//  Copyright © 2019 pookjw. All rights reserved.
//

import SwiftUI

struct Logo: View {
    var body: some View {
        GeometryReader{ geometry in
            Path{ path in
                let width = min(geometry.size.width, geometry.size.height)
                let height = width
                let spacer_1 = width / 2.1
                let spacer_2 = width / 2.8
                let spacer_4 = height / 4.5
                let spacer_5 = height / 2.0
                let spacer_6 = height / 8.0
                path.move(to: CGPoint(x: spacer_1, y: spacer_4))
                path.addLines([
                    CGPoint(x: spacer_1, y: spacer_4),
                    CGPoint(x: spacer_2, y: spacer_5),
                    CGPoint(x: 0.0, y: height - spacer_6),
                    CGPoint(x: 0.0, y: height),
                    CGPoint(x: spacer_1, y: spacer_5 + spacer_6)
                ])
                
                path.move(to: CGPoint(x: width - (spacer_1), y: spacer_4))
                path.addLines([
                    CGPoint(x: width - spacer_1, y: spacer_4),
                    CGPoint(x: width - spacer_2, y: spacer_5),
                    CGPoint(x: width, y: height - spacer_6),
                    CGPoint(x: width, y: height),
                    CGPoint(x: width - spacer_1, y: spacer_5 + spacer_6)
                ])
            }
            .fill(Color.gray)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.gray, lineWidth: 20))
            .scaledToFit()
        }
    }
}

struct LogoView: View{
    @Binding var showLogoSheet: Bool
    
    var toggleButton: some View{
        Button(action: {self.showLogoSheet.toggle()}){
            Image(systemName: "xmark")
        }
    }
    
    var body: some View{
        NavigationView{
            VStack{
                Spacer()
                    .frame(height: 100)
                Image("logo")
                    .resizable()
                    .frame(width: 300, height: 300)
                Spacer()
                    .frame(height: 50)
                Text("Official Logo")
                Logo().scaleEffect(1.0/1.5)
                Text("With SwiftUI Geometry")
            }
        .navigationBarTitle(Text("Logo"))
        .navigationBarItems(trailing: toggleButton)
        }
    }
}

