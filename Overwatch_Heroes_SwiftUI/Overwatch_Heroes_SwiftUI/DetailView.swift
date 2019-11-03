//
//  DetailView.swift
//  Overwatch_Heroes_SwiftUI
//
//  Created by pook on 11/2/19.
//  Copyright © 2019 pookjw. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    @Environment(\.editMode) var mode
    @EnvironmentObject var userData: userData
<<<<<<< HEAD
    @State var hero: Hero
=======

    var hero: Hero
>>>>>>> af89b8b4ccd9647995becec6af31cfacd7aed674
    var heroIndex: Int{
        self.userData.heroData.firstIndex(where: {$0.id == hero.id})!
    }
    
    var body: some View {
<<<<<<< HEAD
        VStack{
            if self.mode?.wrappedValue == .inactive{
                List{
                    Text("ID: \(self.userData.heroData[heroIndex].id)")
                        .bold()
                        .font(.title)
                    Text("name: \(self.userData.heroData[heroIndex].name)")
                    Text("description: \(self.userData.heroData[heroIndex].description)")
                    Text("category: \(self.userData.heroData[heroIndex].category.rawValue)")
                    Text("favorite: \(String(self.userData.heroData[heroIndex].favorite))")
                    Text("health: \(self.userData.heroData[heroIndex].health)")
=======
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
>>>>>>> af89b8b4ccd9647995becec6af31cfacd7aed674
                    HStack{
                        Text("difficulty:")
                        DifficultyView(hero: self.userData.heroData[heroIndex])
                    }
                }
            }else{
                DetailEditorView(draft: $hero)
                .onAppear(){
                        self.hero = self.userData.heroData[self.heroIndex]
                }
                .onDisappear(){
                    self.userData.heroData[self.heroIndex] = self.hero
                }
            }
<<<<<<< HEAD
        }
            .navigationBarTitle("Details")
            .navigationBarItems(trailing: EditButton())
            
=======
            
        }.navigationBarTitle(Text(hero.name), displayMode: .inline)
>>>>>>> af89b8b4ccd9647995becec6af31cfacd7aed674
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(hero: heroes[0])
    }
}
