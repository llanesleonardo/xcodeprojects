//
//  FirstSwiftUINavigationStack.swift
//  NightWatch
//
//  Created by Leonardo Llanes on 5/27/24.
//

import SwiftUI

struct FirstSwiftUINavigationStack: View {
    var body: some View {
        NavigationStack{
            NavigationLink {
                HStack{
                    Text("Destination")
                }
                .navigationTitle(Text("Dest"))
            } label: {
                Text("Navigate")
            }
            .navigationTitle(Text("Home"))
        }
    }
}

#Preview {
    FirstSwiftUINavigationStack()
}
