//
//  ListingView.swift
//  Airbnb
//
//  Created by Santosh Kumar Madugula on 22/08/26.
//

import SwiftUI

struct ListingItemView: View {
    let listItem:Listing

    var body: some View {
        VStack(spacing:8){
            
            ListingImageCarouselView(listingItem:listItem)
            .frame(height:320)
            .cornerRadius(16)
            
            
            
            HStack(alignment:.top){
                VStack(alignment:.leading){
                    Text("\(listItem.city), \(listItem.state)")
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                    
                    Text("12 miles away")
                        .foregroundStyle(.gray)
                    
                    Text("Nov 3-10")
                        .foregroundStyle(.gray)
                    HStack{
                        Text("\(listItem.pricePerNight)")
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                        Text("Night")
                            .foregroundColor(.black)
                    }
                }
                Spacer()
                
                HStack(){
                Image(systemName: "star.fill")
                    Text("\(listItem.rating)")
                        
                }
                .foregroundColor(.black)
            }
            .font(.footnote)
            
            
            
        }
    }
}

#Preview {
    ListingItemView(listItem:DeveloperPreview.shared.listings[0])
}
