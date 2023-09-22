//
//  ChatTab.swift
//  calmo
//
//  Created by Mohammed Elamin on 22/09/2023.
//

import SwiftUI

struct ChatTab: View {
    let primaryColor = ThemeManager(theme: lightTheme).currentTheme.primaryColor

    
    @State var text:String = ""
    var body: some View {
        AppBody { navManager in
            
            
            CustomTextFiled(text: $text,hintText: "search...",isSecureText: false,requireValidation: false, backgroundColor: .clear,validationResult: { Bool in
                
            },leadingIcon: "search")
            .padding(.horizontal)
            
            
            ScrollView(.vertical,showsIndicators: false) {
                OnlineUsers(navManager: navManager)
                
                HStack {
                    Text("recent".uppercased())
                        .fontWeight(.light)
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.vertical,4)
                RecentUsers(navManager: navManager)
                Spacer(minLength: 80)
            }
            
            
        }
    }
    
    
    func OnlineUsers(navManager  : NavigationManager) -> some View{
        
        return ScrollView(.horizontal,showsIndicators: false) {
            
            LazyHStack {
                
                
                ForEach(0..<10,id: \.self) { index in
                    VStack(alignment: .center) {
                        Image("top_al\(index+1)")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 80,height: 80)
                            .clipShape(RoundedCorner(radius: 10,corners: [.topRight,.bottomLeft]))
                            .clipShape(RoundedCorner(radius: 25,corners: [.topLeft,.bottomRight]))
                            .shadow(radius: 5)
                            .overlay(alignment : .bottomTrailing) {
                                Circle()
                                    .fill(Double(index).truncatingRemainder(dividingBy: 2) == 0 ? .green : .clear)
                                    .frame(width: 15,height: 15)
                                    .shadow(radius: 10)
                                
                            }
                        Text("Jane")

                    }.onTapGesture {
                        navManager.pushView(.ChatScreen)
                    }
                }
                
                
                
      
                
            }.frame(height: 120)
                .padding(.horizontal)
                .padding(.vertical,4)
            
        }
        
    }
    
    func RecentUsers(navManager : NavigationManager)-> some View{
        
        return LazyVStack {
     
                ForEach(0..<15,id: \.self) { index in
                    HStack(alignment: .top) {
                    Image("top_al1")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 60,height: 60)
                        .clipShape(RoundedCorner(radius: 5,corners: [.topRight,.bottomLeft]))
                        .clipShape(RoundedCorner(radius: 20,corners: [.topLeft,.bottomRight]))
                        .shadow(radius: 5)
                    
                    VStack(alignment: .leading) {
                        Text("Lusy Ivka")
                            .padding(.bottom,2)
                        Text("I’m watching Friends,what are u doin? 😍")
                            .font(.caption.weight(.light))
                       
                        
                    }
                    Spacer()
                    VStack(alignment: .trailing) {
                        Text("34 min")
                            .font(.caption2.weight(.light))
                        Text("\(index+1)")
                            .padding(.all,4)
                            .foregroundColor(.white)
                            .background(Circle().fill(primaryColor))
                    }
                    }
                    .padding(.all)
                        .background(RoundedCorner(radius: 10).fill(.white))
                        .padding(.horizontal)
                        .shadow(color: .gray.opacity(0.2),radius: 15)
                    .onTapGesture {
                        navManager.pushView(.ChatScreen)
                    }
                  
            }
                    
              
        }
        
        
    }
    
    
}

struct ChatTab_Previews: PreviewProvider {
    static var previews: some View {
        ChatTab()
            .environmentObject(NavigationManager())
    }
}
