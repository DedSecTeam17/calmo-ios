//
//  CustomForm.swift
//  calmo
//
//  Created by Mohammed Elamin on 16/07/2023.
//

import SwiftUI

struct CustomForm<Content:View>: View {
    
    
    var content:Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        VStack {
            
            self.content
       
        }.padding(.all,16)
    }
}

struct CustomForm_Previews: PreviewProvider {
    static var previews: some View {
        CustomForm {
            Text("Test")
        }
    }
}
