//
//  regx.swift
//  calmo
//
//  Created by Mohammed Elamin on 16/07/2023.
//

import Foundation





enum AppRegx {
    
    case email,password
    
    
    func get()->String{
        switch self {
        case .email:
            return  "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
            
        case .password :
            return "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}"
        }
    }
    
    
}
