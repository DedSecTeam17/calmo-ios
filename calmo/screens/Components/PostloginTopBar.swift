//
//  HomeTopBar.swift
//  calmo
//
//  Created by Mohammed Elamin on 05/09/2023.
//

import SwiftUI

struct PostloginTopBar: View {
    
    var leadingText : String?
    
    var leadingIcon : String?

    var trailingIcon : String?

    
    var onLeadingTapped : ()->Void = {}
    
    var onTrailingTapped : ()->Void = {}

    
    var centerTitle : Bool = false

    
    var body: some View {
        
    
        
        HStack(alignment: .center) {
            if let presentedleadingIcon : String = self.leadingIcon  {
                IconButton(
                    iconName: presentedleadingIcon,onTap: self.onLeadingTapped)
            }
     
            if centerTitle {
                Spacer()
            }
            
            if let presentedLeadingText : String = self.leadingText  {
                Text(presentedLeadingText)
                    .font(AppFonts.title2.weight(.semibold))
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal)
              
            }
            
       
       
            Spacer()
            
            if let presentedTrailingIcon: String = self.trailingIcon  {
                IconButton(
                    iconName: presentedTrailingIcon,onTap: self.onTrailingTapped)
          
            }
            
      


        }.padding(.horizontal,16)
            .frame(height: 60)
            .background(ThemeManager(theme: lightTheme).currentTheme.backgroundColor)

    }
}

struct PostloginTopBar_Previews: PreviewProvider {
    static var previews: some View {
        PostloginTopBar(
        leadingText: "Best",
        leadingIcon: "arrowright",
        trailingIcon: "search",
        onTrailingTapped: {
            print("Clicked")
        },centerTitle: true
        )
            .background(.gray)
    }
}
