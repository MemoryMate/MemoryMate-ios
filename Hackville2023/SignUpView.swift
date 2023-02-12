//
//  ProfileView.swift
//  Hackville2023
//
//  Created by Roop Malhans on 2023-02-11.
//

import SwiftUI

struct SignUpView: View {
    @State var firstName:String = ""
    @State var lastName:String = ""
    @State var userName:String = ""
    @State var password:String = ""
    @State private var users: [User] = [User]()
    let coreDM: CoreDataManager
    @State private var animationAmount: CGFloat = 1
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
            TextField("First Name", text:$firstName)
                .padding().background(Color(.systemGray6))
                .cornerRadius(5.0)
                .frame(width:350)
                .padding(.bottom,20)
            TextField("Last Name", text:$lastName)
                .padding().background(Color(.systemGray6))
                .cornerRadius(5.0)
                .frame(width:350)
                .padding(.bottom,20)
            TextField("Username", text:$userName)
                .padding().background(Color(.systemGray6))
                .cornerRadius(5.0)
                .frame(width:350)
                .padding(.bottom,20)
            
            SecureField("Password", text:$password)
                .padding().background(Color(.systemGray6))
                .cornerRadius(5.0)
                .frame(width:350)
                .padding(.bottom,20)
            
            Button("Save"){
                coreDM.saveUser(firstName: firstName, lastName: lastName, userName: userName, password: password)
                self.users =  coreDM.getAllUsers()
            }
            
            List(users, id: \.self) { user in
                Text(user.firstName ?? "")
            }

                NavigationLink(destination: HomeView()){
                    Text("SIGN UP")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width:220,height: 60)
                        .background(.black)
                        .cornerRadius(5.0)
                        .scaleEffect(animationAmount)
                        .animation(
                            Animation.easeInOut(duration: 20)
                                .repeatForever(autoreverses: true)
                        )
                        .onAppear {
                            self.animationAmount = 1.5
                        }
                }
                
            
                .onAppear(perform: {
                    self.users =  coreDM.getAllUsers()
                })
            }
            
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView(coreDM:CoreDataManager())
    }
}
