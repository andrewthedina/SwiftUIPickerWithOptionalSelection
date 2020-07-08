//
//  ContentView.swift
//  SwiftUIPickerWithOptionalSelection
//
//  Created by Andrew Dina on 7/7/20.
//  Copyright © 2020 Andrew Dina. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var selectionOne: String? = nil
    @State private var selectionTwo: String? = nil
    
    let items = ["Item A", "Item B", "Item C"]
    
    var body: some View {
        NavigationView {
            Form {
                // MARK: - Option 1: NIL by SELECTION
                Picker(selection: $selectionOne, label: Text("Picker with option to select nil item [none]")) {
                    Text("[none]").tag(nil as String?)
                        .foregroundColor(.red)

                    ForEach(items, id: \.self) { item in
                        Text(item).tag(item as String?)
                        // Tags must be cast to same type as Picker selection
                    }
                }
                
                // MARK: - Option 2: NIL by BUTTON ACTION
                Picker(selection: $selectionTwo, label: Text("Picker with Button that removes selection")) {
                    ForEach(items, id: \.self) { item in
                        Text(item).tag(item as String?)
                        // Tags must be cast to same type as Picker selection
                    }
                }
                
                if selectionTwo != nil { // "Remove item" button only appears if selection is not nil
                    Button("Remove item") {
                        self.selectionTwo = nil
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
