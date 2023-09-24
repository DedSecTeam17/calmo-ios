//
//  IconButton.swift
//  calmo
//
//  Created by Mohammed Elamin on 05/09/2023.
//

import SwiftUI

struct IconButton: View {
    
    
    var iconName : String
    
    var backgroundColor : Color
    var arrowCoolor : Color
    
    var onTap : ()->Void
    
    var cornerRadius : Double
    
    init(iconName : String = "arrowright" , backgroundColor: Color = .white, arrowCoolor: Color = .black, onTap: @escaping () -> Void = {},cornerRadius : Double = 24.0) {
        self.backgroundColor = backgroundColor
        self.arrowCoolor = arrowCoolor
        self.onTap = onTap
        self.cornerRadius = cornerRadius
        self.iconName = iconName


    }
    
    var body: some View {
        Button(
            action : {
                self.onTap()
            }
        ){
            Image(self.iconName)
                .renderingMode(.template)
                .foregroundColor(self.arrowCoolor)
                .padding(.all)
        }
        .background(self.backgroundColor)
        .clipShape(RoundedRectangle(cornerRadius: self.cornerRadius))
    }
}

struct IconButton_Previews: PreviewProvider {
    static var previews: some View {
        IconButton()
            .padding(.all)
            .background(.gray)
    }
}
