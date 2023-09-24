//
//  HeartShape.swift
//  calmo
//
//  Created by Mohammed Elamin on 08/09/2023.
//

import SwiftUI

struct HeartShape: View {
    var body: some View {
//        Image("top_al1") // replace "your_image_name" with your actual image name
//               .resizable()
//
//               .scaledToFill()
//               .clipShape(CustomShape(thickness: 20,w: 300 , h: 180))
//               .frame(width: 200, height: 200)
//               .overlay(CustomShape(thickness: 20,w: 300 , h: 180))

        
       Text("Hi there ")
            .foregroundColor(.white)
            .padding(.all)
            .background(.blue)
            .clipShape(ChatBubbleShape(direction: .left))
                   
             
             
    }
}

struct HeartShape_Previews: PreviewProvider {
    static var previews: some View {
        HeartShape()
    }
}


struct CustomShape: Shape {
    var thickness: CGFloat
    var w : CGFloat
    var h : CGFloat

    func path(in rect: CGRect) -> Path {
     
        
        var path = Path()

        
        path.move(to: CGPoint(x: rect.minX, y: rect.minY)) // Top-left corner
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY)) // Top-right corner
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY)) // Bottom-right corner
        path.move(to: CGPoint(x: rect.minX, y: rect.maxY)) // Bottom-left corner
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY)) // Close the shape (back to
//
        path.move(to: CGPoint(x: rect.maxX, y: rect.maxY)) // Bottom-left corner
        
        path.addLine(to: CGPoint(x: rect.minX + w/1.4, y: rect.maxY))
        
        path.move(to: CGPoint(x: rect.minX, y: rect.maxY)) // Bottom-left corner

        
        path.addLine(to: CGPoint(x: rect.maxX - w/1.4, y: rect.maxY))
        
        path.move(to: CGPoint(x: rect.minX + w/1.4, y: rect.maxY))
        
        path.addLine(to: CGPoint(x: rect.minX + w/1.4, y: rect.maxY-50))
        
        path.addLine(to: CGPoint(x: rect.minX + w/2.1, y: rect.maxY-50))

        path.move(to: CGPoint(x: rect.maxX - w/1.4, y: rect.maxY))


        path.addLine(to: CGPoint(x: rect.maxX - w/1.4, y: rect.maxY-50))
        path.addLine(to: CGPoint(x: rect.maxX - w/2.1, y: rect.maxY-50))
            
        
        


        
        print(rect.minX)
         
        
        
//        path.move(to: CGPoint(x: width / 2, y: height))
        
//        path.addCurve(to: CGPoint(x: width, y: height / 3),
//                      control1: CGPoint(x: width * 2 / 3, y: height),
//                      control2: CGPoint(x: width, y: height / 2))
        
//        path.addArc(center: CGPoint(x: width * 3 / 4, y: height / 3),
//                    radius: width / 4,
//                    startAngle: .zero,
//                    endAngle: .degrees(180),
//                    clockwise: true)
//
//        path.addArc(center: CGPoint(x: width / 4, y: height / 3),
//                    radius: width / 4,
//                    startAngle: .degrees(180),
//                    endAngle: .degrees(360),
//                    clockwise: true)
//
//        path.addCurve(to: CGPoint(x: width / 2, y: height),
//                      control1: CGPoint(x: 0, y: height / 2),
//                      control2: CGPoint(x: width / 3, y: height))
        
        return path
    }
}

struct ChatBubbleShape: Shape {
    enum Direction {
        case left
        case right
    }
    
    let direction: Direction
    
    func path(in rect: CGRect) -> Path {
        return (direction == .left) ? getLeftBubblePath(in: rect) : getRightBubblePath(in: rect)
    }
    
    private func getLeftBubblePath(in rect: CGRect) -> Path {
        let width = rect.width
        let height = rect.height
        let path = Path { p in
            
            
            p.move(to: CGPoint(x: 25, y: height)) //move to minx-25 , maxY
            p.addLine(to: CGPoint(x: width - 20, y: height))
            p.addCurve(to: CGPoint(x: width, y: height - 20),
                       control1: CGPoint(x: width - 8, y: height),
                       control2: CGPoint(x: width, y: height - 8))
            p.addLine(to: CGPoint(x: width, y: 20))
            p.addCurve(to: CGPoint(x: width - 20, y: 0),
                       control1: CGPoint(x: width, y: 8),
                       control2: CGPoint(x: width - 8, y: 0))
            p.addLine(to: CGPoint(x: 21, y: 0))
            p.addCurve(to: CGPoint(x: 4, y: 20),
                       control1: CGPoint(x: 12, y: 0),
                       control2: CGPoint(x: 4, y: 8))
            p.addLine(to: CGPoint(x: 4, y: height - 11))
            p.addCurve(to: CGPoint(x: 0, y: height),
                       control1: CGPoint(x: 4, y: height - 1),
                       control2: CGPoint(x: 0, y: height))
            p.addLine(to: CGPoint(x: -0.05, y: height - 0.01))
            p.addCurve(to: CGPoint(x: 11.0, y: height - 4.0),
                       control1: CGPoint(x: 4.0, y: height + 0.5),
                       control2: CGPoint(x: 8, y: height - 1))
            p.addCurve(to: CGPoint(x: 25, y: height),
                       control1: CGPoint(x: 16, y: height),
                       control2: CGPoint(x: 20, y: height))
            
        }
        return path
    }
    
    private func getRightBubblePath(in rect: CGRect) -> Path {
        let width = rect.width
        let height = rect.height
        let path = Path { p in
            p.move(to: CGPoint(x: 25, y: height))
            p.addLine(to: CGPoint(x:  20, y: height))
            p.addCurve(to: CGPoint(x: 0, y: height - 20),
                       control1: CGPoint(x: 8, y: height),
                       control2: CGPoint(x: 0, y: height - 8))
            p.addLine(to: CGPoint(x: 0, y: 20))
            p.addCurve(to: CGPoint(x: 20, y: 0),
                       control1: CGPoint(x: 0, y: 8),
                       control2: CGPoint(x: 8, y: 0))
            p.addLine(to: CGPoint(x: width - 21, y: 0))
            p.addCurve(to: CGPoint(x: width - 4, y: 20),
                       control1: CGPoint(x: width - 12, y: 0),
                       control2: CGPoint(x: width - 4, y: 8))
            p.addLine(to: CGPoint(x: width - 4, y: height - 11))
            p.addCurve(to: CGPoint(x: width, y: height),
                       control1: CGPoint(x: width - 4, y: height - 1),
                       control2: CGPoint(x: width, y: height))
            p.addLine(to: CGPoint(x: width + 0.05, y: height - 0.01))
            p.addCurve(to: CGPoint(x: width - 11, y: height - 4),
                       control1: CGPoint(x: width - 4, y: height + 0.5),
                       control2: CGPoint(x: width - 8, y: height - 1))
            p.addCurve(to: CGPoint(x: width - 25, y: height),
                       control1: CGPoint(x: width - 16, y: height),
                       control2: CGPoint(x: width - 20, y: height))
            
        }
        return path
    }
}


