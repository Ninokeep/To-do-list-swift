//
//  LoginFormView.swift
//  TodoList
//
//  Created by Fababy on 02/09/2024.
//

import SwiftUI

struct LoginFormView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isPresented: Bool = false
    
    func login() -> Bool {
        
        return false
    }
    
    var isEmptyEmailAndPassword: Bool {
      
        return email.isEmpty || password.isEmpty
    }
    
    var body: some View {
            VStack(alignment: .leading, spacing: 15){
                
                Text("Login").font(.title).bold()
                TextField(text: $email) {
                    Text("Email")
                }
                
                SecureField(text: $password, prompt: Text("Required")) {
                    Text("Password")
                }
                HStack {
                    Text("Don't have account ? ").foregroundColor(.gray)
                    Text("Create Account").foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                }
                Button(action: {
                    isPresented  = true
                    print("nav")
                }) {
                    Text("Submit")
                }
                .disabled(isEmptyEmailAndPassword)
                .frame(maxWidth: .infinity)
                .foregroundColor(.white)
                .padding(10)
                .background(isEmptyEmailAndPassword ? .gray : .blue,
                             in: RoundedRectangle(cornerRadius: 5))
                
            }
           
            .textFieldStyle(.roundedBorder)
                .padding()
                .background(Color(.systemBackground))
                .navigationDestination(isPresented: $isPresented, destination: {
                    HomeView().navigationBarBackButtonHidden()
                })
                
           Spacer()
        }
        
    
}

#Preview {
   
     LoginFormView()


}
