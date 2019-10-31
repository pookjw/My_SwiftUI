//
//  DetailView.swift
//  Overwatch_Heroes_SwiftUI
//
//  Created by pook on 10/29/19.
//  Copyright © 2019 pookjw. All rights reserved.
//

import SwiftUI

extension AnyTransition{
    static var FadeAndMove: AnyTransition{
        let start = AnyTransition.scale
            .combined(with: .opacity)
        //let end = AnyTransition.move(edge: .trailing)
            .combined(with: .opacity)
        return .asymmetric(insertion: start, removal: start)
    }
}

struct DetailView: View {
    @State var showDetail = false
    @EnvironmentObject var userData: userData

    var hero: Hero
    var heroIndex: Int{
        userData.heroData.firstIndex(where: {$0.id == hero.id})!
    }
    var body: some View {
         ScrollView(.vertical, showsIndicators: true){
            Image(hero.backgroundImage)
                .resizable()
                .scaledToFit()
                //.frame(width: 1600/3, height: 300)
                //.edgesIgnoringSafeArea(.top)
            ProfileImageView(hero: hero, lineWidth: 6)
                .offset(y: 50)
                .padding(.bottom, 50)

            Text(hero.name)
                .font(.largeTitle)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)

            Text(hero.description)
                .font(.caption)
                .fontWeight(.ultraLight)
                .multilineTextAlignment(.center)
            Spacer()
                .frame(height: 15)
            Button(action: {self.userData.heroData[self.heroIndex].favorite.toggle()}){
                if userData.heroData[heroIndex].favorite{
                    Image(systemName: "star.fill")
                        .foregroundColor(Color.yellow)
                        .scaleEffect(userData.heroData[heroIndex].favorite ? 1.5 : 1 )
                }else{
                    Image(systemName: "star")
                        .foregroundColor(Color.gray)
                }
            }
            Spacer()
                .frame(height: 30)
            
            Button(action: {withAnimation{self.showDetail.toggle()}}){
                Image(systemName: "chevron.left.circle")
                    .imageScale(.large)
                    .rotationEffect(.degrees(self.showDetail ? (-90) : 0))
                    .scaleEffect(self.showDetail ? 1.5 : 1)
                    .padding()
                    .animation(.easeOut)
                Text("Show Details")
                Image(systemName: "chevron.right.circle")
                    .imageScale(.large)
                    .rotationEffect(.degrees(self.showDetail ? 90 : 0))
                    .scaleEffect(self.showDetail ? 1.5 : 1)
                    .padding()
                    .animation(.easeOut)
            }
            
            if showDetail{
                VStack{
                    Text("Category: \(hero.category.rawValue)")
                    Text("Health: \(hero.health)")
                    HStack{
                        Text("Difficulty:")
                        DifficultyView(hero: hero)
                    }.padding()
                }.transition(.FadeAndMove)
            }
            
        }.navigationBarTitle(Text(hero.name), displayMode: .inline)
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
