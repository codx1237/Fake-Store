//
//  LoginView.swift
//  Shop App
//
//  Created by Fırat Ören on 15.09.2024.
//

import SwiftUI
import FirebaseAuth

enum LoginError: LocalizedError {
    case emailEmpty
    case emailInvalid
    case passwordEmpty
    case passwordTooShort

    var errorDescription: String? {
        switch self {
        case .emailEmpty:
            return "Email cannot be empty"
        case .emailInvalid:
            return "Email is Invalid"
        case .passwordEmpty:
            return "Password cannot be empty"
        case .passwordTooShort:
            return "Password needs to be at least 8 characters long "
        }
    }
}


struct LoginView: View {
    @State var email = ""
    @State var password = ""
    @State var emailError: LoginError?
    @State var passwordError: LoginError?
    @Binding var isSignSheet: Bool

    private func isFormValid() -> Bool {
        if email.isEmpty {
            emailError = LoginError.emailEmpty
        } else if !email.isValidEmail {
            emailError = LoginError.emailInvalid
        }
        if password.isEmpty {
            passwordError = LoginError.passwordEmpty
        } else if password.count < 8 {
            passwordError = LoginError.passwordTooShort
        }
        return emailError == nil && passwordError == nil
    }

    var body: some View {
        VStack{

            Button {
                isSignSheet = false
            } label: {
                Image(systemName: "xmark")
                    .foregroundStyle(Color.black)
                    .font(.title)
                    .gotoTrailing()
                    .padding()
            }
            Spacer()

            Image("Logo")
                .resizable()
                .frame(width: 150,height: 150)
                .clipShape(Circle())
                .padding(.bottom)

            TextField("", text: $email,prompt: Text("Email").foregroundStyle(Color.white).bold())
                .padding()
                .background(Color("BaseColor"))
                .foregroundStyle(Color.white)
                .clipShape(RoundedRectangle(cornerSize: CGSize(width: 10, height: 10)))
                .padding(.horizontal)
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled()
                .textCase(.lowercase)

            if let emailError = emailError {
                Text(emailError.localizedDescription).foregroundStyle(Color.red).gotoLeding()
            }

            SecureField("", text: $password,prompt: Text("Password").foregroundStyle(Color.white).bold())
                .padding()
                .background(Color("BaseColor"))
                .foregroundStyle(Color.white)
                .clipShape(RoundedRectangle(cornerSize: CGSize(width: 10, height: 10)))
                .padding(.horizontal)
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled()
                .textCase(.lowercase)

            if let passwordError = passwordError {
                Text(passwordError.localizedDescription).foregroundStyle(Color.red).gotoLeding()
            }

            Button(action: {
                if isFormValid() {
                    Auth.auth().signIn(withEmail: email.lowercased(), password: password.lowercased()){ authResult, error in
                        if error == nil {
                            withAnimation {
                                isSignSheet = false
                            }
                        } else {
                            print("no such user found")
                        }

                    }
                }


            }, label: {
                Text("Login 🔐")
                    .padding()
                    .frame(width: 200,height: 60)
                    .background(Color("BaseColor"))
                    .clipShape(RoundedRectangle(cornerSize: CGSize(width: 10, height: 10)))
                    .foregroundStyle(Color.white)
                    .font(.title2)
                    .bold()
                    .padding(.top)

            })
            Spacer()
            Spacer()
        }
    }
}

#Preview {
    LoginView(isSignSheet: .constant(true))
}
