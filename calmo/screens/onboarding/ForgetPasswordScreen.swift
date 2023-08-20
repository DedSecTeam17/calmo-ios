//
//  ForgetPasswordScreen.swift
//  calmo
//
//  Created by Mohammed Elamin on 15/07/2023.
//

import SwiftUI
import UIPilot

struct ForgetPasswordScreen: View {
    
    
    
    @State private var email : String = ""
    
    @State private var isValidEmail : Bool = false
    
    
    @State private var isBottomSheetShown : Bool = false
    
    
//    @EnvironmentObject private var pilot : UIPilot<AppRoute>
    
    
    
    
    private let emailMaxLength = 20
    
    
    var body: some View {
        AppBody { navManager in
            CustomNavBar {
                
            }
            Spacer(minLength: 32)
            
            ScrollView {
                VStack {
                    
                    CustomForm {
                        OnboardingHeader(title: "forgot password", description: "Tap the email address associated with your acc")
                        
                        CustomTextFiled(text: $email,hintText: "Enter your email", maxLength: 22, minLength: 6,regx: .email,regxErrorMessage: "Invalid email",isSecureText: false) { isValid in
                            
                        }
                    }
                    
                    
                    CustomButton(text: "Send instructions",onTap:  {
                        isBottomSheetShown = true
                        
                    }, fixedSize: true).sheet(isPresented: $isBottomSheetShown) {
                        
                        CheckEmailBottomSheet(navManager: navManager)
                        
                        
                    }
                    
                    
                }
                
                
            }
            
            
            
            
        }
    }
    
    func CheckEmailBottomSheet(navManager : NavigationManager)-> some View {
        return   VStack(alignment: .center){
            Spacer()
            
            Image("message")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.all,8)
                .colorMultiply(ThemeManager(theme: lightTheme).currentTheme.primaryColor)
                .frame(width: 50,height: 50)
                .background(
                    RoundedRectangle(cornerRadius: 40)
                        .fill(.gray.opacity(0.2))
                )
            
            
            Text("Check your mailbox")
                .font(
                    AppFonts.title2
                        .weight(.semibold)
                )
            
            Text("We sent the instructions to recover your account")
                .font(Font.custom("Open Sans", size: 14))
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.vertical,4)
            
            Spacer()
            
            CustomButton(text: "Check the letter",onTap : {
                isBottomSheetShown = false
       
                navManager.pushView(.VerifyCode)
                
            },fixedSize : true)
            
            
        }  .presentationDetents([.fraction(0.40)])
            .presentationDragIndicator(.visible)
    }
    
}

struct ForgetPasswordScreen_Previews: PreviewProvider {
    static var previews: some View {
        ForgetPasswordScreen()
    }
}
