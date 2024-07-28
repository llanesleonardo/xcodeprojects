//
//  CardView.swift
//  hikes
//
//  Created by Leonardo Llanes on 6/4/24.
//

import SwiftUI

struct CardView: View {
    
    @State private var imageNumber: Int = 1
    @State private var randomNumber: Int = 1
    @State private var isShowingSheet: Bool = false
    
    // MARK: - PROPERTIES
    
    func randomImage(){
        repeat{
            randomNumber = Int.random(in: 1...5)
            
        } while randomNumber == imageNumber
        imageNumber = randomNumber
    }
    
    
    var body: some View {
        ZStack {
            CustomBackgroundView()
            VStack {
                // MARK: - HEADER
                
                VStack(alignment:.leading) {
                    HStack {
                        Text("Hiking")
                            .fontWeight(.black)
                            .font(.system(size: 52))
                            .foregroundStyle(
                                LinearGradient(
                                    colors:[.customGrayLight,.customGrayMedium],
                                    startPoint: .top,
                                    endPoint: .bottom
                                )
                        )
                        
                        Spacer()
                        
                        Button {
                         //ACTION: Show a Sheet
                            print("The button was pressed.")
                            isShowingSheet.toggle()
                        } label: {
                             CustomButtonView()
                        }
                        .sheet(isPresented: $isShowingSheet){
                            SettingsView()
                                .presentationDragIndicator(.visible)
                                .presentationDetents([.medium,.large])
                        }
                        
                    }//: HSTACK
                    
                    Text("Fun and enjoyable outdorr activity for friends and families.")
                        .multilineTextAlignment(.leading)
                        .italic()
                        .foregroundColor(.customGrayMedium)
                }//:HEADER
                .padding(.horizontal,30)
                // MARK: MAIN CONTENT
                
                
                ZStack {
                    CustomCircleView()
                    Image("image-\(imageNumber)")
                         .resizable()
                     .scaledToFit()
                     .animation(.default, value: imageNumber)
                }
                
                // MARK: - FOOTER
                
                Button {
                    //ACTION: Generate a random number
                    print("The button was pressed.")
                    randomImage()
                } label: {
                    Text("Explore More")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundStyle(
                            LinearGradient(colors: [.customGreenLight,.customGreenMedium],
                                           startPoint: .top,
                                           endPoint: .bottom
                                    )
                        )
                        .shadow(color:.black.opacity(0.25),radius: 0.25,x:1,y:2)
                }
                .buttonStyle(GradientButton())
            }//:VSTACK
        }//: CARD
        .frame(width: 320,height: 570)
    }
}

#Preview {
    CardView()
}
