//
//  ArtistsSheet.swift
//  calmo
//
//  Created by Mohammed Elamin on 19/09/2023.
//

import SwiftUI

struct ArtistsSheet: View {
    
    var onClose : ()->Void = {}
    
    var sheetType : Binding<SheetType>
    
    
    var risingStars : [ArtisInfo] = [
        ArtisInfo(image: "rising_star", starName: "Damon Layer", genera: "Pop / Chill /Techno"),
        
        ArtisInfo(image: "rising_star", starName: "Damon Layer", genera: "Pop / Chill /Techno"),
        ArtisInfo(image: "rising_star", starName: "Damon Layer", genera: "Pop / Chill /Techno"),
        ArtisInfo(image: "rising_star", starName: "Damon Layer", genera: "Pop / Chill /Techno"),
        ArtisInfo(image: "rising_star", starName: "Damon Layer", genera: "Pop / Chill /Techno"),
        ArtisInfo(image: "rising_star", starName: "Damon Layer", genera: "Pop / Chill /Techno")
    ]

    
    var body: some View {
        AppBody { navManager in
            PostloginTopBar(
                leadingText: sheetType.wrappedValue == .featured ? "featured artists" : "rising artists",
             leadingIcon: "close_2", onLeadingTapped:onClose).padding(.vertical)
            
            ScrollView(.vertical) {
                
                LazyVStack {
                    ForEach(0..<risingStars.count,id: \.self) { index in
                       
                        ArtistItemView(artist: risingStars[index])
                      
                        
                    }
                    
                }
                
            }
        }
    }
}



struct ArtistsSheet_Previews: PreviewProvider {
    static var previews: some View {
        ArtistsSheet(onClose: {
            
        },sheetType: .constant(.featured))
        .environmentObject(NavigationManager())
        
    }
    
}

enum SheetType {
    case featured
    case rising
}
