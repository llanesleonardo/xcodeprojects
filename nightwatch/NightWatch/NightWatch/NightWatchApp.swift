//
//  NightWatchApp.swift
//  NightWatch
//
//  Created by Leonardo Llanes on 5/27/24.
//

import SwiftUI

@main
struct NightWatchApp: App {
    @State var nightWatchViewModel = NightWatchViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView(nightWatchViewModel:self.nightWatchViewModel)
         
        }
    }
}
