//
//  TodoItem.swift
//  Counter
//
//  Created by Fababy on 29/08/2024.
//

import Foundation
import SwiftUI


struct  TodoItem: Identifiable {
    let id = UUID()
    var title: String  {
        willSet {
            if self.title != newValue {
                self.updateAt = Date.now
            }
        }
    }
    var isChecked: Bool {
        willSet {
            if self.isChecked != newValue {
                self.updateAt = Date.now
            }
        }
    }
    var type: TodoType {
        willSet {
            if self.type != newValue {
                self.updateAt = Date.now
            }
        }
    }
    let createAt: Date = Date.now
    var updateAt: Date?
    
    func formattedDate(date:Date) -> String {
        
        return TodoItem.dateFormatter.string(from: date)
    }
    
    private static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "d/M/yyyy 'à' HH'h'mm'"
        return formatter
    }()
}


enum TodoType: String, CaseIterable, Identifiable {
    case personal = "Personal"
    case work = "Work"
    case shopping = "Shopping"
    case health = "Health"
    case learning = "Learning"
    case other = "Other"
    
    var id: String { self.rawValue }
    
    func backgroundColor() -> Color {
        
        switch self {
        case .personal:
            return .blue
        case .work:
            return .red
        case .shopping:
            return .orange
        case .health:
            return .yellow
        case .learning:
            return .brown
        case .other:
            return .indigo
        }
        
        
    }
}
