//
//  SearchAndFilterBar.swift
//  Airbnb
//
//  Created by Santosh Kumar Madugula on 22/08/26.
//

import SwiftUI

struct SearchAndFilterBar: View {
    @StateObject var viewModel: ExploreViewModel
    var body: some View {
        HStack{
            Image(systemName: "magnifyingglass")
            VStack(alignment:.leading,spacing:2){
                Text("\(!viewModel.searchLocation.isEmpty ? viewModel.searchLocation: "Where to go?")")
                    .font(.footnote)
                    .fontWeight(.semibold)
                Text("Any where - Any week - Add guests")
                    .foregroundStyle(.gray)
            }
            Spacer()
            
            Button {
                
            } label: {
                Image(systemName: "line.3.horizontal.decrease.circle")
                    .foregroundColor(Color.black)
            }
        }
        .padding(.vertical,8)
        .padding(.horizontal)
        .overlay{
            Capsule()
                .stroke(lineWidth: 0.5)
                .foregroundColor(Color(.systemGray))
                .shadow(color:.black.opacity(0.1), radius: 2)
        }
       
    }
}

#Preview {
    SearchAndFilterBar(viewModel: ExploreViewModel(service: ExploreService()))
}
