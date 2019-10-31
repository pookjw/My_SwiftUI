//
//  Logo.swift
//  Overwatch_Heroes_SwiftUI
//
//  Created by pook on 10/30/19.
//  Copyright © 2019 pookjw. All rights reserved.
//

import SwiftUI

struct Logo: View {
    var lineWidth: CGFloat
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
            .overlay(Circle().stroke(Color.gray, lineWidth: self.lineWidth))
            .scaledToFit()
        }
    }
}

struct LogoView: View{
    var lineWidth: CGFloat = 40
    @EnvironmentObject var userData: userData
    var body: some View{
        VStack{
            Spacer()
                .frame(height: 30)
            Button(action: {self.userData.showLogoSheet.toggle()}){
                HStack{
                    Spacer()
                    Text("Close")
                    Spacer()
                        .frame(width: 30)
                }
                
                    
            }
            Spacer()
                .frame(height: 100)
            Image("logo")
                .resizable()
                .frame(width: 200, height: 200)
            Spacer()
                .frame(height: 50)
            Text("Official Logo")
            Logo(lineWidth: self.lineWidth).scaleEffect(1.0/1.5)
            Text("With SwiftUI Geometry")
            Spacer()
                .frame(height: 30)
        }
    }
}

struct LogoView_Previews: PreviewProvider {
    static var previews: some View {
        LogoView()
    }
}
