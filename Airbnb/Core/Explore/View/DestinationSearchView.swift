//
//  DestinationSearchView.swift
//  Airbnb
//
//  Created by Santosh Kumar Madugula on 22/08/26.
//

import SwiftUI

enum DestinationSearchOptions{
    case location
    case dates
    case guests
    
}

struct DestinationSearchView: View {
    @Binding var show:Bool
    @StateObject var viewModel: ExploreViewModel
    @State private var destination:String="" ;
    @State private var selectedOption:DestinationSearchOptions = .location
    @State private var startDate:Date = Date()
    @State private var endDate:Date = Date()
    @State private var guestCount:Int = 0

    
    var body: some View {
        VStack(alignment:.leading){
            HStack{
                Button(action: {
                    withAnimation(.snappy){
                
                        show.toggle()
                    }
                }, label: {
                    Image(systemName: "xmark.circle")
                        .imageScale(.large)
                        .foregroundStyle(.black)
                    
                })
                Spacer()
                if !viewModel.searchLocation.isEmpty{
                    Button(action: {
             viewModel.searchLocation = ""
                        viewModel.updateListingForLocation()
                    }, label: {
                        Text("Clear")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundStyle(.black)
                        
                    })
                }
            }
            .padding()
            
            VStack (spacing:50){
                
                VStack(alignment: .leading){
                    if selectedOption == .location{
                        Text("Where to go?")
                            .font(.title2)
                            .fontWeight(.semibold)
                        HStack{
                            Image(systemName: "magnifyingglass")
                            TextField("Search Destination",text:$viewModel.searchLocation)
                                .onSubmit {
                                    viewModel.updateListingForLocation()
                                    show.toggle()
                                }
                        }
                        .frame(height: 40)
                        .padding()
                        .overlay{
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(lineWidth: 1)
                                .foregroundColor(.gray)
                            
                        }
                    }
                    else{
                        CollapsedPickerView(title:"Where",desription: "Add Address")
                    }
                }
                .modifier(CollapsableViewModifier())
                .frame(height: selectedOption == .location ? 150:64)
                .onTapGesture {
                    withAnimation(.snappy){
                        selectedOption = .location
                    }
                }
                
                //----
                
                VStack(alignment: .leading){
                    if selectedOption == .dates{
                        Text("When is your's trip?")
                            .font(.title2)
                            .fontWeight(.semibold)
                        VStack{
                            DatePicker("From",selection: $startDate,displayedComponents: .date)
                            
                            Divider()
                            DatePicker("To", selection: $endDate, displayedComponents: .date)
                        }
                        .foregroundStyle(.gray)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    }
                    else{
                        
                        CollapsedPickerView(title:"When",desription: "Add Dates")
                        
                    }
                }
                .modifier(CollapsableViewModifier())
                .frame(height: selectedOption == .dates ? 180:64)
                .onTapGesture {
                    withAnimation(.snappy){
                        selectedOption = .dates
                    }
                }
                
                
                VStack {
                    if selectedOption == .guests{
                        VStack (alignment: .leading){
                            Text("Who is coming")
                                .font(.title2)
                                .fontWeight(.semibold)
                            
                            Stepper{
                                Text("\(guestCount) Adults")
                            }
                            onIncrement:{
                                guestCount+=1
                            }
                            onDecrement:{
                                guard guestCount > 0 else {return}
                                guestCount-=1
                                
                            }
                        }
                    }else{
                        CollapsedPickerView(title:"who",desription: "Add Guests")
                        
                    }
                }
                .modifier(CollapsableViewModifier())
                .frame(height: selectedOption == .guests ? 120:64)
                .onTapGesture {
                    withAnimation(.snappy){
                        selectedOption = .guests
                    }
                }
                Spacer()
            }
          
        }
    }

}

struct CollapsableViewModifier:ViewModifier{
    func body(content:Content) -> some View{
        content
            .padding()
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding()
            .shadow(radius: 10)
        
    }
}
    


struct CollapsedPickerView:View{
    let title:String
    let desription:String
    var body:some View{
        VStack{
            HStack{
                Text(title)
                    .foregroundStyle(.gray)
                Spacer()
               Button(action: {}, label: {
                   Text(desription)
                       .fontWeight(.semibold)
                       .foregroundStyle(.black)
               })
            }
            .padding()
            .fontWeight(.semibold)
            .font(.subheadline)
        }
    }
}

#Preview {
    DestinationSearchView(show: .constant(false),
                          viewModel: ExploreViewModel(service: ExploreService())
                          )
}
