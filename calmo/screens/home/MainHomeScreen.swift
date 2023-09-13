//
//  MainHomeScreen.swift
//  calmo
//
//  Created by Mohammed Elamin on 17/07/2023.
//

import SwiftUI

struct MainHomeScreen: View {
    @State private var selectedTab = 1
    
    @State private var offsetX: CGFloat = 0

    init() {
        UITabBar.appearance().isHidden = true
    }

    var body: some View {
        AppBody { navManager in

            TabView(selection: $selectedTab) {
                HomeTab()

                       .tag(1)



                AppBody(content: { NavigationManager in

                    Text("search tap ")

                })

                       .tag(2)


                AppBody(content: { NavigationManager in

                    Text("mix tap ")

                })
      
                       .tag(3)


                AppBody(content: { NavigationManager in

                    Text("chat tap ")


                })

                       
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
         
        }.overlay (alignment : .top){
            PostloginTopBar(
            leadingText: "best of the week",
            trailingIcon: "search") {
                print("DO SEARCH")
                offsetX = 100
            }
    
            
        }

        
    }
}

struct MainHomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainHomeScreen()
            .environmentObject(NavigationManager())
    }
}
