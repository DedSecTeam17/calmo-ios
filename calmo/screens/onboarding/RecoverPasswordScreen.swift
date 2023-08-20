//
//  RecoverPasswordScreen.swift
//  calmo
//
//  Created by Mohammed Elamin on 15/07/2023.
//

import SwiftUI
import UIPilot

struct RecoverPasswordScreen: View {

  
    
    @State private var password : String = ""
    @State private var reEnterpassword : String = ""
    

    
    var body: some View {
        AppBody { navManager in
            CustomNavBar {
                
            }
            ScrollView {
                VStack {
                    
                    CustomForm {
                        OnboardingHeader(title: "new password", description: "Tap a new password to get access")
                        CustomTextFiled(text: $password,hintText: "Enter your password", maxLength: 10, minLength: 8,regx: .password,regxErrorMessage: "Password must contains at least one lower and upper case and one digits and special chars",isSecureText: true) { isValid in
                            
                        }
                        CustomTextFiled(text: $reEnterpassword,hintText: "Re Enter your password", maxLength: 10, minLength: 8,regx: .password,regxErrorMessage: "Password must contains at least one lower and upper case and one digits and special chars",isSecureText: true) { isValid in
                            
                        }
                        
                    }
                    
                    
                    CustomButton(text: "Recover",onTap: {
                        
                    },fixedSize: true)

                }
                
            }
            
            
            
            
        }
    }
    
}

struct RecoverPasswordScreen_Previews: PreviewProvider {
    static var previews: some View {
        RecoverPasswordScreen()
    }
}
