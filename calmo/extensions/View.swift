//
//  View.swift
//  calmo
//
//  Created by Mohammed Elamin on 28/07/2023.
//

import Foundation
import SwiftUI

extension View {
    func routerIterator() -> some View{
        self.navigationDestination(for: NavigationPath.self) { path in
            GlobalRoutes.routerReturner(path: path)
//                .navigationBarBackButtonHidden(true)
//                .navigationBarHidden(true)
        }
    }
}
