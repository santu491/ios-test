//
//  ProfileOptionRowView.swift
//  Airbnb
//
//  Created by Santosh Kumar Madugula on 22/08/26.
//

import SwiftUI

struct ProfileOptionRowView: View {
    let image: String
    let title: String
    var body: some View {
        VStack{
            HStack{
                Image(systemName: image)
                    .resizable()
                    .frame(width: 20, height: 20)

                Text(title)
                    .font(.system(size: 16, weight: .medium, design: .rounded))
                    .foregroundColor(.primary)
                Spacer()
                Image(systemName: "chevron.right")
                    .resizable()
                    .frame(width: 10, height: 10)
            }
            .padding(.vertical)
            Divider()
        }
    }
}

#Preview {
    ProfileOptionRowView(image:"gear", title:"Settings")
}
