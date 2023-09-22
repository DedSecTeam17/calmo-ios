//
//  SearchScreen.swift
//  calmo
//
//  Created by Mohammed Elamin on 14/09/2023.
//

import SwiftUI

struct SearchTap: View {
    @State  var text : String = ""
    
    
    @State  var selectedCategory : SearchType = .beastResutl
    
    
    @State private var offset: CGFloat = -200
    @State private var appear = false
    
    var options : [SearchType] = [
        .beastResutl,.songs,.playists,.albums

    ]
    
    var hotThisWeek = [
        "pop",
        "reggae",
        "Hard",
        "indie",
        "metallica",
        "hip hop",
        "country",

    ]

    
    let primaryColor = ThemeManager(theme: lightTheme).currentTheme.primaryColor

    var body: some View {
        AppBody { navManager in
            
            CustomTextFiled(text: $text,hintText: "search...",isSecureText: false,requireValidation: false, backgroundColor: .clear,validationResult: { Bool in
                
            },leadingIcon: "search")
            .padding(.horizontal)
            
            if !text.isEmpty {
                ScrollViewReader { scrollView in
                    ScrollView(.horizontal,showsIndicators: false) {
                        LazyHStack {
                            
                            ForEach(0..<options.count, id: \.self) { i in
                                Text(options[i].rawValue)
                                    .foregroundColor(options[i]==$selectedCategory.wrappedValue ? .white:.gray)
                                    .padding(.vertical,4)
                                    .padding(.horizontal,8)
                                
                                    .background(
                                        
                                        RoundedRectangle(cornerRadius: 10).fill(options[i]==$selectedCategory.wrappedValue ? primaryColor:.clear)
                                    )
                                    .onTapGesture {
                                        if options[i] != selectedCategory {
                                            selectedCategory = options[i]
                                            
                                            
                                            withAnimation(.spring(response: 1.0, dampingFraction: 0.5, blendDuration: 1.0)) {
                                                scrollView.scrollTo(i,anchor: .center)
                                                
                                                offset = offset == 0 ? 200 : 0
                                            }
                                            offset = -200
                                        }
                                        
                                    }.overlay {
                                        RoundedRectangle(cornerRadius: 10)
                                        .stroke(options[i]==$selectedCategory.wrappedValue ? .white:.gray, lineWidth: 1)                                 }
                                
                            }
                            
                        }
                    }.frame(height: 50)
                        .padding(.horizontal)
                }
            }else {
                
            }
     
            ScrollView(.vertical) {
                if !text.isEmpty {
                    AnyView(SearchResult(selectedSearchType: selectedCategory))
                }else{
                    
                    VStack(alignment: .leading) {
                        HStack {
                            Text("HOT THIS WEEK")
                                .font(.caption.weight(.light))
                    
                            Spacer()
                            TextButton(textItem: Text("Clear").foregroundColor(primaryColor)){
                                
                            }
                        }.padding(.all)
                        
                        
                        HStack {
                            FlowLayout {
                       
                                ForEach(0..<hotThisWeek.count, id: \.self) { i in
                                    Text(hotThisWeek[i])
                                        .foregroundColor(.gray)
                                        .padding(.vertical,4)
                                        .padding(.horizontal,8)
                                        .background(
                                            RoundedRectangle(cornerRadius: 10).fill(.clear)
                                        )
                                        .onTapGesture {
                                       
                                            
                                        }.overlay {
                                            RoundedRectangle(cornerRadius: 10)
                                            .stroke(.gray, lineWidth: 1)
                                            
                                        }.padding(.all,4)
                                    
                                }
                         
                            }
                        }.padding(.horizontal)
                        
                        HStack {
                            Text("RECENTLY")
                                .font(.caption.weight(.light))
                    
                            Spacer()
                            TextButton(textItem: Text("Clear").foregroundColor(primaryColor)){
                                
                            }
                        }.padding(.all)
                        
                        LazyVStack {
                            HStack {
                                AlbumHeader(imageName: "top_p1",albumTitle: "Rescue me One Republic",songsAndDurationTitle: "18 Songs - 2h 20min", albumInfo: "Album  /  2021",withLikeButton: false,withUploadButton: false,onUpload: {}, onLike: {})
                                Button {
                                    
                                } label: {
                                    Image("close")
                                }.padding(.horizontal)

                            }
                            HStack {
                                PlaylistSong(imageName: "top_al1",title: "Need you now",artist: "TVORHI",hideMore : true)
                                Button {
                                    
                                } label: {
                                    Image("close")
                                }.padding(.horizontal)
                            }
                            HStack {
                                PlaylistSong(imageName: "top_al2",title: "Need you now",artist: "TVORHI",hideMore : true)
                                Button {
                                    
                                } label: {
                                    Image("close")
                                }.padding(.horizontal)
                            }

                    
                     
                         }
                        .offset(x: offset)
                             .onAppear {
                                 withAnimation(.spring(response: 1.0, dampingFraction: 0.5, blendDuration: 1.0)) {
                                     offset = 0
                                 }
                             }
                        
                        
        
                        
                    }
     
              

                }
        
            }
                
        }
        }
    
    
    func SearchResult(selectedSearchType : SearchType)->  any View{
        switch selectedSearchType {
            
        case .beastResutl:
           return LazyVStack {
                ForEach(0..<2, id: \.self) { i in
                    AlbumHeader(imageName: "top_p\(i+1)",albumTitle: "Rescue me One Republic",songsAndDurationTitle: "18 Songs - 2h 20min", albumInfo: "Album  /  2021",withLikeButton: false,withUploadButton: false,onUpload: {}, onLike: {})

                }
               ForEach(0..<3, id: \.self) { i in
        
                   PlaylistSong(imageName: "top_al1",title: "Need you now",artist: "TVORHI")

               }
               AlbumHeader(imageName: "cover",albumTitle: "Rescue me One Republic",songsAndDurationTitle: "18 Songs - 2h 20min", albumInfo: "Album  /  2021",withLikeButton: false,withUploadButton: false,onUpload: {}, onLike: {})
               ForEach(0..<3, id: \.self) { i in
        
                   PlaylistSong(imageName: Double(i).truncatingRemainder(dividingBy: 2) == 0 ? "top_p2" : "top_p1",title: "Need you now",artist: "TVORHI")

               }
       
        
           }   .offset(x: offset)
                .onAppear {
                    withAnimation(.spring(response: 1.0, dampingFraction: 0.5, blendDuration: 1.0)) {
                        offset = 0
                    }
                }
        case .songs:
            return LazyVStack {
                 ForEach(0..<10, id: \.self) { i in
                     SongItem(songName: "Milkshake",artistName: "Harry Styles",duration: "3:24")

                 }
        
         
             }
            .offset(x: offset)
                 .onAppear {
                     withAnimation(.spring(response: 1.0, dampingFraction: 0.5, blendDuration: 1.0)) {
                         offset = 0
                     }
                 }
        case .playists:
            return LazyVStack {
                 ForEach(0..<10, id: \.self) { i in
                     PlaylistSong(imageName: Double(i).truncatingRemainder(dividingBy: 2) == 0 ? "top_p2" : "top_p1",title: "Need you now",artist: "TVORHI")                 }
        
         
             }
            .offset(x: offset)
                 .onAppear {
                     withAnimation(.spring(response: 1.0, dampingFraction: 0.5, blendDuration: 1.0)) {
                         offset = 0
                     }
                 }
        case .albums:
            return LazyVStack {
                 ForEach(0..<10, id: \.self) { i in
                     AlbumHeader(imageName: Double(i).truncatingRemainder(dividingBy: 2) == 0 ? "top_p2" : "top_p1",albumTitle: "Rescue me One Republic",songsAndDurationTitle: "18 Songs - 2h 20min", albumInfo: "Album  /  2021",withLikeButton: false,withUploadButton: false,onUpload: {}, onLike: {})
                 }
        
         
             }
            .offset(x: offset)
                 .onAppear {
                     withAnimation(.spring(response: 1.0, dampingFraction: 0.5, blendDuration: 1.0)) {
                         offset = 0
                     }
                 }
      
        }
        
    }
    
    }



