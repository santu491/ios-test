//
//  WishlistView.swift
//  Airbnb
//
//  Created by Santosh Kumar Madugula on 22/08/26.
//

import SwiftUI

struct WishlistView: View {
    var body: some View {
        NavigationStack{
            VStack(alignment:.leading,spacing:32){
//                Text("Wishlists")
//                    .font(.largeTitle)
//                    .fontWeight(.semibold)
//                
                VStack(alignment:.leading,spacing:4){
                    Text("log in to View your wishlist")
                        .font(.title2)
                        .fontWeight(.semibold)
                    Text("You can create, view or edit wishlists once you've logged in.")
                    
                }
                .padding()
                
                Button(action: {}) {
                    Text("Log in")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame( width:360, height: 42)
                        .background(.pink)
                        .cornerRadius(10)
                }
                Spacer()
            }
            
            .navigationTitle("Wishlists")
        }
        
    }
}

#Preview {
    WishlistView()
}
