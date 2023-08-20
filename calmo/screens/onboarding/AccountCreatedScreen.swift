//
//  AccountCreatedScreen.swift
//  calmo
//
//  Created by Mohammed Elamin on 16/07/2023.
//

import SwiftUI

struct AccountCreatedScreen: View {
    var body: some View {
        AppBody { navManager in
            
            VStack {
                
                
                
                ProfileItem(item: ProfileInfo(imageName: "artist",caption: "",selected: true))
                BottomHeader()
                    .padding(.horizontal,32)
                
                
                
                
                CustomButton(imageName: "check",text: "Let’s begin") {
                    navManager.clearAndPush(.MainHome)

                    
                }
                

                
                
                
                
            }
            
            
            
        }
    }
    
    
    
    fileprivate func BottomHeader() -> some View {
        return Group {
            VStack(alignment: .center, spacing: 8.0) {
                Text("account created")
                    .font(
                        Font.custom("Open Sans", size: 28)
                            .weight(.semibold)
                    )
                Text("Connect and start collabs with other artists that match your insterests")
                    .font(Font.custom("Open Sans", size: 14))
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black)
            }.padding(.vertical)
        }
    }
    
    
    
     func ProfileItem(item: ProfileInfo) -> some View {
        
        let isActiveIndex  = item.selected!
        
        return     VStack(alignment: .center) {
            
            ZStack {
                if isActiveIndex {
                    Image("tick")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30,height: 30)
                        .padding(.top,-80)
                        .padding(.leading,120)
                }
                Image(item.imageName!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100,height: 100)
                    .overlay(        RoundedTopLeftBottomRigthCorners(cornerRadius: 20)
                                     
                        .fill(isActiveIndex ? .blue.opacity(0) : .gray.opacity(0.4)))
                
                    .shadow(radius: 2)
                    .transition(.opacity)
            }
            
            Text(item.caption!)
                .foregroundColor(isActiveIndex ? .black : .gray)
        }
        
    }
    
    
}

struct AccountCreatedScreen_Previews: PreviewProvider {
    static var previews: some View {
        AccountCreatedScreen()
    }
}
struct ProfileInfo : Hashable{
    var imageName : String?
    var caption : String?
    var selected : Bool?
}
