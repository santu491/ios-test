//
//  ListingImageCarouselView.swift
//  Airbnb
//
//  Created by Santosh Kumar Madugula on 22/08/26.
//

import SwiftUI

struct ListingImageCarouselView: View {
    let listingItem: Listing

    var body: some View {
        TabView{
            ForEach(listingItem.imageUrls, id:\.self){ image in
               Image(image)
                    .resizable()
                    .scaledToFill()
            }
        }
        .tabViewStyle(.page)
    }
}

#Preview {
    ListingImageCarouselView(listingItem: DeveloperPreview.shared.listings[0])
}
