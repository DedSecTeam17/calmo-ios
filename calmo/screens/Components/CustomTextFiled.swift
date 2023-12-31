//
//  CustomTextFiled.swift
//  calmo
//
//  Created by Mohammed Elamin on 16/07/2023.
//

import SwiftUI

struct CustomTextFiled: View {
    
    @Binding var text : String
    
    var hintText : String = ""
    
    
    var maxLength : Int
    var minLength : Int
    var regx : AppRegx?
    
    
    @State private var isValidText : Bool = false
    @State private var isValidSize : Bool = false
    
    
    
    
    var regxErrorMessage : String = ""
    
    var isSecureText : Bool = false
    var validationResult : (Bool)->Void
    
    
    @State  var sizeErrorMessage : String = ""
    
    
    
    
    
    
    var body: some View {
        VStack(alignment: .leading) {
            
            if self.isSecureText {
                SecureField(hintText, text: $text)
                    .padding(.all)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color.white)
                        
                    )
                    .onChange(of: text) { newValue in
                        if newValue.count > self.maxLength {
                            self.text = String(newValue.prefix(self.maxLength))
                            self.isValidSize = true
                            
                        }
                        
                        if newValue.count < self.minLength {
                            self.isValidSize = false
                            self.sizeErrorMessage = "Minum characters required is \(self.minLength)"
                        }else{
                            self.isValidSize = true
                            self.sizeErrorMessage = ""
                        }
                        
                        
                        if let unrappedReqx = self.regx {
                            self.isValidText = newValue.validate(regx: unrappedReqx)
                            
                        }else {
                            self.isValidText  = true
                        }
                        
                        self.validationResult(isValidSize && isValidText)
                        
                    }
                
            }else {
                TextField(hintText, text: $text)
                    .padding(.all)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color.white)
                        
                    )
                    .onChange(of: text) { newValue in
                        if newValue.count > self.maxLength {
                            self.text = String(newValue.prefix(self.maxLength))
                            self.isValidSize = true
                            
                        }
                        
                        if newValue.count < self.minLength {
                            self.isValidSize = false
                            self.sizeErrorMessage = "Minum characters required is \(self.minLength)"
                        }else{
                            self.isValidSize = true
                            self.sizeErrorMessage = ""
                        }
                        
                        
                        if let unrappedReqx = self.regx {
                            self.isValidText = newValue.validate(regx: unrappedReqx)
                            
                        }else {
                            self.isValidText  = true
                        }
                        
                        self.validationResult(isValidSize && isValidText)
                        
                    }
            }
            
            
            
            if !isValidText && !text.isEmpty {
                Text(self.regxErrorMessage)
                    .font(.caption2)
                    .foregroundColor(.orange)
                    .padding(.horizontal,4)
            }
            
            if !isValidSize && !text.isEmpty {
                Text(self.sizeErrorMessage)
                    .font(.caption2)
                    .foregroundColor(.orange)
                    .padding(.horizontal,4)
            }
            
            
        }.padding(.vertical,4)
    }
}

struct ParentView: View {
    @State  var text : String = "HI there"
    @State  var validForm : Bool = false
    
    
    var body: some View {
        VStack {
            
            if self.validForm {
                Text("VALID FORM")
                    .foregroundColor(.green)
                    .padding(.all)
            }
            
            CustomTextFiled(text: $text,hintText: "email", maxLength: 22, minLength: 6,regx: .email,regxErrorMessage: "invalid email",isSecureText: true) { isValid in
                
                self.validForm = isValid
                
            }
        }
        .padding(.all)
        .background(.gray.opacity(0.5))
    }
}

struct CustomTextFiled_Previews: PreviewProvider {
    static var previews: some View {
        ParentView()
    }
}
