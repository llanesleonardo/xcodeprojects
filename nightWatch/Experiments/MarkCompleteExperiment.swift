//
//  MarkCompleteExperiment.swift
//  NightWatch
//
//  Created by Leonardo Llanes on 5/28/24.
//

import SwiftUI

struct NightWatchTaskExperiment {
    let name: String
    var isComplete: Bool
    var lastCompleted: Date?
}

struct MarkCompleteExperiment: View {
    @State private var  theTask = NightWatchTaskExperiment(name: "Task 1", isComplete: false)
    var body: some View {
        VStack {
            HStack{
                if theTask.isComplete {
                    Image(systemName: "checkmark.square")
                } else {
                    Image(systemName: "square")
                }
                Text(theTask.name)
            }
            ControlPanel(theTask: self.$theTask)

        }
    }
}

#Preview {
    MarkCompleteExperiment()
}

struct ControlPanel: View {
    
    @Binding var theTask: NightWatchTaskExperiment
    
    var body: some View {
        HStack {
            if  theTask.isComplete == false {
                Button("Mark complete") {
                    theTask.isComplete = true
                }
            } else {
                Button("Reset") {
                    theTask.isComplete = false
                }
            }

        }
    }
}
