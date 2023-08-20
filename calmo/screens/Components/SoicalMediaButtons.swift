//
//  SoicalMediaButtons.swift
//  calmo
//
//  Created by Mohammed Elamin on 14/07/2023.
//

import SwiftUI

struct SoicalMediaButtons: View {
    var body: some View {
        VStack(alignment: .center) {
            Text("or sign in with".uppercased())
                .font(
                    Font.custom("Open Sans", size: 12)
                        .weight(.bold)
                )
            .multilineTextAlignment(.center)
            HStack(alignment: .center, spacing: 8.0) {
                SoicalMediaButton(imageName: "facebook") {
                    
                }
                
                SoicalMediaButton(imageName: "instagram") {
                    
                }
                
                SoicalMediaButton(imageName: "google") {
                    
                }
            }.padding(.all)
        }
        
    }
    
    func SoicalMediaButton(imageName : String , onTap : @escaping ()->Void) -> some View{
        Button(action : {
            onTap()
        }) {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 15,height: 15)
                .padding(.all)
                .background(
                    RoundedRectangle(cornerRadius: 18)
                        .stroke(Color.black,lineWidth : 1)
                )
        }.padding(.horizontal,4)
    }
    
}

struct SoicalMediaButtons_Previews: PreviewProvider {
    static var previews: some View {
        SoicalMediaButtons()
    }
}
