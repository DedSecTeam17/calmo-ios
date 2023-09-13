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

    
    var body: some View {
        
    
        
        HStack(alignment: .center) {
            if let presentedleadingIcon : String = self.leadingIcon  {
                IconButton(
                    iconName: presentedleadingIcon,onTap: self.onLeadingTapped)
                .padding(.leading)
            }
     
            
            if let presentedLeadingText : String = self.leadingText  {
                Text(presentedLeadingText)
                    .frame(width: 120)
                    .font(AppFonts.title2.weight(.bold))
              
            }
            
       
       
            Spacer()
            
            if let presentedTrailingIcon: String = self.trailingIcon  {
                IconButton(
                    iconName: presentedTrailingIcon,onTap: self.onTrailingTapped)
                .padding(.horizontal)
            }
            
      


        }.padding(.horizontal,4)
            .padding(.vertical)
            .background(.ultraThinMaterial)
            .foregroundColor(Color.primary.opacity(0.50))
            .foregroundStyle(.ultraThinMaterial)

    }
}

struct PostloginTopBar_Previews: PreviewProvider {
    static var previews: some View {
        PostloginTopBar(
        leadingText: "Best of the weeks",
        leadingIcon: "arrowright",
        trailingIcon: "search",
        onTrailingTapped: {
            print("Clicked")
        }
        )
            .background(.gray)
    }
}
