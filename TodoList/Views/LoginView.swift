//
//  LoginView.swift
//  TodoList
//
//  Created by Fababy on 02/09/2024.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        NavigationStack {
            VStack {
                HStack{
                    Image("HomeLogin").resizable()
                }
                LoginFormView()
            }
        }
        
    }
}

#Preview {
    LoginView()
}
