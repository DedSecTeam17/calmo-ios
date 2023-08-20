//
//  SignUpScreen.swift
//  calmo
//
//  Created by Mohammed Elamin on 16/07/2023.
//

import SwiftUI
import UIPilot

struct SignUpScreen: View {
    
    
    
    
    @State private var fullName : String = ""
    @State private var isValidFullName : Bool = false
    private let fullNameMinLength = 6
    
    
    
    @State private var password : String = ""
    @State private var isValidPassword : Bool = false
    private let passwordMinLength = 10
    
    
    
    
    @State private var email : String = ""
    @State private var isValidEmail : Bool = false
    private let emailMaxLength = 20
    
    
    
    
    
    
    
    
    var body: some View {
        AppBody { navManager in
            CustomNavBar {
                
            }
            ScrollView {
                VStack {
                    
                    CustomForm {
                        
                        
                        OnboardingHeader(title: "sign up", description: "Fill the form to create an account")
                        
                        
                        CustomTextFiled(text: $fullName,hintText: "Full name", maxLength: 22, minLength: 6,isSecureText: false) { isValid in
                            
                        }
                        
                        
                        
                        CustomTextFiled(text: $email,hintText: "Enter your email", maxLength: 22, minLength: 6,regx: .email,regxErrorMessage: "Invalid email",isSecureText: false) { isValid in
                            
                        }
                        
                        CustomTextFiled(text: $password,hintText: "Enter your password", maxLength: 10, minLength: 8,regx: .password,regxErrorMessage: "Password must contains at least one lower and upper case and one digits and special chars",isSecureText: true) { isValid in
                            
                        }
                        
                        
                    }
                    
                    CustomButton(text: "Sign Up",onTap: {
                        navManager.pushView(.SignUpSoicalMedia)
                    },fixedSize: true)
                    
                    
                }
                
                
                
                
            }
            
            
            
            
        }
    }
    
    
    func validateEmail(candidate: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: candidate)
    }
    
}

struct SignUpScreen_Previews: PreviewProvider {
    static var previews: some View {
        SignUpScreen()
    }
}
