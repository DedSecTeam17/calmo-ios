//
//  calmoApp.swift
//  calmo
//
//  Created by Mohammed Elamin on 13/07/2023.
//

import SwiftUI

@main
struct calmoApp: App {
    
    
    @StateObject var appRoutes : Routes = Routes()

    
    var body: some Scene {
        WindowGroup {
            ContentView()

            
      
        }
    }
}


class Routes: ObservableObject {
    @Published var paths: [AppRoute] = []
}

