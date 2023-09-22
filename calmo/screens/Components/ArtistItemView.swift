//
//  ArtistItemView.swift
//  calmo
//
//  Created by Mohammed Elamin on 19/09/2023.
//

import SwiftUI

struct ArtistItemView: View {
    
    
    
    var artist : ArtisInfo
    
    
    var onTap : ()->Void = {}

    var body: some View {

        
        HStack(alignment: .center) {
            Image(artist.image)
                 .resizable()
            
                 .scaledToFill()
                 .frame(width: 40,height: 40)
                 .clipShape(RoundedCorner(radius: 5,corners: [.topRight,.bottomLeft]))
                 .clipShape(RoundedCorner(radius: 16,corners: [.topLeft,.bottomRight]))
             VStack(alignment: .leading) {
                 Text(artist.starName)
                     .padding(.bottom,1)
                 Text(artist.genera)
                     .font(.caption2.weight(.light))
             }
            Spacer()
             
            Button {
                
            } label: {
                Image("save")
                    .resizable()
                    .renderingMode(.template)
                    .foregroundColor(.gray)
                 
                    .scaledToFit()
                    .frame(width: 25)
                    .clipped()
                    
            }

         }.padding(.horizontal,16)
    
             .padding(.vertical,4)
             .onTapGesture {
                 onTap()
             }
    }
}

struct ArtistItemView_Previews: PreviewProvider {
    static var previews: some View {
        ArtistItemView(artist: ArtisInfo(image: "rising_star", starName: "String", genera: "test")) {
            print("CLIKCED..")
        }
        
    }
}


struct ArtisInfo {
    var image : String
    var  starName : String
    var genera : String
    
    
}
