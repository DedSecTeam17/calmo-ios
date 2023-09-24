//
//  MainHomeScreen.swift
//  calmo
//
//  Created by Mohammed Elamin on 17/07/2023.
//

import SwiftUI





struct MainHomeScreen: View {
    @State private var selectedTab = 4
    
    @State private var offsetX: CGFloat = 0
    
    @State private var artistsSheetType : SheetType = .featured

    
    
    var titles =  [
    "best of the week",
    "search",
    "artists",
    "",
    ""
    ]
    
    @State private var isSearchConfigPresented = false
    @State private var isArtistSheetPresented = false

    
    init() {
        UITabBar.appearance().isHidden = true
    }

    var body: some View {
        AppBody { navManager in
            
            AnyView(            TopBarByTapType(selectedTab: selectedTab)
)
            Spacer(minLength: 16)

            TabView(selection: $selectedTab) {
                HomeTab()

                       .tag(1)



                SearchTap()
                   
                       .tag(2)


                MixTap(onSeeAllFeaturedArtists: {
                    isArtistSheetPresented = true
                    artistsSheetType = .featured
                },onSeeAllRisingArtists: {
                    isArtistSheetPresented = true
                    artistsSheetType = .rising

                })
                    .sheet(isPresented: $isArtistSheetPresented, content: {
                        ArtistsSheet(onClose: {
                            isArtistSheetPresented.toggle()
                        },sheetType: $artistsSheetType)
                    })
                       .tag(3)


                
                ChatTab()
                       .tag(4)
                
                AppBody(content: { NavigationManager in

                    Text("profile tab")


                })

                       
                       .tag(5)


            }.overlay(alignment : .bottom) {
                CustomTabView(tabSelection: $selectedTab,tabItems: [
                 ("home","home",true),
                 ("search","home",true),
                 ("mix","home",true),
                 ("chat","home",true),
                 ("user","user",false),

                ])
            }
         
        }
        
    }
    
    func TopBarByTapType(selectedTab : Int  )->  any View{
        
        switch selectedTab {
         case 1:
            return   PostloginTopBar(
                leadingText: "best of the week",
                trailingIcon: "more", onTrailingTapped:  {
                    print("DO SEARCH")
                    offsetX = 100
                })
        case 2:
           return   PostloginTopBar(
               leadingText: "search",
               trailingIcon: "filters", onTrailingTapped:  {
                   print("DO SEARCH")
                   offsetX = 100
                   isSearchConfigPresented.toggle()
               }).sheet(isPresented: $isSearchConfigPresented) {
                   SearchFilterSheet {
                       print("toggle...")
                       isSearchConfigPresented.toggle()
                   }
               }
        case 3:
            return   PostloginTopBar(
                leadingText: "artists",
                trailingIcon: "more", onTrailingTapped:  {
                    print("DO SEARCH")
                    offsetX = 100
                })
        case 4:
            return   PostloginTopBar(
                leadingText: "messages",
                trailingIcon: "edit", onTrailingTapped:  {
         
                })
            
        default:
           return PostloginTopBar(
            leadingText: "best of the week",
            trailingIcon: "more", onTrailingTapped:  {
                print("DO SEARCH")
                offsetX = 100
            })
        }
    }
}

struct MainHomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainHomeScreen()
            .environmentObject(NavigationManager())
    }
}

