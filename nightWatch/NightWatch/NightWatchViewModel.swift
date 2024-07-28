//
//  NightWatchViewModel.swift
//  NightWatch
//
//  Created by Leonardo Llanes on 5/28/24.
//

import Foundation

@Observable
class NightWatchViewModel {
    
    var nightlyTasks = [
        NightWatchTask(name: "Task x1", isComplete: false),
        NightWatchTask(name: "Task x2", isComplete: false),
        NightWatchTask(name: "Task x3", isComplete: false)
    ]


   var weeklyTasks = [
        NightWatchTask(name: "Task y1", isComplete: false),
        NightWatchTask(name: "Task y2", isComplete: false),
        NightWatchTask(name: "Task y3", isComplete: false)
    ]


    var monthlyTasks = [
        NightWatchTask(name: "Task d1", isComplete: false),
        NightWatchTask(name: "Task d2", isComplete: false),
        NightWatchTask(name: "Task d3", isComplete: false)
    ]

}
