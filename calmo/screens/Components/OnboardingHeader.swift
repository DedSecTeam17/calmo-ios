//
//  OnboardingHeader.swift
//  calmo
//
//  Created by Mohammed Elamin on 16/07/2023.
//

import SwiftUI

struct OnboardingHeader: View {
    
    var title : String
    var description : String
    
    init(title: String, description: String) {
        self.title = title
        self.description = description
    }
    
    
    
    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .font(
                        Font.custom("Open Sans", size: 28)
                            .weight(.semibold)
                    ).padding(.vertical,4)
                Spacer()
            }
            
            HStack {
                Text(description)
                    .font(Font.custom("Open Sans", size: 14))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.gray)
                Spacer()
            }
            Spacer(minLength: 32)
        }
    }
}

struct OnboardingHeader_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingHeader(title: "test", description: "description")
    }
}
