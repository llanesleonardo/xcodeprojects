//
//  GradientButtonStyle.swift
//  hikes
//
//  Created by Leonardo Llanes on 6/4/24.
//

import Foundation
import SwiftUI




struct GradientButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .padding(.vertical)
            .padding(.horizontal,30)
            .background(
                //Conditional statement with Nil Coalescing
                //Condition ? A : B
                configuration.isPressed ?
                // A: When User Pressed the Button
                LinearGradient(colors: [.customGrayMedium,.customGrayLight],
                               startPoint: UnitPoint.top,
                               endPoint: .bottom
                              )
                :
                // B: When the Button is not pressed
                
                LinearGradient(colors: [.customGrayLight,.customGrayMedium],
                               startPoint: UnitPoint.top,
                               endPoint: .bottom
                              )
            )
            .cornerRadius(40)
    }
}
