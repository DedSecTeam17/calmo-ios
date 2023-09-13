//
//  HomeTab.swift
//  calmo
//
//  Created by Mohammed Elamin on 07/09/2023.
//

import SwiftUI
import WaterfallGrid


enum ImageSize {
   case small
    case big
}

struct TopAlbum {
    var imageName : String
    var size : ImageSize
}

struct HomeTab: View {
    
    
    let topPlaylists = ["top_p1","top_p2","top_p3"]
    var topAlbums : [TopAlbum] = [
    
        TopAlbum(imageName: "top_al1", size: .small),
        TopAlbum(imageName: "top_al2", size: .small),
        TopAlbum(imageName: "top_al3", size: .small),
        TopAlbum(imageName: "top_al4", size: .small),

    
    ]
    
//   @State var smallToBig : Bool = true
    
    
    func getAlbumsWithRightSize() ->[TopAlbum] {
        var smallToBig : Bool = true
        
        var topAlbumsCopied = topAlbums
        topAlbums.enumerated().forEach { index , album  in
            if Double(index+1).truncatingRemainder(dividingBy: 2) == 0 {
                
                if smallToBig {
                    
                    var small = topAlbums[index-1]
                    var big = topAlbums[index]


                    topAlbumsCopied[index-1].size = .small
                    topAlbumsCopied[index].size = .big
                    
                    smallToBig = false

                }else{
                    topAlbumsCopied[index-1].size = .big
                    topAlbumsCopied[index].size = .small
                    
                    smallToBig = true
                    
                }
                
            }
         

        }
        
        
        print(topAlbumsCopied)
    
        
        return topAlbumsCopied
        
    }

    
    var body: some View {
        AppBody(content: { navManager in
            
    
            
            ScrollView {
                Rectangle()
                    .fill(.clear)
                    .frame(height: 80)
                HStack {
                    Text("TOP PLAYLISTS")
                        .font(.subheadline.weight(.semibold))
                    .padding(.horizontal)
                    Spacer()
                }
                ScrollView(.horizontal) {
                          // 2
                          LazyHStack {
          
                              
                              ForEach(topPlaylists,id: \.self ) { item in
                                  TopPlaylisttItem(imageName: item) {
                                      navManager.pushView(.PlayListScreen)
                                  }

                              }

                              

                          }
                          .padding(.all)
                    
                }.frame(height: 240).scrollIndicators(/*@START_MENU_TOKEN@*/.hidden/*@END_MENU_TOKEN@*/, axes: /*@START_MENU_TOKEN@*/[.vertical, .horizontal]/*@END_MENU_TOKEN@*/)
        
                
                HStack {
                    Text("Top albums")
                        .font(.subheadline.weight(.semibold))
                    .padding(.horizontal)
                    Spacer()
                }
                
                WaterfallGrid(0..<getAlbumsWithRightSize().count,id: \.self) { index in
                    VStack(alignment: .leading) {
                        Image(topAlbums[index].imageName)
                            .resizable()
                            .frame(height: getAlbumsWithRightSize()[index].size == .small ? 120 : 200)
                            .aspectRatio(contentMode: .fit)
                        
                      
                          
                            .clipShape(RoundedCorner(
                            radius: 30,
                            corners: [.topLeft,.bottomRight]
                            ))
                            .clipShape(RoundedCorner(
                            radius: 10,
                            corners: [.topRight,.bottomLeft]
                            ))
                        
                        Text("Beating on my heart")
                            .font(.body.weight(.semibold))
                            .padding(.bottom,4)
      

                        Text("Cindi lauper")
                            .font(.caption2.weight(.light))
                            .padding(.bottom)
                    }.onTapGesture {
                        navManager.pushView(.AlbumScreen)
                    }
                    
                }.padding(.all)
                .gridStyle(columns: 2)

                Rectangle()
                    .fill(.clear)
                    .frame(height: 80)
                
            }
         
            
            


            

        })
    }
    
    
    func TopPlaylisttItem(imageName:String , onTap : @escaping ()->Void) -> some View{
        return   VStack(alignment: .leading) {
            
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 110,height: 120)
                .clipShape(RoundedCorner(
                radius: 20,
                corners: [.topLeft,.bottomRight]
                ))
                .clipShape(RoundedCorner(
                radius: 5,
                corners: [.topRight,.bottomLeft]
                ))
            
            Text("Beating on my heart")
                .font(.body.weight(.semibold))
                .padding(.bottom,4)

            Text("Cindi lauper")
                .font(.caption2.weight(.light))

            Spacer()

            
        }
        .frame(width: 120)
        .onTapGesture(perform: onTap)
        
  
   
     
    }
    
}





struct HomeTab_Previews: PreviewProvider {
    static var previews: some View {
        HomeTab()
            .environmentObject(NavigationManager())
    }
}
