//
//  ChatScreen.swift
//  calmo
//
//  Created by Mohammed Elamin on 22/09/2023.
//

import SwiftUI

struct ChatScreen: View {
    let primaryColor = ThemeManager(theme: lightTheme).currentTheme.primaryColor
    @State var text:String = ""
    
    
    @State private var rotation: Double = 0
    var body: some View {
        AppBody { navManager in
            PostloginTopBar(
                
                leadingText: "Mohammed ",
                
                leadingIcon: "arrowleft", trailingIcon: "more", onLeadingTapped:  {
                    navManager.pop()
                },onTrailingTapped: {},  centerTitle: true)
            
            ScrollViewReader { scrollViewProxy in
                ScrollView(.vertical,showsIndicators: false) {
                    
                    
                    LazyVStack {
                        ForEach(0..<20,id: \.self) { index in
                            if Double(index+1).truncatingRemainder(dividingBy: 2) == 0 {
                                FromMessage()
                                    .id(index)
                            }else {
                                ToMessage()
                                    .id(index)
                                
                            }
                        }
                        
                        
                    }.padding(.horizontal)
                    
                    Spacer(minLength: 90)
                        .id(20)
                    
                    
                }.overlay (alignment : .bottom){
                    
                    HStack {
                        CustomTextFiled(text: $text,hintText: "search...",isSecureText: false,requireValidation: false, backgroundColor: .clear,validationResult: { Bool in
                            
                        },trailingContents : AnyView(HStack(content: {
                            Button {
                                
                            } label: {
                                Image("cam")
                            }.padding(.horizontal,4)
                            
                            Button {
                                
                            } label: {
                                Image("send2")
                            }
                            
                        }).padding(.horizontal)))
                        .padding(.horizontal)
                    }
                    .background(ThemeManager(theme: lightTheme).currentTheme.backgroundColor)
                    
                    
                    
                    
                }.onAppear {
                    withAnimation {
                        scrollViewProxy.scrollTo(20,anchor: .bottom)
                    }
                }
            }
            
            
            
        }
    }
    
    func ToMessage()-> some View{
        return              HStack {
            VStack(alignment: .trailing) {
                Text("Hi there")
                    .multilineTextAlignment(.leading)
                    .font(.caption)
                
                Spacer()
                Text("10:20")
                    .font(.caption2.weight(.light))
                
            }.padding(.all)
                .background(RoundedCorner(radius: 20,corners: [.bottomLeft,.topRight,.bottomRight]).fill(.white))
            Spacer()
        }.padding(.vertical,4)
    }
    
    
    func FromMessage()-> some View{
        return              HStack {
            Spacer()
            VStack(alignment: .trailing) {
                Text("Hi there mohammed elamin")
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.white)
                    .font(.caption)
                Spacer()
                Text("10:20")
                    .font(.caption2.weight(.light))
                    .foregroundColor(.white)
                    .font(.caption)
                
                
            }.padding(.all)
                .background(RoundedCorner(radius: 20,corners: [.topLeft,.bottomLeft,.bottomRight]).fill(primaryColor))
            
        }.padding(.vertical,4)
    }
    
}

struct ChatScreen_Previews: PreviewProvider {
    static var previews: some View {
        ChatScreen()
            .environmentObject(NavigationManager())
    }
}
