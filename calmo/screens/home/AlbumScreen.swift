//
//  AlbumScreen.swift
//  calmo
//
//  Created by Mohammed Elamin on 13/09/2023.
//

import SwiftUI

struct AlbumScreen: View {
    var body: some View {
        AppBody { navManager in
            
            
            PostloginTopBar(
                
                leadingText: "album",
                leadingIcon: "arrowleft", onLeadingTapped:  {
                    navManager.pop()
                })
     
            ScrollView(.vertical) {

                AlbumHeader(imageName: "top_p1",albumTitle: "Rescue me One Republic",songsAndDurationTitle: "18 Songs - 2h 20min", albumInfo: "Album  /  2021",withLikeButton: true,withUploadButton: true,onUpload: {}, onLike: {})
        
            
                HStack {
                    Text("TRACK LIST")
                    .font(.caption.weight(.semibold))
                .padding(.horizontal)
                    Spacer()
                }
            
                
                LazyVStack {
                    ForEach(1...20, id: \.self) { i in

                        SongItem(songName: "Milkshake",artistName: "Harry Styles",duration: "3:24")

                    }
                }
                
            }.overlay (alignment : .top){
   
            }
            
            
            
        }
    }
}

struct AlbumScreen_Previews: PreviewProvider {
    static var previews: some View {
        AlbumScreen()
            .environmentObject(NavigationManager())
    }
}
