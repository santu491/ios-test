//
//  ExploreView.swift
//  Airbnb
//
//  Created by Santosh Kumar Madugula on 22/08/26.
//

import SwiftUI

struct ExploreView: View {
    @State private var showDestinationSeachView: Bool = false
    @StateObject var viewModel = ExploreViewModel(service: ExploreService())
    var body: some View {
 
        NavigationStack{
            if(showDestinationSeachView){
                DestinationSearchView(show:$showDestinationSeachView,viewModel: viewModel)
            }
            else{
                ScrollView{
                    
                    SearchAndFilterBar(viewModel: viewModel)
                        .onTapGesture {
                            withAnimation(.snappy){
                                showDestinationSeachView.toggle()
                            }
                        }
                    
                    LazyVStack{
                        ForEach(viewModel.listings){ listing in
//                        ForEach(0 ..< 5){ listing in
                            NavigationLink(value:listing){
                                ListingItemView(listItem:listing)
                                
                            }
                        }
                    }
                    .padding()
                }
                .navigationDestination(for: Listing.self){ listing in
                    
                         ListingDetailView(listingItem: listing)
                }
            }
        }
    }
}

#Preview {
    ExploreView()
}
