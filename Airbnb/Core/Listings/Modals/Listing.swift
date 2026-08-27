//
//  Listing.swift
//  Airbnb
//
//  Created by Santosh Kumar Madugula on 23/08/26.
//

import Foundation


struct Listing:Identifiable, Codable, Hashable {
    let id: String;
    let ownerUid: String;
    let ownerName: String;
    let ownerImageUrl:String;
    let numberOfBedrooms: Int;
    let numberOfBathrooms: Int;
    let numberOfGuests: Int;
    let numberOfBeds: Int;
    var pricePerNight: Int;
    let latitude: Double;
    let longitude: Double;
    let address: String;
    let city: String;
    let state: String;
    let title: String;
    let rating: Double;
    var features: [ListingFeatures];
    var amenities: [ListingAmenities];
    let type: ListingType;
    let imageUrls: [String];
}


enum ListingFeatures: Int, Codable, Hashable, Identifiable {
    case selfieCheckin
    case superHost
    var id: Int { self.rawValue }
    
    var imageName: String{
        switch self{
        case .selfieCheckin: return "door.left.hand.open"
        case .superHost: return "medal"
        }
    }
    
    var title: String{
        switch self{
        case .selfieCheckin: return "Selfie Check-in"
        case .superHost: return "Superhost"
        }
    }
    
    var subTitle:String{
        switch self{
        case .selfieCheckin: return "Check yourself in with the keypad"
        case .superHost: return "Super host are experienced, highly-rated hosts who are commited to providing exceptional customer service"
        }
    }
}


enum ListingAmenities: Int, Codable, Hashable, Identifiable {
    case pool
    case kitchen
    case wifi
    case laundry
    case tv
    case alarmSystem
    case office
    case balcony
    
    var id: Int { self.rawValue }
    
    var title:String{
        switch self {
        case .pool: return "Pool"
        case .kitchen: return "Kitchen"
        case .wifi: return "Wifi"
        case .laundry: return "Laundry"
        case .tv: return "Tv"
        case .alarmSystem: return "Alarm System"
        case .office: return "Office"
        case .balcony: return "Balcony"
        }
    }
    
    var imageName:String{
        switch self {
        case .pool: return "figure.pool.swim"
        case .kitchen: return "fork.knife"
        case .wifi: return "wifi"
        case .laundry: return"washer"
        case .tv: return "tv"
        case .alarmSystem: return "checkboard.shield"
        case .office: return "pencil.and.ruler.fill"
        case .balcony: return "building"
        }
    }
}


enum ListingType: Int, Codable, Identifiable, Hashable {
    case apartment
    case house
    case villa
    case townhouse
    var id: Int { self.rawValue }
    
    var description:String{
        switch self {
        case .apartment: return "Apartment"
        case .house: return "House"
        case .villa: return "Villa"
        case .townhouse: return "Townhouse"
        }
    }
    
}
