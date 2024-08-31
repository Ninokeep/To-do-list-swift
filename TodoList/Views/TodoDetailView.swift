//
//  TodoDetailView.swift
//  Counter
//
//  Created by Fababy on 29/08/2024.
//

import SwiftUI

struct TodoDetailView: View {
    @Binding var title: String
    @Binding var isChecked: Bool
    @Binding var type: TodoType
    
    var body: some View {
        TodoFormView(title: $title, isChecked: $isChecked, type: $type)
    }
    
}

#Preview {
    TodoDetailView(title: .constant("john"), isChecked: .constant(true), type: .constant(.health))
}
