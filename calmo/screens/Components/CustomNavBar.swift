//
//  CustomNavBar.swift
//  calmo
//
//  Created by Mohammed Elamin on 14/07/2023.
//

import SwiftUI
import UIPilot

struct CustomNavBar<Content:View>: View {
    
    
    let content: Content
    
    @EnvironmentObject var navManager : NavigationManager

    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    
    var body: some View {
        
        
        if navManager.routes.isEmpty {
            EmptyView()
        }else {
            
                   GeometryReader { reder in
                      
                       VStack {
                           ZStack {
                                   Image("tool_bar")
                                       .resizable()
                                       .aspectRatio(contentMode: .fill)
                                       .frame(width: reder.size.width,height: 100)
                                       .clipShape(RoundedBottomCorners(cornerRadius: 20))
                                   
                                       .padding(.top,0)
                                   
                                   HStack {
                                       Button(action : {
                                           navManager.pop()
                                       }){
                                           Image("arrowleft")
                                               .resizable()
                                               .aspectRatio(contentMode: .fit)
                                               .frame(width: 25,height: 25)
                                               .padding(.all,8)
                                               .background(
                                           
                                                   RoundedRectangle(cornerRadius: 16)
                                                       .fill(Color.white)
                                               )
                                               .padding(.all)
                                       }
                                       Spacer()
                                   }.padding(.top,0)
                                   
                                   
                           }
                           Spacer(minLength: 16)

                       }
                           
                  

                       
                   }
                   .frame(height: 100)
                   .background(ThemeManager(theme: lightTheme).currentTheme.backgroundColor)
        }

  
   

    }
}

struct CustomNavBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavBar {
            
        }.environmentObject(NavigationManager())
    }
}
struct RoundedBottomCorners: Shape {
    var cornerRadius: CGFloat = .infinity
    var corners: UIRectCorner = [.bottomLeft, .bottomRight]
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
        return Path(path.cgPath)
    }
}

struct RoundedTopLeftBottomRigthCorners: Shape {
    var cornerRadius: CGFloat = .infinity
    var corners: UIRectCorner = [.topLeft, .bottomRight]
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
        return Path(path.cgPath)
    }
}



struct RoundedTopRBottomLCorners: Shape {
    var cornerRadius: CGFloat = .infinity
    var corners: UIRectCorner = [.topRight, .bottomLeft]
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
        return Path(path.cgPath)
    }
}





struct RoundedTopCorners: Shape {
    var cornerRadius: CGFloat = .infinity
    var corners: UIRectCorner = [.topRight, .topLeft]
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
        return Path(path.cgPath)
    }
}


struct TopRoundedShape: Shape {
    var radius: CGFloat
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: 0, y: rect.maxY))
        path.addLine(to: CGPoint(x: 0, y: radius))
        path.addArc(center: CGPoint(x: radius, y: radius), radius: radius, startAngle: Angle(degrees: 180), endAngle: Angle(degrees: 90), clockwise: false)
        path.addLine(to: CGPoint(x: rect.maxX - radius, y: 0))
        path.addArc(center: CGPoint(x: rect.maxX - radius, y: radius), radius: radius, startAngle: Angle(degrees: 90), endAngle: Angle(degrees: 0), clockwise: false)
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: 0, y: rect.maxY))
        
        return path
    }
}


struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
