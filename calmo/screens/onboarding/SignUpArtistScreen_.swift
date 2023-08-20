//
//  SignUpArtistScreen_.swift
//  calmo
//
//  Created by Mohammed Elamin on 16/07/2023.
//

import SwiftUI
import UIPilot

struct SignUpArtistScreen: View {
    

    
    @State private var artistsInfo : [ArtistInfo] = [
        ArtistInfo( imageName: "artist", caption: "Martina",selected: false),
        ArtistInfo(imageName: "artist", caption: "Jason Derulo",selected: false),
        ArtistInfo(imageName: "artist", caption: "Julia Styles",selected: false),
        ArtistInfo(imageName: "artist", caption: "Travis",selected: false),
        ArtistInfo(imageName: "artist", caption: "Billie Eilish",selected: false),
        ArtistInfo(imageName: "artist", caption: "Halsey",selected: false),
        ArtistInfo(imageName: "artist", caption: "Betty Daniels",selected: false),
        ArtistInfo(imageName: "artist", caption: "Blair",selected: false),
        ArtistInfo(imageName: "artist", caption: "Aalyah",selected: false),
    ]
    
    private var socailMediaOptionsColors : [Color] = [
        
        .green,.red,.black,.orange
    ]
    
    
    
    
    
    
    
    var body: some View {
        AppBody { navManager in
            ScrollView {
                SignUpOnboardinHeader(title: "artists", description: "Select three or more artists to follow")
                Spacer(minLength: 16)
                
                
                
                VStack {
                    LazyVGrid(columns: Array(repeating: .init(.flexible()), count: 3)) {
                        ForEach($artistsInfo.wrappedValue,id: \.self) { item in
                            SoicalMediaItem(item)
                                .padding(.vertical)
                        }
                        
                    }
                    
                }
            }
            Spacer()
            SkipButton(backgroundColor: ThemeManager(theme: lightTheme).currentTheme.primaryColor,arrowCoolor: .white) {
                
                navManager.pushView(.AccountCreated)

            }
            
            
        }
    }
    
    
    private func SoicalMediaItem(_ item: ArtistInfo) -> some View {
        
        let currentIndex : Int = self.artistsInfo.firstIndex(of: item)!
        let isActiveIndex  = item.selected!
        
        return   Button(action : {
            print(currentIndex)
            self.artistsInfo[currentIndex].selected = !(self.artistsInfo[currentIndex].selected!)
            
            dump(self.artistsInfo)
        }) {
            VStack(alignment: .center) {
                
                ZStack {
                    if isActiveIndex {
                        Image("tick")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20,height: 20)
                            .padding(.top,-60)
                            .padding(.leading,80)
                    }
                    Image(item.imageName!)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 70,height: 70)
                        .overlay(        RoundedTopLeftBottomRigthCorners(cornerRadius: 20)
                                         
                            .fill(isActiveIndex ? .blue.opacity(0) : .gray.opacity(0.4)))
                    
                        .shadow(radius: 2)
                        .transition(.opacity)
                }
                
                Text(item.caption!)
                    .foregroundColor(isActiveIndex ? .black : .gray)
            }
            
        }
        
    }
}

struct SignUpArtistScreen_Previews: PreviewProvider {
    static var previews: some View {
        SignUpArtistScreen()
    }
}
struct ArtistInfo : Hashable{
    
    var imageName : String?
    var caption : String?
    var selected : Bool?
}
