//
//  FAQ.swift
//  SwiftUI_Study
//
//  Created by kyungseok.lee_Flitto on 2021/09/03.
//

import Foundation

struct FAQ: Decodable, Identifiable {
    var id: Int
    var question: String
    var answer: String
}
