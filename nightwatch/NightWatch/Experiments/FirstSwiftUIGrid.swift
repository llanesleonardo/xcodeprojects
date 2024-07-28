//
//  FirstSwiftUIGrid.swift
//  NightWatch
//
//  Created by Leonardo Llanes on 5/27/24.
//

import SwiftUI

struct FirstSwiftUIGrid: View {
    
    
    let nightlyTasks = [
        "Check all the windows",
        "Check all the doors",
        "Check all the windows2",
        "Check all the windows3",
        "Check all the doors2",
        "Check all the windows4",
    ]
    
    
    let rows: [GridItem] = [
        GridItem(.fixed(100)),
        GridItem(.fixed(100)),
        GridItem(.fixed(100))
        
    ]
    
    let columns: [GridItem] = [
        GridItem(.fixed(100)),
        GridItem(.fixed(100)),
        GridItem(.fixed(100))
    ]
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: rows) {
                ForEach(nightlyTasks, id: \.self) {taskName in
                        Text(taskName)
                }
            }
        }
        
        ScrollView {
            LazyVGrid(columns: columns){
                ForEach(nightlyTasks, id: \.self) {taskName in
                        Text(taskName)
                }
            }
        }
    }
}

#Preview {
    FirstSwiftUIGrid()
}
