//
//  MixTap.swift
//  calmo
//
//  Created by Mohammed Elamin on 19/09/2023.
//

import SwiftUI

struct MixTap: View {
    
    
    
    var onSeeAllFeaturedArtists : ()->Void = {}
    
    var onSeeAllRisingArtists : ()->Void = {}

    
    var topFeaturedArtists : [FeaturedArtist]  = [
        FeaturedArtist(image: "top_p1", title: "Hozier", description: "Cindi lauper"),
        FeaturedArtist(image: "top_al4", title: "Baynk", description: "Cindi lauper"),
        FeaturedArtist(image: "top_al3", title: "Beating", description: "Cindi lauper"),
        FeaturedArtist(image: "top_p3", title: "Hozier", description: "Cindi lauper"),
        FeaturedArtist(image: "top_p1", title: "Hozier", description: "Cindi lauper"),
    ]
    
    
    
    
    var risingStars : [ArtisInfo] = [
        ArtisInfo(image: "rising_star", starName: "Damon Layer", genera: "Pop / Chill /Techno"),
        
        ArtisInfo(image: "rising_star", starName: "Damon Layer", genera: "Pop / Chill /Techno"),
        ArtisInfo(image: "rising_star", starName: "Damon Layer", genera: "Pop / Chill /Techno"),
        ArtisInfo(image: "rising_star", starName: "Damon Layer", genera: "Pop / Chill /Techno"),
        ArtisInfo(image: "rising_star", starName: "Damon Layer", genera: "Pop / Chill /Techno"),
        ArtisInfo(image: "rising_star", starName: "Damon Layer", genera: "Pop / Chill /Techno")
    ]
    
    let primaryColor = ThemeManager(theme: lightTheme).currentTheme.primaryColor
    
    var body: some View {
        AppBody { navManager in
           
            
            ScrollView (.vertical){
                
                HStack {
                    Text("featured".uppercased())
                    Spacer()
                    TextButton(textItem: Text("SEE ALL").foregroundColor(primaryColor)) {
                        onSeeAllFeaturedArtists()
                        
                    }
                }
                .padding(.horizontal)
                
                ScrollView (.horizontal,showsIndicators: false){
                    
                    LazyHStack {
                        ForEach(0..<topFeaturedArtists.count,id: \.self) { index in
                            
                            TopFeaturedArtist(featuredArtist: topFeaturedArtists[index]) {
                                navManager.pushView(.ArtistScreen)
                                
                            }
                            
                        }
                    }
                    
                }
                .frame(height: 160)
                .padding(.all)
                
                HStack {
                    Text("rising stars".uppercased())
                    Spacer()
                    TextButton(textItem: Text("SEE ALL").foregroundColor(primaryColor)) {
                        onSeeAllRisingArtists()
                        
                    }
                }
                .padding(.horizontal)
                
                
                LazyVStack {
                    ForEach(0..<risingStars.count,id: \.self) { index in
                       
                        ArtistItemView(artist: risingStars[index]){
                            navManager.pushView(.ArtistScreen)
                        }
                      
                        
                    }
                    
                }
                
            
                
                
            }
            
            
        }

    }
    
   
    
    func TopFeaturedArtist(featuredArtist:FeaturedArtist , onTap : @escaping ()->Void) -> some View{
        return   VStack(alignment: .leading) {
            
            Image(featuredArtist.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width:90,height: 90)
                .clipShape(RoundedCorner(
                radius: 20,
                corners: [.topLeft,.bottomRight]
                ))
                .clipShape(RoundedCorner(
                radius: 5,
                corners: [.topRight,.bottomLeft]
                ))
                .overlay(alignment : .bottom) {
                    
                    GlassImageButton(imageName: "save",onTap: {
                        print("CLICKED ....")
                    })
                        .offset(y:-5)
                        .offset(x: 23)
                    
                }
            
            Text(featuredArtist.title)
                .font(.body.weight(.semibold))
                .padding(.bottom,4)

            Text(featuredArtist.description)
                .font(.caption2.weight(.light))

            Spacer()

            
        }
        .frame(width: 100)
        .onTapGesture(perform: onTap)
    }
    
}

struct MixTap_Previews: PreviewProvider {
    static var previews: some View {
        MixTap()
            .environmentObject(NavigationManager())
    }
}


struct FeaturedArtist {
    var image : String
    var title : String
    var description : String
}


