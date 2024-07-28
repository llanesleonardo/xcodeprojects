//
//  FirstSwiftUITab.swift
//  NightWatch
//
//  Created by Leonardo Llanes on 5/27/24.
//

import SwiftUI

struct FirstSwiftUITab: View {
    var body: some View {
        TabView(){
            HomeView().tabItem {
                Image(systemName: "house")
                Text("Tab 1")
            }
            
            MapView().tabItem {
                Image(systemName: "map")
                Text("Tab 2")
            }
            SettingsView().tabItem {
                Image(systemName: "gear")
                Text("Tab 3")
            }
            
        }
    }
}


struct HomeView: View {
    var body: some View {
        Text("Tab 1 Detail");
    }
}


struct MapView: View {
    var body: some View {
        Text("Tab 2 Detail");
    }
}


struct SettingsView: View {
    var body: some View {
        Text("Tab 3 Detail");
    }
}

#Preview {
    FirstSwiftUITab()
}
