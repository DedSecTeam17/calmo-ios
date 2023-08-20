//
//  UIPilot.swift
//  calmo
//
//  Created by Mohammed Elamin on 13/07/2023.
//

import Foundation


import UIPilot



extension UIPilot {
    func replace(route : AppRoute){
        self.pop()
        
        DispatchQueue.main.asyncAfter(deadline: .now()+1){
            self.push(route as! T)

        }
    }
    
}


