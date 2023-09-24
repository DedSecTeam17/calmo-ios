//
//  AlbumHeader.swift
//  calmo
//
//  Created by Mohammed Elamin on 14/09/2023.
//

import SwiftUI

struct AlbumHeader: View {
    
    var imageName : String
    var albumTitle : String
    var songsAndDurationTitle : String
    var albumInfo : String
    
    var withLikeButton : Bool = false
    var withUploadButton : Bool = false
    
    
    var onUpload : ()->Void = {}
    var onLike : ()->Void = {}

    var body: some View {
        HStack(alignment: .top) {
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 100,height: 100)
                .clipShape(RoundedCorner(radius: 10,corners: [.topRight,.bottomLeft]))
                .clipShape(RoundedCorner(radius: 30,corners: [.topLeft,.bottomRight]))
            .overlay(alignment : .bottom) {
                GlassImageButton(imageName: "play",onTap: {
                    print("CLICKED ....")
                })
                    .offset(y:-10)
                    .offset(x: 20)

            }
        .padding(.all)
            
            VStack(alignment: .leading) {
                HStack(alignment: .center) {
                    Text(albumTitle)
                        .font(.body.weight(.bold))
                        .padding(.trailing)
                    Spacer()
                    if withLikeButton {
                        Button {
                            onLike()
                        } label: {
                            Image("like")
                        }
                    }
                  

                }.padding(.trailing)
                
                
                HStack(alignment: .center) {
                    Text(albumInfo)
                        .font(.caption.weight(.light))
              

                }.padding(.trailing)
                    .padding(.vertical,withLikeButton ? 0 : 2)
                HStack(alignment: .center) {
                    Text(songsAndDurationTitle)
                        .font(.caption.weight(.light))
              
                    Spacer()
                    
                    if withUploadButton {
                        Button {
                            onUpload()
                            
                        } label: {
                            Image("upload")
                        }
                    }
           

                }.padding(.trailing)
                    .padding(.vertical,withLikeButton ? 0 : 8)
                
            }.padding(.vertical)
            
            
        }
    }
}

struct AlbumHeader_Previews: PreviewProvider {
    static var previews: some View {
        AlbumHeader(imageName: "top_p1",albumTitle: "Rescue me One Republic",songsAndDurationTitle: "18 Songs - 2h 20min", albumInfo: "Album  /  2021",onUpload: {}, onLike: {})
    }
}
