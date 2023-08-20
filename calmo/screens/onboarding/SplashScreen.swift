//
//  SplashScreen.swift
//  calmo
//
//  Created by Mohammed Elamin on 13/07/2023.
//

import SwiftUI
import UIPilot



struct SplashScreen: View {
    

    
//    @EnvironmentObject var navManager : NavigationManager

    
    

    var body: some View {
        GeometryReader { geometry in
            AppBody {  navManager in
       
                SplashScreenHeader(geometry: geometry)
                SkipButton {
                    navManager.replace(.Onboarding)

                }
                
            }
        }
        
    }
    
    func SplashScreenHeader(geometry : GeometryProxy) -> some View {
        return VStack {
            
            Image("app_logo")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(
                    width: geometry.size.width*0.3,height: geometry.size.width*0.3
                )
            Text("Feel free to enjoy your music")
                .font(AppFonts.caption)
                .multilineTextAlignment(.center)
        }.frame(
            width: geometry.size.width,
            height: geometry.size.height * 0.80
        )
    }
    
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}


struct SecondView: View {
    var body: some View {
        Text("You're now on the second screen!")
            .navigationBarTitle("Second Screen", displayMode: .inline)
    }
}

