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
    @State var hero: Hero
    var heroIndex: Int{
        self.userData.heroData.firstIndex(where: {$0.id == hero.id})!
    }
    
    var body: some View {
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
        }
            .navigationBarTitle("Details")
            .navigationBarItems(trailing: EditButton())
            
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(hero: heroes[0])
    }
}
