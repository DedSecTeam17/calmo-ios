//
//  SignUpOnboardinHeader.swift
//  calmo
//
//  Created by Mohammed Elamin on 17/07/2023.
//

import SwiftUI

struct SignUpOnboardinHeader: View {
    
    var title : String
    var description : String
    
    var body: some View {
        Group {
            Spacer(minLength: 32)
            VStack(alignment: .center, spacing: 8.0) {
                Text(title)
                    .font(
                        AppFonts.title
                    )
                Text(description)
                    .font(AppFonts.caption)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black)
            }.padding(.vertical)
        }
    }
}

struct SignUpOnboardinHeader_Previews: PreviewProvider {
    static var previews: some View {
        SignUpOnboardinHeader(title: "Test", description: "description")
    }
}
