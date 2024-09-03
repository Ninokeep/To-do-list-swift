//
//  HomeView.swift
//  TodoList
//
//  Created by Fababy on 03/09/2024.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        
        TabView {
            TodoListView().tabItem {
                Label("Todos", systemImage: "filemenu.and.selection")
            }
            ProfilView().tabItem {
                Label("Profil", systemImage: "person.circle")
            }
        }
    }
}

#Preview {
    HomeView()
}
