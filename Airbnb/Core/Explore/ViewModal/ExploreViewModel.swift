//
//  ExploreViewModal.swift
//  Airbnb
//
//  Created by Santosh Kumar Madugula on 23/08/26.
//

import Foundation
import Combine

class ExploreViewModel: ObservableObject {
//    let objectWillChange: ObservableObjectPublisher
    
//    let objectWillChange: ObservableObjectPublisher
    
    
    @Published var listings: [Listing] = [];
    private let service:ExploreService
   @Published var searchLocation:String=""
    private var listingCopy: [Listing] = []
    
    init(service:ExploreService){
        self.service = service
        Task{
            await fetchListings()
        }
        
    }
    
//    print("Search location.........:\(searchLocation)")
    
    func fetchListings() async{
        
        do{
            self.listings = try await service.fetchListing()
            self.listingCopy=listings
        print("listings.....\(listings)")
            
        }
        catch{
            print("debugging: failed to fetch list: \(error.localizedDescription)")
        }
    }
    
    func updateListingForLocation(){
        let filteredList=listings.filter({$0.city.lowercased() == searchLocation.lowercased() || $0.state.lowercased() == searchLocation.lowercased() })
        self.listings = filteredList.isEmpty ? listingCopy : filteredList
    }
    
}
