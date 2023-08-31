//
//  AppBody.swift
//  calmo
//
//  Created by Mohammed Elamin on 13/07/2023.
//

import SwiftUI

struct AppBody<Content:View>: View {
    
   @EnvironmentObject var navManager : NavigationManager

    
    let content: (NavigationManager) -> Content
    
    init(@ViewBuilder content:@escaping (NavigationManager) -> Content) {
        self.content = content
    }
    
    
    var body: some View {
        GeometryReader { geometryReader in
            VStack(alignment: .leading){
                Text("Hi there <3")
                content(navManager)

            }
            .frame(
                width: geometryReader.size.width,
                height: geometryReader.size.height            )
        

            .background(ThemeManager(theme: lightTheme).currentTheme.backgroundColor)
            
        }
    }
}

struct AppBody_Previews: PreviewProvider {
    static var previews: some View {
        AppBody { _ in
            Text("Hi")
        }.environmentObject(NavigationManager())
    }
}
