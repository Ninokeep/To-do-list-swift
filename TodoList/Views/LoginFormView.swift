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
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 15){
                Text("Login").font(.title).bold()
                TextField(text: $email) {
                    Text("Email")
                }
                
                SecureField(text: $password, prompt: Text("Required")) {
                    Text("Password")
                }
                Button(action: {
                    isPresented  = true
                    print("nav")
                }) {
                    Text("Submit")
                }
                .frame(maxWidth: .infinity)
                .foregroundColor(.white)
                .padding(10)
                .background(.blue,
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
}

#Preview {
   
     LoginFormView()


}
