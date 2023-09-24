//
//  ArtistScreen.swift
//  calmo
//
//  Created by Mohammed Elamin on 19/09/2023.
//

import SwiftUI

struct ArtistScreen: View {
    
    let primaryColor = ThemeManager(theme: lightTheme).currentTheme.primaryColor

    
    
    var artistsTaps : [ArtistTap] = [
        .init(image: "music", title: "Music", tabType: .music),
        .init(image: "video", title: "Video", tabType: .video),
        .init(image: "about", title: "Aboud", tabType: .about),
    ]
    
    
    var artistAlbums : [PlayAlbumInfo] = [
      .init(image: "top_p1", albumName: "test", artistName: "test"),
      .init(image: "top_p2", albumName: "test", artistName: "test"),
      .init(image: "top_p3", albumName: "test", artistName: "test"),
      .init(image: "cover", albumName: "test", artistName: "test"),
      .init(image: "top_p1", albumName: "test", artistName: "test"),

    ]
    
    var artistsTracks : [PlayTrackInfo] = [
    
        .init(image: "top_al1", trackName: "Best friend", duration: "03:30", artist: "Luna bay"),
        
            .init(image: "top_al2", trackName: "test", duration: "03:30", artist: "test"),
            .init(image: "top_al3", trackName: "test", duration: "03:30", artist: "test"),
            .init(image: "top_al4", trackName: "test", duration: "03:30", artist: "test"),
        .init(image: "top_al1", trackName: "Best friend", duration: "03:30", artist: "Luna bay"),
        
            .init(image: "top_al2", trackName: "test", duration: "03:30", artist: "test"),
            .init(image: "top_al3", trackName: "test", duration: "03:30", artist: "test"),
            .init(image: "top_al4", trackName: "test", duration: "03:30", artist: "test"),
        .init(image: "top_al1", trackName: "Best friend", duration: "03:30", artist: "Luna bay"),
        
            .init(image: "top_al2", trackName: "test", duration: "03:30", artist: "test"),
            .init(image: "top_al3", trackName: "test", duration: "03:30", artist: "test"),
            .init(image: "top_al4", trackName: "test", duration: "03:30", artist: "test"),
    ]
    
    @State var selectedTabType : TapType = .music
    
