//
//  ContentView.swift
//  NightWatch
//
//  Created by Leonardo Llanes on 5/27/24.
//

import SwiftUI
struct ContentView: View {
    
    @Bindable var nightWatchViewModel: NightWatchViewModel
    @State private var focusModeOn = false
    @State private  var resetAlertShowing = false
    var body: some View {
        
        NavigationStack {
            List {
                Section(content: {                       
                    ForEach($nightWatchViewModel.nightlyTasks){
                    task in
                        if focusModeOn == false || (focusModeOn && task.wrappedValue.isComplete == false) {
                            NavigationLink() {
                            DetailView(task: task)
                        } label: {
                            TaskRow(task: task.wrappedValue)
                    }
                        } else {
                            /*@START_MENU_TOKEN@*/EmptyView()/*@END_MENU_TOKEN@*/
                        }
                    
                    }.onDelete { indexSet in
                        nightWatchViewModel.nightlyTasks.remove(atOffsets: indexSet)
                    }
                    .onMove { indices, newOffset in
                        nightWatchViewModel.nightlyTasks.move(fromOffsets: indices, toOffset: newOffset)
                    }
                }, header: {
                    TaskSectionHeader(symbolSystemName: "moon.stars", headerText: "Nightly tasks")
                })
                
                Section(content: {
                    ForEach($nightWatchViewModel.weeklyTasks){
                        task in
                        if focusModeOn == false || (focusModeOn && task.wrappedValue.isComplete == false) {
                            NavigationLink() {
                            DetailView(task: task)
                        } label: {
                            TaskRow(task: task.wrappedValue)
                    }
                        } else {
                            /*@START_MENU_TOKEN@*/EmptyView()/*@END_MENU_TOKEN@*/
                        }
                    }.onDelete{ indexSet in
                        nightWatchViewModel.weeklyTasks.remove(atOffsets: indexSet)
                    }
                    .onMove(perform:{ indices, newOffset in
                        nightWatchViewModel.weeklyTasks.move(fromOffsets: indices, toOffset: newOffset)
                    })
                }, header: {
                    TaskSectionHeader(symbolSystemName: "sunrise", headerText: "Weekly tasks")
                    
                    
                })
                
                Section(content: {
                    ForEach($nightWatchViewModel.monthlyTasks){
                        task in
                        if focusModeOn == false || (focusModeOn && task.wrappedValue.isComplete == false) {
                            NavigationLink() {
                            DetailView(task: task)
                        } label: {
                            TaskRow(task: task.wrappedValue)
                    }
                        } else {
                            /*@START_MENU_TOKEN@*/EmptyView()/*@END_MENU_TOKEN@*/
                        }
                    }.onDelete{ indexSet in
                        nightWatchViewModel.monthlyTasks.remove(atOffsets: indexSet)
                    }
                    .onMove(perform: { indices, newOffset in
                        nightWatchViewModel.monthlyTasks.move(fromOffsets: indices, toOffset: newOffset)
                    })
                }, header: {
                    TaskSectionHeader(symbolSystemName: "calendar", headerText: "Monthly tasks")
                })
            }
                .listStyle(GroupedListStyle())
                .navigationTitle(Text("Home"))
                .toolbar {
                    ToolbarItem(placement: .bottomBar){
                        Toggle(isOn: $focusModeOn, label: {
                            Text("Focus Mode")
                        })
                        .toggleStyle(.switch)
                        .frame(width: 175)
                    }
                    ToolbarItem(placement: .topBarTrailing){
                        Button(action: {
                            resetAlertShowing = true
                        }) {
                            Text("Reset")
                        }
                    }
                    ToolbarItem(placement: .topBarLeading){
                        EditButton()
                    }
                }
        }
        .alert("Reset list", isPresented: $resetAlertShowing) {
            Button(role: .cancel) {
                
            } label: {
                Text("Cancel")
            }
            Button(role:.destructive) {
                let refreshedNightWatchViewModel = NightWatchViewModel()
                self.nightWatchViewModel.nightlyTasks =  refreshedNightWatchViewModel.nightlyTasks
                self.nightWatchViewModel.weeklyTasks =  refreshedNightWatchViewModel.weeklyTasks
                self.nightWatchViewModel.monthlyTasks =  refreshedNightWatchViewModel.monthlyTasks
            } label: {
                Text("Yes reset it.")
            }


        } message: {
            Text("Are you sure?")
        }

        
    }
}

struct HeaderStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title3)
            .fontWeight(.heavy)
            .foregroundStyle(.yellow)
            .textCase(.uppercase)
            .padding(.top)
    }
}

extension View {
    func headerStyle() -> some View {
        self.modifier(HeaderStyle())
    }
}

struct TaskSectionHeader: View {
    let symbolSystemName: String
    let headerText: String
    var body: some View {
        HStack{
            Text(" \(Image(systemName: symbolSystemName)) \(headerText)")
                .headerStyle()
        }
    }
}



#Preview {
    ContentView(nightWatchViewModel:NightWatchViewModel())
}





struct TaskRow: View {
    let task: NightWatchTask
    var body: some View {
        VStack {
            if task.isComplete {
                HStack {
                    Image(systemName: "checkmark.square")
                    Text(task.name)
                        .foregroundStyle(.gray)
                    .strikethrough()
                }
            } else {
                HStack{
                    Image(systemName: "square")
                    Text(task.name)
                        .foregroundStyle(.gray)
                }
            }
        }
    }
}
