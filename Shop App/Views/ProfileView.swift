//
//  ProfileView.swift
//  Shop App
//
//  Created by Fırat Ören on 5.09.2024.
//

import SwiftUI
import FirebaseAuth

struct ProfileView: View {
    @State var signInSheet = false
    @State var userInfoSheet = false
    @State var user: User?
    var body: some View {

            VStack{
            if user != nil {
            HStack{
                Text("Welcome!")
                    .foregroundStyle(Color.black)
                    .font(.system(size: 24))

                Spacer()
                Image(systemName: "person.crop.circle")
                    .font(.system(size: 40))
            }.padding()

            Divider()
                Text("New users should add user information!").foregroundStyle(Color.red).gotoLeding()
            VStack(spacing: 10){
                Button {

                } label: {
                    Text("View Your Orders")
                        .frame(maxWidth: .infinity,maxHeight: 50)
                        .foregroundStyle(Color.white)
                        .background(Color("BaseColor"))
                        .clipShape(RoundedRectangle(cornerSize: CGSize(width: 12, height: 12)))
                        .font(.system(size: 16))
                        .bold()
                        .padding(.horizontal)

                }

                Button {

                } label: {
                    Text("Change Email")
                        .frame(maxWidth: .infinity,maxHeight: 50)
                        .foregroundStyle(Color.white)
                        .background(Color("BaseColor"))
                        .clipShape(RoundedRectangle(cornerSize: CGSize(width: 12, height: 12)))
                        .font(.system(size: 16))
                        .bold()
                        .padding(.horizontal)
                }

                Button {

                } label: {
                    Text("Change Password")
                        .frame(maxWidth: .infinity,maxHeight: 50)
                        .foregroundStyle(Color.white)
                        .background(Color("BaseColor"))
                        .clipShape(RoundedRectangle(cornerSize: CGSize(width: 12, height: 12)))
                        .font(.system(size: 16))
                        .bold()
                        .padding(.horizontal)
                }

                Button {
                    userInfoSheet.toggle()
                } label: {
                    Text("Add User Information")
                        .frame(maxWidth: .infinity,maxHeight: 50)
                        .foregroundStyle(Color.white)
                        .background(Color("BaseColor"))
                        .clipShape(RoundedRectangle(cornerSize: CGSize(width: 12, height: 12)))
                        .font(.system(size: 16))
                        .bold()
                        .padding(.horizontal)
                }
                
                Button {
                    withAnimation {
                        try! Auth.auth().signOut()
                    }

                } label: {
                    Text("Sign Out")
                        .frame(maxWidth: .infinity,maxHeight: 50)
                        .foregroundStyle(Color.white)
                        .background(Color.red)
                        .clipShape(RoundedRectangle(cornerSize: CGSize(width: 12, height: 12)))
                        .font(.system(size: 16))
                        .bold()
                        .padding(.horizontal)
                }



            }.padding(.top)




            Spacer()
        }else {
            Button {
                signInSheet.toggle()
            } label: {
                Text("Sign In 🔐")
                    .frame(maxWidth: .infinity,maxHeight: 60)
                    .foregroundStyle(Color.white)
                    .background(Color("BaseColor"))
                    .clipShape(RoundedRectangle(cornerSize: CGSize(width: 12, height: 12)))
                    .font(.system(size: 24))
                    .bold()
                    .padding(.horizontal)
            }
        }

            }
            .onAppear {
                Auth.auth().addStateDidChangeListener { auth,userr in
                    user = userr

                }
            }
            .fullScreenCover(isPresented: $signInSheet, content: {
                LoginView(isSignSheet: $signInSheet)
            })



    }
}

#Preview {
    ProfileView()
}