    @State private var hideHeader = false

    
    
    
    var body: some View {
        AppBody { navManager in
            PostloginTopBar(
                
                leadingIcon: "arrowleft", trailingIcon: "more", onLeadingTapped:  {
                    navManager.pop()
                },onTrailingTapped: {})
            
            
            
   
            if !hideHeader {
                ArtistHeader()
                    .frame(maxWidth: .infinity)

                    .transition(.move(edge: .top))
                    .animation(.easeInOut(duration: 0.5))
            }
         
            
            
//            tabs are here 3 tabs
            
            
            
            
                   ScrollView(.horizontal,showsIndicators: false) {
         
                       LazyHStack {
                           ForEach(0..<artistsTaps.count,id: \.self){ index in
                               VStack{
                                   HStack{
                                       Image(artistsTaps[index].image)
                                           .renderingMode(.template)
                                           .foregroundColor(artistsTaps[index].tabType == self.selectedTabType ? .black : .gray)
                                       Text(artistsTaps[index].title)
                                           .fontWeight(artistsTaps[index].tabType == self.selectedTabType ? .semibold : .light)
                                   }.padding(.horizontal)
                                   Rectangle()
                                       .fill(artistsTaps[index].tabType == self.selectedTabType ? .black : .clear)
                                       .frame(height : 3)
                               }.onTapGesture{
                                   withAnimation {
                                       self.selectedTabType = artistsTaps[index].tabType
                                   }
                               }
                           }
                       }
                       
                   }
                   .frame(height: 50)
                   .padding(.horizontal)

   
     
            ScrollView(.vertical,showsIndicators: false) {
                GeometryReader { geometry in
                              Color.clear.preference(key: ViewOffsetKey.self, value: geometry.frame(in: .global).minY)
                          }
                          .frame(height: 0)
                LazyVStack {
                    
                    
                    HStack {
                        Text("ALBUMS")
                            .fontWeight(.light)
                        Spacer()
                    }.padding(.all)
                    
                    ScrollView(.horizontal,showsIndicators: false) {
                        
                        LazyHStack {
                            
                            ForEach(0..<artistAlbums.count) { index in
                                PlayAlbumItem(albumInfo: artistAlbums[index],onTap :{
                                    navManager.pushView(.AlbumScreen)

                                })
                                    .padding(.leading,8)
                            }
                        }
                    } .overlay(alignment : .leading) {
                                
                                LinearGradient(
                                       gradient: Gradient(stops: [
                                           .init(color: Color.white.opacity(0.0), location: 0.0),
                                           .init(color: Color.white.opacity(0.5), location: 0.5),
                                           .init(color: Color.white.opacity(1.0), location: 1.0)
                                       ]),
                                       startPoint: .trailing,
                                       endPoint: .leading
                                   )
                                    .frame(width : 50)
                                    .clipShape(RoundedCorner(radius: 20, corners: [.topRight,.bottomRight]))
                                    
                                
                            }
                            .overlay(alignment : .trailing) {
                                
                                LinearGradient(
                                       gradient: Gradient(stops: [
                                           .init(color: Color.white.opacity(0.0), location: 0.0),
                                           .init(color: Color.white.opacity(0.4), location: 0.4),
                                           .init(color: Color.white.opacity(1.0), location: 1.0)
                                       ]),
                                       startPoint: .leading,
                                       endPoint: .trailing
                                   )
                                    .frame(width : 30)
                                    .clipShape(RoundedCorner(radius: 20, corners: [.topLeft,.bottomLeft]))
                                    
                                
                            }
                    
                    HStack {
                        Text("TRACKS")
                            .fontWeight(.light)
                        Spacer()
                    }.padding(.all)
                    
                    
                    LazyVStack {
                        
                        ForEach(0..<artistsTracks.count,id: \.self) { index in
                            PlayTrackItem(playTrackInfo: artistsTracks[index],onTap : {
                                navManager.pushView(.TrackScreen)
                            })
                        }
                        
                    }
                    
                    
                    
                    
                   
                }
            
            }
            .coordinateSpace(name: "scrollView")
                 .onPreferenceChange(ViewOffsetKey.self) { offset in
                     print(offset)
                     hideHeader = offset < 100
                 }
        }
    }
    
    
    func ArtistHeader() -> some View {
        return VStack {
            HStack(alignment: .center) {
                Spacer()
                
                VStack(alignment: .center) {
                    Text("321k")
                        .font(.title.weight(.bold))
                    Text("followers")
                        .font(.caption2.weight(.light))

                }
                .padding(.horizontal)
                
                
                VStack(alignment: .center) {
                    Image("rising_star")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 70,height: 70)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    Text("Jacob Lee")
                        .multilineTextAlignment(.center)
                    Text("Artist / Musician / Writer")
                        .font(.caption2.weight(.light))
                        .multilineTextAlignment(.center)
                
                }
                
                
                
                VStack(alignment: .center) {
                    Text("125")
                        .font(.title.weight(.bold))

                    Text("following")
                        .font(.caption2.weight(.light))


                } .padding(.horizontal)

                Spacer()

                
            }
            
            HStack {
                Spacer()
                Button(
                    action : {
                       
                    }
                ){
                    HStack(alignment: .center) {
                        Image("check")
                            .renderingMode(.template)
                            .foregroundColor(.white)
                        
                        Text("Follow")
                            .foregroundColor(.white)
                    }
                    .padding(.all)
                    .padding(.horizontal)
                }
                .background(primaryColor)
                .clipShape(RoundedRectangle(cornerRadius: 16))
                Spacer()
                
                Button(
                    action : {
                       
                    }
                ){
                    HStack(alignment: .center) {
                        Image("chat")
                            .renderingMode(.template)
                            .foregroundColor(.black)
                        
                        Text("Follow")
                            .foregroundColor(.black)
                    }
                    .padding(.all)
                    .padding(.horizontal)
                }
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 16))
                
                Spacer()

            }.padding(.vertical)
        }
    }
    
}

struct ArtistScreen_Previews: PreviewProvider {
    static var previews: some View {
        ArtistScreen()
            .environmentObject(NavigationManager())
    }
}


enum TapType {
    
    case music
    case video
    case about
    
}

struct ArtistTap {
    var image : String
    var title : String
    var tabType : TapType
}


struct ViewOffsetKey: PreferenceKey {
    typealias Value = CGFloat
    static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value += nextValue()
    }
}

