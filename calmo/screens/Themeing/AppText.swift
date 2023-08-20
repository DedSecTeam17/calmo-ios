//
//  AppText.swift
//  calmo
//
//  Created by Mohammed Elamin on 16/07/2023.
//

import SwiftUI

struct AppText: View {
    
    var text : String
    
    var font : Font = AppFonts.body
    
 

    init(text: String = "", font: Font = AppFonts.body) {
        self.text = text
        self.font = font
    }
    
    
    
    
    var body: some View {
        Text(text)
            .font(font)
    }
}

struct AppText_Previews: PreviewProvider {
    static var previews: some View {
        AppText(text: "Hi There",font: AppFonts.body)
    }
}
