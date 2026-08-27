//
//  DeveloperPreview.swift
//  Airbnb
//
//  Created by Santosh Kumar Madugula on 23/08/26.
//

import Foundation

class DeveloperPreview{
    static let shared: DeveloperPreview = DeveloperPreview()
    var listings: [Listing]=[
        Listing(
            id: NSUUID().uuidString,
                   ownerUid: NSUUID().uuidString,
                   ownerName: "John Doe",
                   ownerImageUrl: "male-profile-photo",
                   numberOfBedrooms: 2,
                   numberOfBathrooms: 1,
                   numberOfGuests: 4,
                   numberOfBeds: 2,
                   pricePerNight: 120,
                   latitude: 37.7749,
                   longitude: -122.4194,
                   address: "123 Market Street",
                   city: "San Francisco",
                   state: "California",
                   title: "Modern apartment in downtown San Francisco",
                   rating: 4.8,
                   features: [.selfieCheckin, .superHost],
                   amenities: [.wifi, .kitchen, .tv, .laundry],
                   type: .apartment,
            imageUrls:[
                "listing-2",
                "listing-3",
                "listing-1",
                "listing-4",
            ]
               ),
               
               Listing(
                id: NSUUID().uuidString,
                       ownerUid: NSUUID().uuidString,
                   ownerName: "Sarah Williams",
                   ownerImageUrl: "female-profile-photo",
                   numberOfBedrooms: 3,
                   numberOfBathrooms: 2,
                   numberOfGuests: 6,
                   numberOfBeds: 4,
                   pricePerNight: 250,
                   latitude: 34.0522,
                   longitude: -118.2437,
                   address: "456 Sunset Boulevard",
                   city: "Los Angeles",
                   state: "California",
                   title: "Beautiful house with a private pool",
                   rating: 4.9,
                   features: [.superHost],
                   amenities: [.pool, .wifi, .kitchen, .tv, .balcony],
                   type: .house,
                imageUrls:[
                    "listing-1",
                    "listing-3",
                    "listing-2",
                    "listing-4",
                ]
               ),
               
               Listing(
                id: NSUUID().uuidString,
                       ownerUid: NSUUID().uuidString,
                   ownerName: "Michael Brown",
                   ownerImageUrl: "male-profile-photo",
                   numberOfBedrooms: 4,
                   numberOfBathrooms: 3,
                   numberOfGuests: 8,
                   numberOfBeds: 5,
                   pricePerNight: 450,
                   latitude: 25.7617,
                   longitude: -80.1918,
                   address: "789 Ocean Drive",
                   city: "Miami",
                   state: "Florida",
                   title: "Luxury beachfront villa",
                   rating: 5.0,
                   features: [.selfieCheckin, .superHost],
                   amenities: [.pool, .kitchen, .wifi, .laundry, .tv, .balcony],
                   type: .villa,
                imageUrls:[
                    "listing-3",
                    "listing-2",
                    "listing-1",
                    "listing-4",
                ]
               ),
               
               Listing(
                id: NSUUID().uuidString,
                       ownerUid: NSUUID().uuidString,
                   ownerName: "Emily Davis",
                   ownerImageUrl: "female-profile-photo",
                   numberOfBedrooms: 2,
                   numberOfBathrooms: 2,
                   numberOfGuests: 5,
                   numberOfBeds: 3,
                   pricePerNight: 180,
                   latitude: 40.7128,
                   longitude: -74.0060,
                   address: "22 Park Avenue",
                   city: "New York",
                   state: "New York",
                   title: "Cozy townhouse near Central Park",
                   rating: 4.7,
                   features: [.selfieCheckin],
                   amenities: [.wifi, .kitchen, .tv, .office, .alarmSystem],
                   type: .townhouse,
                imageUrls:[
                    "listing-4",
                    "listing-1",
                    "listing-3",
                    "listing-2",
                ]
               )
    ]
}
