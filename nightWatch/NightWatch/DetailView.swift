//
//  DetailView.swift
//  NightWatch
//
//  Created by Leonardo Llanes on 5/27/24.
//

import SwiftUI

struct DetailView: View {
    @Binding var task: NightWatchTask
    
    var body: some View {
        VStack {
            Text(task.name)
            Button {
                task.isComplete = true
            } label: {
                Text("Mark complete")
            }

        }
    }
}
#Preview {
    DetailView(task: .constant(NightWatchTask(name: "Task N", isComplete: false)))
}
