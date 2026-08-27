//
//  MainTabView.swift
//  Airbnb
//
//  Created by Santosh Kumar Madugula on 22/08/26.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView{
            ExploreView()
                .tabItem{Label("Explore",systemImage: "magnifyingglass")}
            
            WishlistView()
                .tabItem{Label("WishLists",systemImage: "heart")}
            ProfileView()
                .tabItem{Label("Profile",systemImage: "person")}
            
            
        }
    }
}

#Preview {
    MainTabView()
}
