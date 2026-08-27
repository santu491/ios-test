//
//  ProfileView.swift
//  Airbnb
//
//  Created by Santosh Kumar Madugula on 22/08/26.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 32){
            VStack(alignment:.leading,spacing: 8){
                Text("Profile")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                Text("Log in to satrt planing your next trip")
            }
            Button(action: {}, label: {
                Text("Log in")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame(width:350,height:40)
                    .background(.pink)
                    .clipShape(RoundedRectangle(cornerRadius: 30))
            })
            
            HStack{
                Text("Don't have an account?")
                    
                Text("Sign up")
                    .fontWeight(.semibold)
                    .underline()
            }
            .font(.caption)
            
            VStack{
                ProfileOptionRowView(image: "gear", title: "Settings")
                ProfileOptionRowView(image: "gear", title: "Accessbility")
                ProfileOptionRowView(image:"questionmark.circle",title:"Visit the help center")
            }
        }
        .padding()
    }
}

#Preview {
    ProfileView()
}
