//
//  GlassImageButton.swift
//  calmo
//
//  Created by Mohammed Elamin on 19/09/2023.
//

import SwiftUI

struct GlassImageButton: View {
    
    var imageName : String
    var onTap : ()->Void = {}
    var body: some View {
        Button {
            onTap()
        } label: {
            Image(imageName)
                .padding(.all,4)
                .background(.ultraThinMaterial)
                .foregroundColor(Color.primary.opacity(0.20))
                .foregroundStyle(.ultraThinMaterial)
                .clipShape(Circle())
         
                
        }
    }
}

struct GlassImageButton_Previews: PreviewProvider {
    static var previews: some View {
        GlassImageButton(imageName: "play",onTap: {
            print("CLICKED ....")
        })
            .padding(.all)
            .background(.blue)
    }
}
