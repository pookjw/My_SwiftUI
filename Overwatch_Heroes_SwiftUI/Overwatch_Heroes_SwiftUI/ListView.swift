//
//  ListView.swift
//  Test1
//
//  Created by pook on 10/29/19.
//  Copyright © 2019 pookjw. All rights reserved.
//

import SwiftUI

struct ListView: View {
    let hero : [Hero]
    var body: some View {
        NavigationView{
            List(hero){ value in
                NavigationLink(destination: DetailView(hero: value)){
                    RowView(hero: value)
                }
            }.navigationBarTitle(Text("Overwatch Heroes"))
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(hero: heroes)
    }
}
