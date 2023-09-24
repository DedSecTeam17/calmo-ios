//
//  PlayTrackItem.swift
//  calmo
//
//  Created by Mohammed Elamin on 20/09/2023.
//

import SwiftUI

struct PlayTrackItem: View {
    
    var playTrackInfo : PlayTrackInfo
    var onTap : ()->Void = {}

    var body: some View {
        
                    HStack {
                     
                     Image(playTrackInfo.image)
                         .resizable()
                         .aspectRatio(contentMode: .fill)
                         .frame(width:60,height: 60)
                         .clipShape(RoundedCorner(
                         radius: 25,
                         corners: [.topLeft,.bottomRight]
                         ))
                         .clipShape(RoundedCorner(
                         radius: 10,
                         corners: [.topRight,.bottomLeft]
                         ))
                         .overlay(alignment : .center) {
                             
                             GlassImageButton(imageName: "play",onTap:onTap)
                      
                             
                         }
                     
                  
                        VStack {
                            Text(playTrackInfo.trackName)
                                .font(.body.weight(.semibold))
                                .padding(.bottom,4)

                            Text(playTrackInfo.artist)
                                .font(.caption2.weight(.light))
                        }

                     Spacer()
                        Text(playTrackInfo.duration)
                            .font(.caption2.weight(.light))

                     
                 }
                    .padding(.horizontal)
                
                 .onTapGesture(perform: onTap)
    }
}

struct PlayTrackItem_Previews: PreviewProvider {
    static var previews: some View {
        PlayTrackItem(playTrackInfo: .init(image: "top_p1", trackName: "test", duration: "03:30", artist: "test"))
    }
}


struct PlayTrackInfo {
    var image : String
    var trackName : String
    var duration : String
    var  artist : String
    
}
