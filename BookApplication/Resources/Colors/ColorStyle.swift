//
//  ColorStyle.swift
//  BookApplication
//
//  Created by Oksana Dionisieva on 20.03.2025.
//

/*
 To find the approximate name for the color the following resource shall be used:
 http://chir.ag/projects/name-that-color/
 */

import SwiftUI

enum ColorStyle {
    case codGray
    case gallery
    case tundora
    case thunderbird
    case azureRadiance
    case lilac
    case chenin
    case keppel
}

extension Color {
    /// #0A0A0A - rgb(10/10/10)
    static let codGray = Color(#colorLiteral(red: 0.03921568627, green: 0.03921568627, blue: 0.03921568627, alpha: 1))
    /// #ECECEC - rgb(236/236/236)
    static let gallery = Color(#colorLiteral(red: 0.9254901961, green: 0.9254901961, blue: 0.9254901961, alpha: 1))
    /// #414141 - rgb(65/65/65)
    static let tundora = Color(#colorLiteral(red: 0.2549019608, green: 0.2549019608, blue: 0.2549019608, alpha: 1))
    
    /// #C72D12 - rgb(199/45/18)
    static let thunderbird = Color(#colorLiteral(red: 0.7803921569, green: 0.1764705882, blue: 0.07058823529, alpha: 1))
    /// #0A84FF - rgb(10/132/255)
    static let azureRadiance = Color(#colorLiteral(red: 0.03921568627, green: 0.5176470588, blue: 1, alpha: 1))
    /// #DBDF66 - rgb(219/223/102)
    static let chenin = Color(#colorLiteral(red: 0.8588235294, green: 0.8745098039, blue: 0.4, alpha: 1))
    /// #36AB86 - rgb(54/171/134)
    static let keppel = Color(#colorLiteral(red: 0.2117647059, green: 0.6705882353, blue: 0.5254901961, alpha: 1))
    /// #D2A4CE - rgb(210/164/206)
    static let lilac = Color(#colorLiteral(red: 0.8235294118, green: 0.6431372549, blue: 0.8078431373, alpha: 1))
}
