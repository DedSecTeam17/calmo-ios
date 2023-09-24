//
//    AlbumScreen.swift
//  calmo
//
//  Created by Mohammed Elamin on 12/09/2023.
//

import SwiftUI


struct PlayListScreen: View {
    var body: some View {
        AppBody { navManager in
            PostloginTopBarWithImage(onBackTapped: {
                navManager.pop()
            },onMoreTapped: {})
            .padding(.top,-60)
            HStack(alignment: .center) {
                Spacer()
                Text("The Mashup 2022")
                    .font(.title3.weight(.medium))
                Spacer()
            }
            .padding(.bottom,1)
            HStack(alignment: .center) {
                Spacer()
                Text("1235 likes / 1h25min")
                    .font(.caption2.weight(.light))
                Spacer()
            }
            HStack {
                HStack {
                    Button {
                        
                    } label: {
                        Image("like")
                    }.padding(.trailing)
                    
                    Button {
                        
                    } label: {
                        Image("download")
                    }
             
                }.padding(.horizontal)
                
                Spacer()
                
                HStack {
                    Button {
                        
                    } label: {
                        Image("mashup")
                    }.padding(.trailing)
                    Button {
                        
                    } label: {
                        Image("play")
                            .padding(.all,8)
                            .background(ThemeManager(theme: lightTheme).currentTheme.primaryColor)
                            .clipShape(RoundedCorner(radius: 13))
                    }
                }.padding(.horizontal)

            }.padding(.all,2)
            ScrollView(.vertical ) {
         
       
                
                

                
//                list of item
                
                
                LazyVStack {
                    ForEach(0...10,id: \.self) { index in
                        PlaylistSong(imageName: "top_al2",title: "Need you now",artist: "TVORHI")
                    }
                           
                }.padding(.vertical,16)
                
                
            }
 
            .overlay (alignment : .bottom){
                MiniPlayer()
            }}
    }
    
    func MiniPlayer()-> some View{
        return HStack(alignment: .center) {
            Image("top_al1")
                .resizable()
           
                .scaledToFill()
                .frame(width: 40,height: 35)
                .clipShape(RoundedCorner(radius: 10))
            VStack(alignment: .leading) {
                Text("Hail to the Victor")
               
                Text("30 Seconds to Mars")
                    .font(.caption2.weight(.light))
            }
            Spacer()
            Button {
                
            } label: {
                Image("play")
                    .renderingMode(.template)
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(ThemeManager(theme: lightTheme).currentTheme.primaryColor)

                
                    .frame(width: 35,height: 35)
                    .clipped()
                
                
         
                
                
            }
            
            Button {
                
            } label: {
                Image("moveforward")
                    .renderingMode(.template)
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(ThemeManager(theme: lightTheme).currentTheme.primaryColor)

                
                    .frame(width: 20,height: 20)
                    .clipped()
                
                
         
                
                
            }
            
            
           
            
        }
        .frame(height: 30)
        .padding(.all)
            .background(.ultraThinMaterial)
            .foregroundColor(Color.primary.opacity(0.70))
            .foregroundStyle(.ultraThinMaterial)
    }
}

struct PlayListScreen_Previews: PreviewProvider {
    static var previews: some View {
        PlayListScreen()
            .environmentObject(NavigationManager())
    }
}
