//
//  ContentView.swift
//  calmo
//
//  Created by Mohammed Elamin on 13/07/2023.
//

import SwiftUI
import UIPilot
struct ContentView: View {
    
    @EnvironmentObject var appRoutes : Routes
    
    var body: some View {
        Navigator { manager in
            
            Group{
                
            }
            .routerIterator()
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now()+1){
                    manager.pushView(.SplashScreen)
                }
            }
            
        }

    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(NavigationManager())
    }
}




enum AppRoute: Equatable {
    case SplashScreen
    case Onboarding
    case SignIn
    case ForgetPassword
    case VerifyCode
    case RecoverPassword
    case SignUp
    case SignUpCategory
    case SignUpArtist
    case SignUpSoicalMedia
    case AccountCreated
    case MainHome
}


