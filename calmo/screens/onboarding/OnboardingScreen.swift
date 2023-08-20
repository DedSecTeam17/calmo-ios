//
//  OnboardingScreen.swift
//  calmo
//
//  Created by Mohammed Elamin on 13/07/2023.
//

import SwiftUI
import UIPilot

struct OnboardingScreen: View {
    

    
    @State private var rotationDegrees = 0.0
    
    @State private var textOffset: CGFloat = -UIScreen.main.bounds.width + 200
    
    
    
    
    
    private var imageList : [String] = [
        "image_disk",
        "image_disk",
        "image_disk"
    ]
    
    
    private var titleList : [String] = [
        "Connect with others musicians",
        "Enjoy latest albums by your favourate weapper",
        "Download songs & album to listen to it when no internet"
    ]
    
    
    @State var activeIndex : Int = 0
    

    
    
    
    var body: some View {
        NavigationView {
            
      
        AppBody { navManager in
            
            GeometryReader { geometryReader in
                
                VStack(alignment: .center) {
                    
                    VStack(alignment: .center) {
                        Text(titleList[self.$activeIndex.wrappedValue])
                            .font(
                                AppFonts.title.bold()
                            )
                            .multilineTextAlignment(.center)
                            .lineLimit(3)
                            .padding(.all,32)
                            .offset(x: textOffset, y: 0)
                            .onAppear() {
                                withAnimation(Animation.linear(duration: 2).repeatCount(1)) {
                                    self.textOffset = 0
                                }
                            }
                            .onChange(of: self.activeIndex) { newValue in
                                self.textOffset = -UIScreen.main.bounds.width + 200
                                
                                withAnimation(Animation.linear(duration: 2).repeatCount(1)) {
                                    self.textOffset = 0
                                }
                            }
                        Image(imageList[self.$activeIndex.wrappedValue])
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(
                                width: 300,
                                height: 300
                            )
                            .shadow(color: .gray, radius: 20, x: 0, y: 0)
                            .rotationEffect( .degrees(self.rotationDegrees))
                            .onAppear() {
                                withAnimation(Animation.linear(duration: 3).repeatCount(1)){
                                    self.rotationDegrees = 360
                                }
                            }.onChange(of: self.activeIndex) { newValue in
                                self.rotationDegrees = 0
                                withAnimation(Animation.linear(duration: 3).repeatCount(1)){
                                    self.rotationDegrees = 360
                                }
                            }

                        
                        Indicator(activeIndex: self.$activeIndex.wrappedValue)
                            .padding(.vertical)
                        CustomButton(
                            imageName: "message",
                            text: "Continue with email") {
                                
                                navManager.pushView(.SignUp)

                            }
                        
                        
                    }
                    
                    SoicalMediaButtons()
                        .padding(.vertical)
                    
                    
                    FullHStack(content: HStack(content: {
                        Text("Already have an account? ")
                            .font(.footnote)
                            .multilineTextAlignment(.center)
                        TextButton(textItem: Text("Sign In").foregroundColor(ThemeManager(theme: lightTheme).currentTheme.primaryColor)) {
                            navManager.pushView(.SignIn)
                            
                        }
                    }))
                    
                    
                }
            }
        }
        .gesture(DragGesture(minimumDistance: 100).onEnded({ value in
            
            
            print(value)
            
            if value.translation.width < 0 {
                // swipe left
                print("Swiped left")
                
                print(self.activeIndex)
                if self.activeIndex >= 1 {
                    self.activeIndex -= 1
                }
            }
            
            if value.translation.width > 0 {
                // swipe right
                print("Swiped rigth")
                print(self.activeIndex)
                
                if self.activeIndex <= 1 {
                    self.activeIndex += 1
                }
            }
        }))
        
    }
    }
    
    
    
    private func Indicator(activeIndex : Int) -> some View {
        return HStack(alignment: .center) {
            ForEach(0..<3) { index in
                Circle()
                    .fill(index == activeIndex ? Color.black : Color.gray)
                    .frame(width: 10,height: 10)
            }
        }
    }
    
}

struct OnboardingScreen_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingScreen()
        
            .previewDevice("iPhone 14 Plus")
    }
}
