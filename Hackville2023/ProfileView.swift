//
//  ProfileView.swift
//  Hackville2023
//
//  Created by Roop Malhans on 2023-02-11.
//

import SwiftUI

struct ProfileView: View {
    @State var username:String = ""
    @State var password:String = ""

    var body: some View {
        NavigationView{
        VStack{
            Image("logo")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 170,height: 170)
                .clipped()
                .cornerRadius(150)
                .padding(.bottom,75)
            TextField("Username", text:$username)
                .padding().background(Color(.systemGray6))
                .cornerRadius(5.0)
                .frame(width:350)
                .padding(.bottom,20)
            
            SecureField("Password", text:$password)
                .padding().background(Color(.systemGray6))
                .cornerRadius(5.0)
                .frame(width:350)
                .padding(.bottom,20)
            
        
                NavigationLink(destination: HomeView()){
                    Text("LOGIN")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width:220,height: 60)
                        .background(.black)
                        .cornerRadius(5.0)
                }
            }
            
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
