//
//  ArraowButton.swift
//  calmo
//
//  Created by Mohammed Elamin on 16/07/2023.
//

import SwiftUI

struct SkipButton: View {
    
    
    var backgroundColor : Color
    var arrowCoolor : Color
    
    var onTap : ()->Void
    
    init(backgroundColor: Color = .white, arrowCoolor: Color = .black, onTap: @escaping () -> Void = {}) {
        self.backgroundColor = backgroundColor
        self.arrowCoolor = arrowCoolor
        self.onTap = onTap
    }
    
    
    var body: some View {
        HStack(alignment: .center, spacing: 35.0) {
            Text("Skip")
                .font(.caption)
            
            
            IconButton(
            iconName: "arrowright",
            onTap: self.onTap
            )

        
        }
        .frame(
            width: UIScreen.main.bounds.width,
            height: 56
        )
    }
}

struct SkipButton_Previews: PreviewProvider {
    static var previews: some View {
        SkipButton{
            print("clicked")
        }
            .padding(.all)
            .background(.gray)
    }
}