struct SearchTap_Previews: PreviewProvider {
    static var previews: some View {
        SearchTap()
            .environmentObject(NavigationManager())
    }
}





enum SearchType : String {
    case beastResutl = "best results"
    case songs = "songs"
    case playists = "playists"
    case albums = "albums"

    
}


struct FlowLayout: Layout {
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
         let sizes = subviews.map { $0.sizeThatFits(.unspecified) }
         
         var totalHeight: CGFloat = 0
         var totalWidth: CGFloat = 0
         
         var lineWidth: CGFloat = 0
         var lineHeight: CGFloat = 0
         
           for size in sizes {
             if lineWidth + size.width > proposal.width ?? 0 {
                 totalHeight += lineHeight
                 lineWidth = size.width
                 lineHeight = size.height
             } else {
                 lineWidth += size.width
                 lineHeight = max(lineHeight, size.height)
             }

             totalWidth = max(totalWidth, lineWidth)
         }

         totalHeight += lineHeight
         
         return .init(width: totalWidth, height: totalHeight)
     }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        let sizes = subviews.map { $0.sizeThatFits(.unspecified) }
        
        var lineX = bounds.minX
        var lineY = bounds.minY
        var lineHeight: CGFloat = 0
        
        for index in subviews.indices {
            if lineX + sizes[index].width > (proposal.width ?? 0) {
                lineY += lineHeight
                lineHeight = 0
                lineX = bounds.minX
            }
            
            subviews[index].place(
                at: .init(
                    x: lineX + sizes[index].width / 2,
                    y: lineY + sizes[index].height / 2
                ),
                anchor: .center,
                proposal: ProposedViewSize(sizes[index])
            )
            
            lineHeight = max(lineHeight, sizes[index].height)
            lineX += sizes[index].width
        }
    }
}
