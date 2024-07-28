//
//  NightWatchTask.swift
//  NightWatch
//
//  Created by Leonardo Llanes on 5/27/24.
//

import Foundation

struct NightWatchTask: Identifiable {
    let id = UUID()
    let name: String
    var isComplete: Bool
    var lastCompleted: Date?
}
