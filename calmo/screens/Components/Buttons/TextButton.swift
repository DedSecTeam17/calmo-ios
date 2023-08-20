//
//  TextButton.swift
//  calmo
//
//  Created by Mohammed Elamin on 16/07/2023.
//

import SwiftUI

struct TextButton: View {
    
    var textItem : Text?
    
    var onTapped : ()->Void
    

    init(textItem: Text? = nil, onTapped: @escaping () -> Void) {
        self.textItem = textItem
        self.onTapped = onTapped
    }
    
    var body: some View {
        Button(action : {
            self.onTapped()
        }){
            self.textItem
        }
    }
}

struct TextButton_Previews: PreviewProvider {
    static var previews: some View {
        TextButton(textItem: Text("Hi There")){
            
        }
    }
}
