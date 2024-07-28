//
//  ChatView.swift
//  NightWatch
//
//  Created by Leonardo Llanes on 5/27/24.
//

import SwiftUI

struct ChatView: View {
    @State private var messages: [String] = ["Hello!", "Hi there!"]
    @State private var newMessage: String = ""

    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading) {
                    ForEach(messages, id: \.self) { message in
                        Text(message)
                            .padding()
                            .background(Color.blue.opacity(0.2))
                            .cornerRadius(8)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
            }
            .padding()

            HStack {
                TextField("Enter message", text: $newMessage)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                Button(action: {
                    sendMessage()
                }) {
                    Text("Send")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding(.trailing)
            }
        }
    }

    private func sendMessage() {
        if !newMessage.isEmpty {
            messages.append(newMessage)
            newMessage = ""
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
