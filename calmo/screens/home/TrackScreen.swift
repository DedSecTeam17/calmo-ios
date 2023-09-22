//
//  TrackScreen.swift
//  calmo
//
//  Created by Mohammed Elamin on 21/09/2023.
//

import SwiftUI

struct TrackScreen: View {
    let primaryColor = ThemeManager(theme: lightTheme).currentTheme.primaryColor
    @State private var rotation: Double = 0
    var body: some View {
        AppBody { navManager in
            PostloginTopBar(
                
                leadingIcon: "arrowleft", trailingIcon: "more", onLeadingTapped:  {
                    navManager.pop()
                },onTrailingTapped: {})
            
            
            ScrollView(.vertical,showsIndicators: false) {
                
                Spacer(minLength: 20)
                
                VStack(alignment: .center) {
                    HStack {
                        Spacer()
                        Image("top_al1")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 300,height: 300)
                            .clipShape(Circle())
                            .modifier(LoopingRotation(rotation: rotation))
                            .onAppear() {
                                withAnimation(Animation.linear(duration: 30).repeatForever(autoreverses: false)) {
                                    rotation = 360
                                }
                            }
                            .shadow(radius: 20)
                        
                            .overlay(alignment : .center) {
                                
                                Rectangle()
                                    .frame(width: 80,height: 80)
                                    .background(.ultraThinMaterial)
                                    .foregroundColor(Color.primary.opacity(0.2))
                                    .foregroundStyle(.ultraThinMaterial)
                                    .clipShape(Circle())
                                
                            }
                        Spacer()
                        
                    }
                    
                    Spacer(minLength: 60)
                    
                    Text("Like it Doesn’t Hurt ")
                        .font(.title)
                    Spacer(minLength: 10)
                    
                    Text("Chris shelet")
                        .font(.body)
                        .fontWeight(.light)
                    
                    
                    
                    CustomSeekBar(progressWidth: 0.5,height: 6)
                        .padding(.horizontal,32)
                    HStack {
                        Text("3:20")
                        Spacer()
                        Text("-1:48")
                    }.padding(.horizontal,32)
                    
                    
                    
                    
                    HStack(alignment: .center) {
                        
                        
                        HStack {
                            Spacer()
                            
                            ActionButton(imageName: "reload", bgColor: .gray)
                            Spacer()
                            ActionButton(imageName: "back2", bgColor: primaryColor)
                            Spacer()
                            ActionButton(imageName: "moveback", bgColor: primaryColor)
                            Spacer()
                            
                        }
                        
                        
                        Button {
                            
                        } label: {
                            Image("play")
                                .padding(.all)
                                .background(primaryColor)
                                .clipShape(RoundedCorner(radius: 16))
                            
                        }
                        
                        
                        HStack {
                            Spacer()
                            
                            ActionButton(imageName: "moveforward", bgColor: primaryColor)
                            
                            Spacer()
                            
                            ActionButton(imageName: "forward2", bgColor: primaryColor)
                            Spacer()
                            
                            
                            ActionButton(imageName: "morehorizontal", bgColor: .gray)
                            Spacer()
                            
                        }
                        
                        
                        
                        
                        
                        
                    }
                    Spacer(minLength: 40)
                    HStack {
                        ActionButton(imageName: "volume", bgColor: .gray)
                        Spacer()
                        CustomSeekBar(progressWidth: 0.5,height: 4,bgColor: .black.opacity(0.6))
                        Spacer()
                        ActionButton(imageName: "volumeDown", bgColor: .gray)
                    }.padding(.horizontal,24)
                    
                    
                    
                }
                
            }
            
            
        }
    }
    
    func ActionButton(imageName : String , bgColor : Color) -> some View{
        return  Button {
            
        } label: {
            Image(imageName)
                .renderingMode(.template)
                .resizable()
                .scaledToFill()
                .foregroundColor(bgColor)
                .frame(width: 30,height: 30)
        }.padding(.horizontal,2)
    }
    
    
}

struct TrackScreen_Previews: PreviewProvider {
    static var previews: some View {
        TrackScreen()
            .environmentObject(NavigationManager())
    }
}


struct LoopingRotation: AnimatableModifier {
    var rotation: Double
    
    var animatableData: Double {
        get { rotation }
        set { rotation = newValue }
    }
    
    func body(content: Content) -> some View {
        content.rotationEffect(.degrees(rotation))
    }
}
