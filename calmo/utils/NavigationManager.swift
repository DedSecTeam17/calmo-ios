//
//  NavigationManager.swift
//  calmo
//
//  Created by Mohammed Elamin on 28/07/2023.
//

import Foundation
import SwiftUI



enum NavigationPath: CaseIterable {
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


enum GlobalRoutes {
    static let routes : [NavigationPath:AnyView] = [
        .SplashScreen : AnyView(SplashScreen().navigationBarHidden(true)),
        .Onboarding : AnyView(OnboardingScreen().navigationBarHidden(true)),
        .SignIn : AnyView(SignInScreen().navigationBarHidden(true)),
        .ForgetPassword : AnyView(ForgetPasswordScreen().navigationBarHidden(true)),
        .VerifyCode : AnyView(VerifyCodeScreen().navigationBarHidden(true)),
        .RecoverPassword : AnyView(RecoverPasswordScreen().navigationBarHidden(true)),
        .SignUp : AnyView(SignUpScreen().navigationBarHidden(true)),
        .SignUpCategory : AnyView(SignUpCategoryScreen().navigationBarHidden(true)),
        .SignUpArtist : AnyView(SignUpArtistScreen().navigationBarHidden(true)),
        .SignUpSoicalMedia : AnyView(SignUpSocailMediaScreen().navigationBarHidden(true)),
        .MainHome : AnyView(MainHomeScreen().navigationBarBackButtonHidden(true)),
        .AccountCreated : AnyView(AccountCreatedScreen().navigationBarHidden(true))
        
    ]
    
    
    static func routerReturner(path : NavigationPath)-> some View{
        let index = GlobalRoutes.routes.index(forKey: path)!
        return GlobalRoutes.routes[index].value
    }
}

protocol NavigationManagerDelegate {
    associatedtype Route = NavigationPath
    
    func pushView(_ newValue : Route)
    func replace(_ newValue : Route)
    
    func popToRoot()
    func pop()
    func popUntil(_ targetRoute : Route)
    
    
    
}


class NavigationManager : ObservableObject , NavigationManagerDelegate {
    func replace(_ newValue: NavigationPath) {
        
        if !routes.isEmpty {
            routes.removeLast()
            routes.append(newValue)
        }
    }
    
    
    
    @Published var routes : [NavigationPath] = []
    
    
    func pushView(_ newValue: NavigationPath) {
        routes.append(newValue)
    }
    
    func popToRoot() {
        routes.removeAll()
        
    }
    
    func clearAndPush(_ newValue: NavigationPath){
        routes.removeAll()
        routes.append(newValue)
    }
    
    func pop() {
        routes.removeLast()
        
    }
    
    func popUntil(_ targetRoute: NavigationPath) {
        if self.routes.last != targetRoute {
            self.routes.removeLast()
            popUntil(targetRoute)
        }
    }
    
    
    
    
}




struct Navigator<Content:View> : View {
    
    
    let content : (NavigationManager) -> Content
    
    @StateObject var manager = NavigationManager()
    
    var body: some View {
        NavigationStack (path: $manager.routes){
            content(manager)
            
        }.environmentObject(manager)
    }
    
}

