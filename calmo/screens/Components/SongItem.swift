//
//  SongItem.swift
//  calmo
//
//  Created by Mohammed Elamin on 14/09/2023.
//

import SwiftUI

struct SongItem: View {
    
    var songName : String
    var artistName : String
    var duration : String
    var body: some View {
        HStack(alignment: .center) {
            
            VStack(alignment: .leading) {
                Text(songName)
                    .font(.caption.weight(.semibold))
                Text(artistName)
                    .font(.caption2.weight(.light))
                    .padding(.top,1)


            }
            Spacer()

            Text(duration)
                .font(.caption2.weight(.light))
                .padding(.top,1)
        }.padding(.horizontal)
            .padding(.vertical,4)
    }
}

struct SongItem_Previews: PreviewProvider {
    static var previews: some View {
        SongItem(songName: "Milkshake",artistName: "Harry Styles",duration: "3:24")
    }
}
