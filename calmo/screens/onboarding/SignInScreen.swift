//
//  SignUpScreen.swift
//  calmo
//
//  Created by Mohammed Elamin on 14/07/2023.
//

import SwiftUI
import UIPilot

struct SignInScreen: View {
    
    
    
    
    
    @State private var email : String = ""
    @State private var password : String = ""
    @State private var remeberPassword : Bool = false
    

    
    
    
    var body: some View {
        
    
        
        AppBody { navManager in
            CustomNavBar {
                
            }
            
            ScrollView {
                VStack(alignment: .center) {
                    
                    
                    CustomForm {
                        OnboardingHeader(title: "sign in / sign up", description: "Fill the form to sign in into account")
                        
                        CustomTextFiled(text: $email,hintText: "Enter your email", maxLength: 22, minLength: 6,regx: .email,regxErrorMessage: "Invalid email",isSecureText: false) { isValid in
                            
                        }
                        
                        CustomTextFiled(text: $password,hintText: "Enter your password", maxLength: 10, minLength: 8,regx: .password,regxErrorMessage: "Password must contains at least one lower and upper case and one digits and special chars",isSecureText: true) { isValid in
                            
                        }
                        
                        HStack {
                            
                            CustomToggle(isOn: $remeberPassword, message: "REMEBER")
                            Spacer()
                            TextButton(textItem:
                                        Text("Forget password?")
                                .font(.subheadline)
                                .underline()
                                .foregroundColor(.gray)) {

                                    
                                    navManager.pushView(.ForgetPassword)
                                    
                                }
                            
                            
                        }
                    }
                    
                    
                    
                    
                    CustomButton(text: "Sign In",onTap:  {
                        navManager.clearAndPush(.MainHome)
                        
                    }, fixedSize: true)
                    
                    SoicalMediaButtons()
                        .padding(.vertical,16)
                    
                }
                
            }
            
            
            
            Spacer()
            
        }
        
        
        
        
        
        
    }
    
}


struct SignInScreen_Previews: PreviewProvider {
    static var previews: some View {
        SignInScreen()
            .environmentObject(NavigationManager())
    }
}



