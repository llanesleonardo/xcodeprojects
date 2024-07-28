//
//  Profile.swift
//  landmarks
//
//  Created by Leonardo Llanes on 5/26/24.
//

import Foundation


struct Profile {
    var username: String
    var prefersNotification = true
    var seasonalPhoto = Season.winter
    var goalDate = Date()
    
    static let `default` = Profile(username: "g_kumar")
    
    enum Season: String, CaseIterable, Identifiable {
        case spring = "🌷"
        case summer = "🌞"
        case autumn = "🍂"
        case winter = "❄️"
        
        var id: String {
            rawValue
        }
    }
}
