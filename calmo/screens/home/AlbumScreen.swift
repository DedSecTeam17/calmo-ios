//
//  AlbumScreen.swift
//  calmo
//
//  Created by Mohammed Elamin on 13/09/2023.
//

import SwiftUI

struct AlbumScreen: View {
    var body: some View {
        AppBody { navManager in
            
            
            
     
            ScrollView(.vertical) {
                Rectangle()
                    .fill(.clear)
                    .frame(height: 80)
            HStack(alignment: .top) {
                Image("top_p1")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100,height: 100)
                    .clipShape(RoundedCorner(radius: 10,corners: [.topRight,.bottomLeft]))
                    .clipShape(RoundedCorner(radius: 30,corners: [.topLeft,.bottomRight]))
                .overlay(alignment : .bottom) {
                    Button {
                        
                    } label: {
                        Image("play")
                            .padding(.all,4)
                            .background(.ultraThinMaterial)
                            .foregroundColor(Color.primary.opacity(0.20))
                            .foregroundStyle(.ultraThinMaterial)
                            .clipShape(Circle())
                            .offset(y:-10)
                            .offset(x: 20)
                            
                    }

                }
            .padding(.all)
                
                VStack(alignment: .leading) {
                    HStack(alignment: .center) {
                        Text("Rescue me One Republic")
                            .font(.body.weight(.bold))
                            .padding(.trailing)
                        Spacer()
                        Button {
                            
                        } label: {
                            Image("like")
                        }

                    }.padding(.trailing)
                    
                    HStack(alignment: .center) {
                        Text("Album  /  2021")
                            .font(.caption.weight(.light))
                  

                    }.padding(.trailing)
                    HStack(alignment: .center) {
                        Text("18 Songs - 2h 20min")
                            .font(.caption.weight(.light))
                  
                        Spacer()
                        
                        Button {
                            
                        } label: {
                            Image("upload")
                        }

                    }.padding(.trailing)
                    
                }.padding(.vertical)
                
                
            }
        
            
            Text("TRACK LIST")
                .font(.caption.weight(.semibold))
                .padding(.horizontal)
            
                
                LazyVStack {
                    ForEach(1...20, id: \.self) { i in

                        HStack(alignment: .center) {
                            
                            VStack(alignment: .leading) {
                                Text("Milkshake")
                                    .font(.caption.weight(.semibold))
                                Text("Harry Styles")
                                    .font(.caption2.weight(.light))
                                    .padding(.top,1)


                            }
                            Spacer()
              
                            Text("3:24")
                                .font(.caption2.weight(.light))
                                .padding(.top,1)
                        }.padding(.horizontal)
                            .padding(.vertical,4)
                    }
                }
                
            }.overlay (alignment : .top){
                PostloginTopBar(
                    
                    leadingText: "album",
                    leadingIcon: "arrowleft", onLeadingTapped:  {
                        navManager.pop()
                    })
            }
            
            
            
        }
    }
}

struct AlbumScreen_Previews: PreviewProvider {
    static var previews: some View {
        AlbumScreen()
            .environmentObject(NavigationManager())
    }
}
