//
//  CustomToggle.swift
//  calmo
//
//  Created by Mohammed Elamin on 16/07/2023.
//

import SwiftUI

struct CustomToggle: View {
    
    @Binding var isOn: Bool
    var message : String
    
    var body: some View {
        HStack {
            Toggle("", isOn: $isOn)
                .toggleStyle(SwitchToggleStyle(tint: ThemeManager(theme: lightTheme).currentTheme.primaryColor))
                .frame(width: 45)
            
            
            Text("REMEMBER")
                .font(.subheadline.bold())
                .foregroundColor(.gray)
                .padding(.horizontal)
        }
    }
}

struct CustomToggleTest: View {
    @State private var isOn: Bool = false

  
    
    var body: some View {
        CustomToggle(isOn: $isOn, message: "Message")

    }
    
}

struct CustomToggleTest_Previews: PreviewProvider {

    static var previews: some View {
        CustomToggleTest()
    }
}
