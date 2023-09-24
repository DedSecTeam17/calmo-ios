//
//  AppTheme.swift
//  calmo
//
//  Created by Mohammed Elamin on 13/07/2023.
//

import Foundation
import SwiftUI




struct Theme {
    let primaryColor: Color
    let backgroundColor : Color
    let secondaryColor: Color
    let primaryFont: Font
    // Add any other theme attributes you want
}


let lightTheme = Theme(
    primaryColor: Color(hex: "#fe6601"),
    backgroundColor : Color(hex: "#EFF3F5"),
    secondaryColor: .black,
    primaryFont: .system(size: 16)
)



let darkTheme = Theme(
    primaryColor: Color(hex: "#4030FF"),
    backgroundColor : Color(hex: "#EFF3F5"),
    secondaryColor: .black,
    primaryFont: .system(size: 16)
)


class ThemeManager: ObservableObject {
    @Published var currentTheme: Theme
    
    
    init(theme: Theme) {
        self.currentTheme = theme
    }
}


enum CustomFont {
    
    case largeTitle , title , title2 , title3 , headline, subheadline, body, callout , footnote , caption  , caption2
    
    
    func font() -> Font{
        switch self {
        case .largeTitle:
            return AppFonts.largeTitle
        case .title:
            return AppFonts.title
            
        case .title2:
            return AppFonts.title2
            
        case .title3:
            return AppFonts.title3
            
        case .headline:
            return AppFonts.headline
            
        case .subheadline:
            return AppFonts.subheadline
            
        case .body:
            return AppFonts.body
            
        case .callout:
            return AppFonts.callout
            
        case .footnote:
            return AppFonts.footnote
            
        case .caption:
            return AppFonts.caption
            
        case .caption2:
            return AppFonts.caption2
            
        }
    }
    
}



struct AppFonts {
    static let largeTitle = Font.custom("OpenSans-Regular", size: 34)
    static let title = Font.custom("OpenSans-Regular", size: 28)
    static let title2 = Font.custom("OpenSans-Regular", size: 22)
    static let title3 = Font.custom("OpenSans-Regular", size: 20)
    static let headline = Font.custom("OpenSans-Regular", size: 17)
    static let subheadline = Font.custom("OpenSans-Regular", size: 15)
    static let body = Font.custom("OpenSans-Regular", size: 17)
    static let callout = Font.custom("OpenSans-Regular", size: 16)
    static let footnote = Font.custom("OpenSans-Regular", size: 13)
    static let caption = Font.custom("OpenSans-Regular", size: 12)
    static let caption2 = Font.custom("OpenSans-Regular", size: 11)
}
