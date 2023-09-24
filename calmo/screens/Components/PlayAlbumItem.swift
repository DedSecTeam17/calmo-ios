//
//  PlayAlbumItem.swift
//  calmo
//
//  Created by Mohammed Elamin on 20/09/2023.
//

import SwiftUI

struct PlayAlbumItem: View {
    
    
    var albumInfo : PlayAlbumInfo
    
    var onTap : ()->Void = {}
    
    var body: some View {
   
               VStack(alignment: .leading) {
                
                Image(albumInfo.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width:100,height: 100)
                    .clipShape(RoundedCorner(
                    radius: 30,
                    corners: [.topLeft,.bottomRight]
                    ))
                    .clipShape(RoundedCorner(
                    radius: 15,
                    corners: [.topRight,.bottomLeft]
                    ))
                    .overlay(alignment : .bottom) {
                        
                        GlassImageButton(imageName: "play",onTap:onTap)
                            .offset(y:-10)
                            .offset(x: 30)
                        
                    }
                
                Text(albumInfo.albumName)
                    .font(.body.weight(.semibold))
                    .padding(.bottom,4)

                Text(albumInfo.artistName)
                    .font(.caption2.weight(.light))

                Spacer()

                
            }
            .frame(width: 100,height: 160)
            .onTapGesture(perform: onTap)
        
    }
}

struct PlayAlbumItem_Previews: PreviewProvider {
    static var previews: some View {
        AppBody { navManager in
            PlayAlbumItem(albumInfo: .init(image: "top_p1", albumName: "test", artistName: "test"))
                .background(.red)
        }
        .environmentObject(NavigationManager())
        
    }
}


struct PlayAlbumInfo {
    var image : String
    var albumName : String
    var artistName : String
}
