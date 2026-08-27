//
//  ListingDetailView.swift
//  Airbnb
//
//  Created by Santosh Kumar Madugula on 22/08/26.
//

import SwiftUI
import MapKit

struct ListingDetailView: View {
//    let listingItem:Listing
    let listingItem:Listing
    @State private var cameraPosition: MapCameraPosition
    
    init(listingItem:Listing){
        self.listingItem = listingItem
        let region=MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 25.7602, longitude: -80.1959),
            span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        )
        self._cameraPosition = State(initialValue: .region(region))
    }
    var body: some View {
        ScrollView() {
            ZStack(alignment:.topLeading){
                ListingImageCarouselView(listingItem: listingItem)
                    .frame(height:320)
            }
            
            VStack(alignment: .leading,spacing:2){
                Text(listingItem.title)
                    .font(.title3)
                    .fontWeight(.bold)
                HStack(){
                Image(systemName: "star.fill")
                    Text("\(listingItem.rating)")
                    Text(" - ")
                    Text("20 Reviews")
                        .underline()
                        
                }
                Text("\(listingItem.city), \(listingItem.state)")
            }
            .frame(maxWidth: .infinity,alignment:.leading)
            .padding(.leading)
            
            Divider()
            
            HStack{
                VStack(alignment:.leading,spacing: 4){
                    Text("Entire \(listingItem.type.description) hosted by \(listingItem.ownerName)")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .frame(width:250,alignment:.leading)
                       
                    HStack{
                        Text(". \(listingItem.numberOfGuests) Guests")
                        Text(". \(listingItem.numberOfBeds) bedrooms")
                        Text(". \(listingItem.numberOfBathrooms) bathrooms")
                    }
                    .font(.caption)
               
                }
                .frame(width:300, alignment:.leading)
                Spacer()
                Image("dhoni")
                    .resizable()
                    .scaledToFit()
                    .frame(width:80,height:80)
                    .clipShape(Circle())
            }
            .padding()
            
            Divider()
            
            VStack(alignment:.leading,spacing:16){
                ForEach(listingItem.features){ item in
                    HStack(spacing:12){
                        Image(systemName: item.imageName)
                        VStack(alignment: .leading){
                            Text(item.title)
                                .font(.footnote)
                                .fontWeight(.semibold)
                            Text(item.subTitle)
                                .foregroundStyle(.gray)
                                .font(.caption)
                        }
                    }
                  
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            
            Divider()
            
            VStack(alignment:.leading,spacing:16){
                Text("Where you'll sleep")
                    .font(.headline)
                
                ScrollView(.horizontal, showsIndicators: false){
                    HStack(spacing: 16){
                        
                    
                        ForEach(1 ..< listingItem.numberOfBedrooms,id: \.self){ room in
                            VStack(alignment:.leading){
                                Image(systemName:"bed.double")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                Text("Bed room \(room)")
                            }
                            .frame(width: 132, height: 100)
                            .overlay{
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(lineWidth: 1)
                                    .foregroundStyle(.gray)
                            }
                        
                        }
                        
                    }
                }
                .scrollTargetBehavior(.paging)
               
            }
            .padding()
            
            Divider()
            
            VStack(alignment:.leading, spacing:16){
                Text("What The Place is Offer")
                    .font(.headline)
                ForEach(listingItem.amenities){amenity in
                    HStack(spacing:16){
                        Image(systemName: amenity.imageName)
                            .frame(width:32)
                        Text(amenity.title)
                            .font(.footnote)
                        Spacer()
                    }
                    
                }
            }
            .padding()
            
            Divider()
            
            VStack(alignment: .leading, spacing: 16){
                Text("Where you'll be")
                    .font(.headline)
                Map(position: $cameraPosition)
                    .frame(height:200)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            }
            .padding()
        }
        .padding(.bottom,72)
        
        .overlay(alignment:.bottom){
            VStack{
                Divider()
                    .padding(.bottom)
            HStack{
                
                VStack(alignment:.leading, spacing:2){
                    Text("\(listingItem.pricePerNight)")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    Text("Total before tax")
                        .font(.footnote)
                    Text("Oct 15-20")
                        .underline()
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
                
                Spacer()
                
                Button(action: {}, label: {
                    Text("Reserve")
                        .frame(width:140, height:40)
                        .background(.pink)
                        .foregroundStyle(.white)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                    
                })
            }
            .padding(.horizontal,32)
            .padding(.bottom,16)
        }
            .background(.white)
        }
        .ignoresSafeArea()
        .toolbar(.hidden, for: .tabBar)
    
     
    }
}

#Preview {
    ListingDetailView(listingItem:DeveloperPreview.shared.listings[0])
}
