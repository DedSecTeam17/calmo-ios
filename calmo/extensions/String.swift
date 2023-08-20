//
//  String.swift
//  calmo
//
//  Created by Mohammed Elamin on 16/07/2023.
//

import Foundation


extension String {

    func validate(regx : AppRegx)->Bool{
        return NSPredicate(format: "SELF MATCHES %@", regx.get()).evaluate(with: self)
    }
}
