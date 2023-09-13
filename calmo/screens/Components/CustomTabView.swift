//
//  CustomTabView.swift
//  calmo
//
//  Created by Mohammed Elamin on 06/09/2023.
//

import SwiftUI



typealias tabItem  = (image: String , title: String,applyColorFilter : Bool)

struct CustomTabView: View {
    
    
    @Binding var tabSelection : Int
    
    @Namespace private var animationNameSpace
    
    
    var tabItems : [tabItem]
    

    
    
    
    var body: some View {
        ZStack {
            Capsule()
                .frame(height: 80)
                .background(.ultraThinMaterial)
                .foregroundColor(Color.primary.opacity(0.50))
                .foregroundStyle(.ultraThinMaterial)
            
            
            HStack {
                ForEach(0..<5) { index in
                    
                    Button {
                        
                        withAnimation {
                             tabSelection = index + 1
                         }
                        
                    } label: {
                        VStack(spacing: 8) {
                            Spacer()
                            
                            if self.tabItems[index].applyColorFilter {
                                Image(self.tabItems[index].image)
                                    .renderingMode(.template)
                                    .foregroundColor(self.tabSelection == index+1 ?.orange: .white )
                            }else {
                                Image(self.tabItems[index].image)
                                 
                            }
                  
                            //                            Text(self.tabItems[index].title)
                            Spacer()

                            
                            if  self.tabSelection ==  index+1 {
                                
                                Capsule()
                                    .frame(height: 8)
                                    .foregroundColor(.orange)
                                    .matchedGeometryEffect(id: "id", in: self.animationNameSpace)
                                    .offset(y : 3)
                                  
                            }else{
                                
                                Capsule()
                                    .foregroundColor(.clear)
                                    .frame(height: 8)
                                    .offset(y : 0)
                                    .offset(y : 3)


                            }
                            
                        
                            
                            
                            


                        }
                        
                        
                    }
                    
                   
                }
            }.frame(height: 80)
          
           
            
            
        }
        .shadow( color: Color.white,radius: 40,x: 0, y: 0)

        .clipShape(Capsule())

        .padding(.horizontal)
    }
}

struct CustomTabView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabView(tabSelection: .constant(1),tabItems: [
            ("home","home",true),
            ("search","home",true),
            ("mix","home",true),
            ("chat","home",true),
            ("user","user",false),

            ])
        .previewLayout(.sizeThatFits)
        .padding(.vertical)
        .background(.gray)

        
    }
}
