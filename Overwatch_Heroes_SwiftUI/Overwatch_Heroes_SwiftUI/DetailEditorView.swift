//
//  DetailEditor.swift
//  Overwatch_Heroes_SwiftUI
//
//  Created by pook on 11/2/19.
//  Copyright © 2019 pookjw. All rights reserved.
//

import SwiftUI

struct DetailEditorView: View {
    @Binding var draft: Hero
    var body: some View {
        List{
            HStack{
                Text("name").bold()
                Divider()
                TextField("name", text: $draft.name)
            }
        }
    }
}

