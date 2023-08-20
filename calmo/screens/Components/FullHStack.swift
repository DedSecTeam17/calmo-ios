//
//  FullHStack.swift
//  calmo
//
//  Created by Mohammed Elamin on 16/07/2023.
//

import SwiftUI

struct FullHStack<Content:View>: View {
    
    var content : Content?
    
    init(content: Content? = nil) {
        self.content = content
    }
    
    
    
    var body: some View {
        HStack {
            Spacer()
            self.content
            Spacer()
        }
    }
}

struct FullHStack_Previews: PreviewProvider {
    static var previews: some View {
        FullHStack(content: Text("Hi There"))
            .padding(.all)
        
    }
}
