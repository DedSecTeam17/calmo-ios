//
//  VerifyCodeScreen.swift
//  calmo
//
//  Created by Mohammed Elamin on 15/07/2023.
//

import SwiftUI
import UIPilot

struct VerifyCodeScreen: View {
    
//    @EnvironmentObject private var pilot : UIPilot<AppRoute>
    
    
    
    enum FoucsedField {
        case first,second,third,forth
    }
    
    
    
    @State private var firstDigit: String = ""
    @State private var secondDigit: String = ""
    @State private var thirdDigit: String = ""
    @State private var forthDigit: String = ""
    
    
    @FocusState private var focusState : FoucsedField?
    
    
    
    private var maxDigit : Int = 1
    
    
    
    
    
    
    var body: some View {
        AppBody { navManager in
            CustomNavBar {
                
            }
            
            ScrollView {
                VStack {
                    VStack {
                        
                        
                        OnboardingHeader(title: "verify code", description: "Tap code we sent you to your email address.")
                        
                        HStack {
                            Spacer()
                            OtpTextField(foucsedField: .first, digit: $firstDigit)
                            Spacer()
                            OtpTextField(foucsedField: .second, digit: $secondDigit)
                            Spacer()
                            OtpTextField(foucsedField: .third, digit: $thirdDigit)
                            Spacer()
                            OtpTextField(foucsedField: .forth, digit: $forthDigit)
                            Spacer()
                            
                            
                        }
                        .padding(.vertical)
                        .onAppear{
                            focusState = .first
                            
                        }
                    }.padding(.horizontal,24)
                    
                    
                    CustomButton(text: "Verify",onTap : {
                        navManager.pushView(.RecoverPassword)
                        
                    }, fixedSize: true)
                    
                    
                    
                    
                    HStack {
                        Text("Dont have a code?")
                            .foregroundColor(.black.opacity(0.5))
                        TextButton(textItem:       Text("Resnd now")
                            .foregroundColor(.black)
                            .underline()) {
                                
                            }
                        
                        
                        
                    }
                    .padding(.vertical)
                    
                }
                
            }
            
        }
    }
    
    
    func OtpTextField(foucsedField : FoucsedField, digit : Binding<String>) -> some View{
        
        
        let primaryColor : Color = ThemeManager(theme: lightTheme).currentTheme.primaryColor
        let backgroundColor : Color = ThemeManager(theme: lightTheme).currentTheme.backgroundColor
        var isActiveField : Bool = $focusState.wrappedValue == foucsedField
        return  TextField("", text: digit)
            .padding(.all)
            .multilineTextAlignment(.center)
            .font(.system(size: 24).bold())
            .foregroundColor(primaryColor)
            .frame(width: 60,height: 55)
            .background(
                RoundedRectangle(cornerRadius: 10)
                
                    .stroke(isActiveField ?  primaryColor : .black,lineWidth: 1.5)
                
            )
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(isActiveField ? primaryColor.opacity(0.1) : backgroundColor)
            )
            .focused($focusState,equals: foucsedField)
            .onChange(of: digit.wrappedValue) { newValue in
                print(newValue)
                if digit.wrappedValue.count > maxDigit {
                    digit.wrappedValue = String(newValue.prefix(maxDigit))
                }
                
                
                let weHaveNewTextValue = newValue.count > 0
                
                
                if foucsedField == .first {
                    if weHaveNewTextValue {
                        self.focusState = .second
                        
                    }
                    
                }else if foucsedField == .second {
                    if weHaveNewTextValue {
                        self.focusState = .third
                        
                    }else {
                        self.focusState = .first
                        
                    }
                }else if foucsedField == .third {
                    
                    if weHaveNewTextValue {
                        self.focusState = .forth
                        
                    }else {
                        self.focusState = .second
                        
                    }
                    
                }else if foucsedField == .forth {
                    
                    if weHaveNewTextValue {
                        
                    }else {
                        self.focusState = .third
                        
                    }
                    
                }
            }
        
    }
    
    
    
}

struct VerifyCodeScreen_Previews: PreviewProvider {
    static var previews: some View {
        VerifyCodeScreen()
    }
}

