//
//  HeroView.swift
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

struct HeroView: View {
    //@State var showDetail = false
    @EnvironmentObject var userData: userData

    let hero: Hero
    var heroIndex: Int{
        userData.heroData.firstIndex(where: {$0.id == hero.id})!
    }
    var body: some View {
         ScrollView(.vertical, showsIndicators: true){
 
            Image(self.userData.heroData[heroIndex].backgroundImage)
                .resizable()
                .frame(width: 1600/3, height: 300)
                //.edgesIgnoringSafeArea(.top)
            ProfileImageView(hero: self.userData.heroData[heroIndex], lineWidth: 6)
                .offset(y: 50)
                .padding(.bottom, 50)

            Text(self.userData.heroData[heroIndex].name)
                .font(.largeTitle)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)

            Text("\"\(self.userData.heroData[heroIndex].description.uppercased())\"")
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
            
            NavigationLink(destination: DetailView(hero: self.hero)){
                /*
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
 */
                Image(systemName: "chevron.right.circle")
                    .imageScale(.large)
                    .scaleEffect(1.5)
                    .padding()
                Text("Show Details")
                Image(systemName: "chevron.right.circle")
                    .imageScale(.large)
                    .scaleEffect(1.5)
                    .padding()
            }
            Spacer()
         }.navigationBarTitle(Text(self.userData.heroData[heroIndex].name), displayMode: .inline)
    }
}

struct HeroView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            HeroView(hero: heroes[0])
            HeroView(hero: heroes[1])
        }
    }
}
