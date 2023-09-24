//
//  CustomButton.swift
//  calmo
//
//  Created by Mohammed Elamin on 16/07/2023.
//

import SwiftUI

struct CustomButton: View {
    
    
    var imageName : String
    
    var text : String
    
    var fixedSize : Bool
    
    var onTap : ()->Void
    
    
    
    init(imageName: String = "", text: String = "", onTap: @escaping () -> Void = {},fixedSize : Bool = false) {
        self.imageName = imageName
        self.text = text
        self.onTap = onTap
        self.fixedSize = fixedSize
    }
    
    
    
    var body: some View {
        
        
        
        Button (action: {
            self.onTap()
        }){
            
            if !self.fixedSize {
                ButtonContent()
                    .background(ThemeManager(theme: lightTheme).currentTheme.primaryColor)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .padding(.all,4)
                
            }else {
                ButtonContent()
                    .frame(width: UIScreen.main.bounds.width/1.1,height: 60)
                    .background(ThemeManager(theme: lightTheme).currentTheme.primaryColor)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .padding(.all,4)
                
                
            }
            
            
            
            
            
            
        }
        
    }
    
    
    private func ButtonContent() -> some View {
        return           HStack {
            if !imageName.isEmpty {
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20,height: 20)
            }
            
            if !text.isEmpty {
                Text(text)
                    .font(
                        Font.subheadline
                            .weight(.bold)
                    )
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                
                
            }
        }.padding(.vertical,8)
            .padding(.horizontal,64)
        
        
    }
    
}

struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomButton(text: "Hi There",fixedSize: false)
    }
}
