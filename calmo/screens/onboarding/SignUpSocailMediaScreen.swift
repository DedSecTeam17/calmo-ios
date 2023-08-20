//
//  SignUpSocailMediaScreen.swift
//  calmo
//
//  Created by Mohammed Elamin on 16/07/2023.
//

import SwiftUI
import UIPilot

struct SignUpSocailMediaScreen: View {
    
    
    
    private var socailMediaOptions : [SoicalMediaInfo] = [
        SoicalMediaInfo( imageName: "spotify", caption: "Spotify"),
        SoicalMediaInfo(imageName: "youtube", caption: "Youtube"),
        SoicalMediaInfo(imageName: "apple", caption: "Apple"),
        SoicalMediaInfo(imageName: "soundcloud", caption: "Sound cloud"),
    ]
    
    private var socailMediaOptionsColors : [Color] = [
        
        .green,.red,.black,.orange
    ]
    
    
    
    
    @State private var selectedIndex : Int = -1
    
    
    
    var body: some View {
        AppBody { navManager in
            ScrollView {
                Header()
                Spacer(minLength: 64)
                
                
                
                VStack {
                    LazyVGrid(columns: Array(repeating: .init(.flexible()), count: 2)) {
                        ForEach(socailMediaOptions,id: \.self) { item in
                            SoicalMediaItem(item)
                        }
                        
                    }
                    
                }.padding(.horizontal,64)
                
            }
            
            SkipButton(backgroundColor: ThemeManager(theme: lightTheme).currentTheme.primaryColor,arrowCoolor: .white) {

                navManager.pushView(.SignUpCategory)
            }
            
            
            
        }
    }
    
    
    
    fileprivate func Header() -> some View {
        return Group {
            Spacer(minLength: 32)
            VStack(alignment: .center, spacing: 8.0) {
                Text("social media")
                    .font(
                        Font.custom("Open Sans", size: 28)
                            .weight(.semibold)
                    )
                Text("Select one or more music social media profile")
                    .font(Font.custom("Open Sans", size: 14))
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black)
            }.padding(.vertical)
        }
    }
    
    fileprivate func SoicalMediaItem(_ item: SoicalMediaInfo) -> some View {
        
        let currentIndex : Int = self.socailMediaOptions.firstIndex(of: item)!
        let isActiveIndex = currentIndex == self.selectedIndex
        
        return   Button(action : {
            self.selectedIndex = currentIndex
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
                        .renderingMode(.template)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50,height: 50)
                        .padding(.all)
                        .foregroundColor(isActiveIndex ? .white : .gray.opacity(0.1))
                        .background(
                            RoundedTopLeftBottomRigthCorners(cornerRadius: 20)
                            
                                .stroke(isActiveIndex ? .blue : .gray.opacity(0.5),lineWidth: isActiveIndex ? 0 :0)
                            
                        )
                        .background(
                            RoundedTopLeftBottomRigthCorners(cornerRadius: 20)
                                .fill(isActiveIndex ? self.socailMediaOptionsColors[currentIndex] : .gray.opacity(0.1))
                        )
                    
                        .transition(.opacity)
                }
                
                Text(item.caption!)
                    .foregroundColor(isActiveIndex ? .black : .gray)
            }
            
        }
        
    }
    
    
    
}

struct SignUpSocailMediaScreen_Previews: PreviewProvider {
    static var previews: some View {
        SignUpSocailMediaScreen()
    }
}


struct SoicalMediaInfo : Hashable{
    
    var imageName : String?
    var caption : String?
}
