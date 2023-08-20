//
//  SignUpCategoryScreen..swift
//  calmo
//
//  Created by Mohammed Elamin on 16/07/2023.
//

import SwiftUI
import UIPilot

struct SignUpCategoryScreen: View {
    

    
    
    @State private var categoriesInfo : [CategoryInfo] = [
        CategoryInfo( imageName: "category", caption: "Country",selected: false),
        CategoryInfo(imageName: "category", caption: "Hip Hop",selected: false),
        CategoryInfo(imageName: "category", caption: "Rock",selected: false),
        CategoryInfo(imageName: "category", caption: "Hard Rook",selected: false),
        CategoryInfo(imageName: "category", caption: "Pop",selected: false),
        CategoryInfo(imageName: "category", caption: "Rap",selected: false),
        
        CategoryInfo(imageName: "category", caption: "Indie",selected: false),
        CategoryInfo(imageName: "category", caption: "Chill Out",selected: false),
        CategoryInfo(imageName: "category", caption: "Prodcase",selected: false),
    ]
    
    private var socailMediaOptionsColors : [Color] = [
        
        .green,.red,.black,.orange
    ]
    
    
    
    
    
    
    
    var body: some View {
        AppBody { navManager in
            ScrollView {
                SignUpOnboardinHeader(title: "categories", description: "Select three or more genres to match your interests")
                Spacer(minLength: 16)
                VStack {
                    LazyVGrid(columns: Array(repeating: .init(.flexible()), count: 3)) {
                        ForEach($categoriesInfo.wrappedValue,id: \.self) { item in
                            SoicalMediaItem(item)
                        }
                    }
                }
            }
            Spacer()
            SkipButton(backgroundColor: ThemeManager(theme: lightTheme).currentTheme.primaryColor,arrowCoolor: .white) {
                
                navManager.pushView(.SignUpArtist)

                
            }
            
            
        }
    }
    
    

    
    private func SoicalMediaItem(_ item: CategoryInfo) -> some View {
        
        let currentIndex : Int = self.categoriesInfo.firstIndex(of: item)!
        let isActiveIndex = item.selected!
        
        return   Button(action : {
            self.categoriesInfo[currentIndex].selected = !(self.categoriesInfo[currentIndex].selected!)
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

struct SignUpCategoryScreen_Previews: PreviewProvider {
    static var previews: some View {
        SignUpCategoryScreen()
    }
}


struct CategoryInfo : Hashable{
    
    var imageName : String?
    var caption : String?
    var selected : Bool?
}
