//
//  SearchFilterSheet.swift
//  calmo
//
//  Created by Mohammed Elamin on 14/09/2023.
//

import SwiftUI

struct SearchFilterSheet: View {
    
    
   @State var generes : [GenereModel] = [
        GenereModel(genere: .pop),
        GenereModel(genere: .reggae),
        GenereModel(genere: .hard),
        GenereModel(genere: .indie),
        GenereModel(genere: .metallica),
        GenereModel(genere: .hipHop),
        GenereModel(genere: .country),
    ]
    
    
    @State var soicalMediaIcons  : [SmallSoicalMediaIcon] = [
    
        SmallSoicalMediaIcon(imageName: "spotify", color: .green),
        SmallSoicalMediaIcon(imageName: "soundcloud", color: .orange),
        SmallSoicalMediaIcon(imageName: "apple", color: .black),
        SmallSoicalMediaIcon(imageName: "youtube", color: .red),

    ]
    
    
    @State private var isHasPreivoudCollaboration: Bool = false
    @State private var isActiveInTheCommunity: Bool = false



    
    let primaryColor = ThemeManager(theme: lightTheme).currentTheme.primaryColor
    
    
    var onClose : ()->Void = {}

    
    
    var body: some View {
        AppBody { navManager in
            PostloginTopBar(
                
             leadingText: "filters",
             leadingIcon: "close_2",
             trailingIcon: "delete", onLeadingTapped:onClose).padding(.vertical)
          
            ScrollView(.vertical) {
                HStack {
                    Text("genres".uppercased())
                        .font(.caption.weight(.light))
            
                    Spacer()
                 
                }.padding(.horizontal,24)
                    .padding(.vertical)
                
                
                HStack {
                    FlowLayout {
               
                        ForEach(0..<generes.count, id: \.self) { i in
                            Text(generes[i].genere.rawValue)
                                .foregroundColor(generes[i].isSelected ? .white:.gray)
                                .padding(.vertical,4)
                                .padding(.horizontal,8)
                                .background(
                                    RoundedRectangle(cornerRadius: 10).fill(generes[i].isSelected ? primaryColor : .clear)
                                )
                                .onTapGesture {
                                    generes[i].isSelected.toggle()
                                }.overlay {
                                    RoundedRectangle(cornerRadius: 10)
                                    .stroke(generes[i].isSelected ? .white:.gray, lineWidth: 1)
                                    
                                }.padding(.all,4)
                            
                        }
                 
                    }
                }
                
                HStack {
                    Text("social profiles".uppercased())
                        .font(.caption.weight(.light))
            
                    Spacer()
                 
                }.padding(.horizontal,24)
                    .padding(.vertical)
                
                
                HStack {
    
                    ForEach(0..<soicalMediaIcons.count,id: \.self) { index in
                        SmallSoicalMediaProfile(soicalMediaIcon: (soicalMediaIcons[index])) {
                            soicalMediaIcons[index].isSelected.toggle()
                        }
                    }
                    
                    Spacer()
                }.padding(.horizontal,24)
                
                HStack {
                    Text("Interactions".uppercased())
                        .font(.caption.weight(.light))
            
                    Spacer()
               
                 
                }.padding(.horizontal,24)
                    .padding(.vertical)
                
                Consent(imageName: "collaboration", title: "Has previous collaborations", isOn: $isHasPreivoudCollaboration)
                
                Consent(imageName: "group", title: "Active in the community", isOn: $isActiveInTheCommunity)
                    .padding(.vertical)
                
                
                CustomButton(text: "Apply filters",onTap:  onClose, fixedSize: true)
                .padding(.vertical)

                
        
                
                
            }
            
            
        }
    }
    
    
    
    func Consent(imageName : String ,title : String ,  isOn : Binding<Bool> )-> some View {
        return         HStack {
            Image(imageName)
            Text(title)
                .font(.body)
            Spacer()
            Toggle(isOn: isOn) {
                
            }
            .toggleStyle(SwitchToggleStyle(tint: primaryColor))
            .frame(width: 60)
            
        }
        .padding(.horizontal,24)
    }
    
    func SmallSoicalMediaProfile(soicalMediaIcon : SmallSoicalMediaIcon,onTap :@escaping ()->Void) ->some View{
        return Image(soicalMediaIcon.imageName)
            .resizable()
            .renderingMode(.template)
            .aspectRatio(contentMode: .fit)
            .frame(width: 25,height: 25)
            .padding(.all)
            .foregroundColor(soicalMediaIcon.isSelected ? .white : .gray)
            .background(soicalMediaIcon.isSelected ?  soicalMediaIcon.color : .gray.opacity(0.3))
            .clipShape(RoundedCorner(radius: 5,corners: [.topRight,.bottomLeft]))
            .clipShape(RoundedCorner(radius: 20,corners: [.topLeft,.bottomRight]))
            .overlay {
                RoundedCorner(radius: 20,corners: [.topLeft,.bottomRight])
                    .stroke(soicalMediaIcon.isSelected ? .clear:.gray.opacity(0.8), lineWidth: 1)
            }
          
            .onTapGesture {
                onTap()
            }
    }
}

struct SearchFilterSheet_Previews: PreviewProvider {
    static var previews: some View {
        SearchFilterSheet()
            .environmentObject(NavigationManager())
    }
}


struct GenereModel {
    var genere : Genere
    var isSelected : Bool = false
}


enum Genere : String {

    case  pop = "pop"
    case  reggae = "reggae"
    case  hard = "Hard"
    case  indie = "indie"
    case  metallica = "metallica"
    case  hipHop = "hip hop"
    case  country = "country"

    


}


struct SmallSoicalMediaIcon {
    var imageName : String
    var isSelected : Bool = false
    var color : Color
}
