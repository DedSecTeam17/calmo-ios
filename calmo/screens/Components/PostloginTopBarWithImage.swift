//
//  PostloginTopBarWithImage.swift
//  calmo
//
//  Created by Mohammed Elamin on 12/09/2023.
//

import SwiftUI

struct PostloginTopBarWithImage: View {
    
    
    
    
    
    var onBackTapped : ()->Void = {}

    var onMoreTapped : ()->Void = {}

    var body: some View {
        
        
        HStack {
            Image("top_bar_img")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 160)
                .clipShape(RoundedBottomCorners(cornerRadius: 20))
            
            .overlay{
    //            Image("artist_icon")
    //
                
                Rectangle()
                  .foregroundColor(.clear)
                  .frame(width: 70, height: 70)
                  .background(
                    Image("artist_icon")
                      .resizable()
                      .aspectRatio(contentMode: .fill)
                      .frame(width: 70, height: 70)
                      .clipped()
                  )
                  .cornerRadius(26)
                  .shadow(color: Color(red: 0.23, green: 0.28, blue: 0.32).opacity(0.28), radius: 11, x: 5, y: 8)

                    .offset(y:40)
              
            }
            .overlay(alignment : .center ) {
                HStack(alignment: .center) {
                    

                    IconButton(
                        iconName: "arrowleft", onTap: onBackTapped, cornerRadius: 20)
               
                    Spacer()
                    
                    IconButton(
                        iconName: "more", onTap: onMoreTapped,  cornerRadius: 20)
              


                }
                .padding(.all)
            }
        }
        
   
    }
}

struct PostloginTopBarWithImage_Previews: PreviewProvider {
    static var previews: some View {
        PostloginTopBarWithImage()
    }
}
