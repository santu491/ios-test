//
//  ExploreService.swift
//  Airbnb
//
//  Created by Santosh Kumar Madugula on 23/08/26.
//

import Foundation

class ExploreService{
    
    func fetchListing()async throws ->[Listing]{
        return DeveloperPreview.shared.listings
        
    }
}
