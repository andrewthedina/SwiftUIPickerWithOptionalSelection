//
//  ContentView.swift
//  SwiftUIPickerWithOptionalSelection
//
//  Created by Andrew Dina on 7/7/20.
//  Copyright © 2020 Andrew Dina. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: String? = nil
    
    let items = ["Item A", "Item B", "Item C"]
    
    var body: some View {
        NavigationView {
            Form {
                Picker(selection: $selection, label: Text("Picker with optional binding")) {
                    /* Begin option 1: nil by SELECTION */
                    
                    Text("[none]").tag(nil as String?)
                        .foregroundColor(.red)
                    
                    /* End option 1 */

                    ForEach(items, id: \.self) { item in
                        Text(item).tag(item as String?)
                        // Tags must be cast to same type as Picker selection ($selection)
                    }
                }
                /* Begin option 2: NIL BY BUTTON ACTION */
                
//                if selection != nil { // "Remove item" button only appears if selection is not nil
//                    Button("Remove item") {
//                        self.selection = nil
//                    }
//                }
                
                /* End Options 2 */
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
