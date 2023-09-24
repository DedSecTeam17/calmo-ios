//
//  CustomSeekBar.swift
//  calmo
//
//  Created by Mohammed Elamin on 21/09/2023.
//

import SwiftUI

struct CustomSeekBar: View {

    
    @State private var width: CGFloat?
    
    
     var progressWidth : CGFloat = 0
  

    @State var calculatedProgress : CGFloat = 0

    
    
    var height : CGFloat = 8
    var bgColor = ThemeManager(theme: lightTheme).currentTheme.primaryColor

    
    var body: some View {


        
        VStack {
            Rectangle()
                .fill(.gray.opacity(0.2))
                .frame(height: height)
                .clipShape(RoundedCorner(radius: 10))
                .overlay(alignment : .leading) {
                    Rectangle()
                        .fill(bgColor)
                        .frame(width: $calculatedProgress.wrappedValue,height: height)
                        .clipShape(RoundedCorner(radius: 10))
                 
                }.background(GeometryReader { geometry in
                    Color.clear
                        .preference(key: WidthPreferenceKey.self, value: geometry.size.width)
                })
                .onPreferenceChange(WidthPreferenceKey.self) { value in
                              self.width = value
                    print(value)
                    withAnimation {
                        
                        guard let safeWidth = width else {
                            return
                        }
                     
                        self.calculatedProgress = safeWidth * progressWidth
                    }
                    
            }
        }
    }
}

struct CustomSeekBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomSeekBar(progressWidth: 0.2)
    }
}


struct WidthPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat? = nil
    
    static func reduce(value: inout CGFloat?, nextValue: () -> CGFloat?) {
        value = value ?? nextValue()
    }
}
