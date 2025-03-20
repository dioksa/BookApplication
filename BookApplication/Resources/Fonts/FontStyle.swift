//
//  FontStyle.swift
//  BookApplication
//
//  Created by Oksana Dionisieva on 20.03.2025.
//

import SwiftUI

enum FontStyle {
    case regular
    case medium
    case bold

    func font(size: Size) -> Font {
        switch self {
        case .regular:
            return .custom(Name.regular.rawValue, size: size.rawValue)
        case .medium:
            return .custom(Name.medium.rawValue, size: size.rawValue)
        case .bold:
            return .custom(Name.bold.rawValue, size: size.rawValue)
            
        }
    }
}

enum Name: String {
    case regular = "LeagueSpartan-Regular"
    case medium = "LeagueSpartan-Medium"
    case bold = "LeagueSpartan-Bold"
}

enum Size: CGFloat {
    case h12 = 12.0
    case h18 = 18.0
    case h20 = 20.0
    case h24 = 24.0
}
