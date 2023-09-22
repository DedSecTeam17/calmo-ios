//
//  PlaylistSong.swift
//  calmo
//
//  Created by Mohammed Elamin on 14/09/2023.
//

import SwiftUI

struct PlaylistSong: View {
    
    
    var imageName : String
    var title : String
    var artist : String
    var hideMore : Bool = false
    
    var body: some View {
        HStack(alignment: .center) {
            Image(imageName)
                .resizable()
           
                .scaledToFill()
                .frame(width: 40,height: 40)
                .clipShape(RoundedCorner(radius: 5,corners: [.topRight,.bottomLeft]))
                .clipShape(RoundedCorner(radius: 16,corners: [.topLeft,.bottomRight]))
            VStack(alignment: .leading) {
                Text(title)
                    .padding(.bottom,1)
                Text(artist)
                    .font(.caption2.weight(.light))
            }
            
            Spacer()
            if !hideMore {
                Button {
                    
                } label: {
                    Image("morehorizontal")
                }
            }

        }.padding(.horizontal,16)
            .padding(.vertical,4)
    }
}

struct PlaylistSong_Previews: PreviewProvider {
    static var previews: some View {
        PlaylistSong(imageName: "top_al2",title: "Need you now",artist: "TVORHI")
    }
}
