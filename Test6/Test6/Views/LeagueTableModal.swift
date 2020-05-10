//
//  LeagueTableModal.swift
//  Test6
//
//  Created by mikecurtis on 28/07/2019.
//  Copyright © 2019 mikecurtis. All rights reserved.
//

import SwiftUI




struct LeagueTableModal: View {
    
    var TeamName: String
    var Wins: Int
    var Draw: Int
    var Lost: Int
    var Points: Int
    
    @Environment(\.presentationMode) var presentationMode
    
    
    var body: some View {
        
        VStack{
            Button("Close"){self.presentationMode.wrappedValue.dismiss()}
            Spacer()
            Text(TeamName).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).foregroundColor(.red).underline().offset(y: -150)
            Spacer()
            HStack
                {
                    
                    VStack
                        
                        {
                            
                            Text("Wins").fontWeight(.bold).foregroundColor(.blue).underline()
                            
                            Text(String(Wins)).fontWeight(.bold).foregroundColor(.yellow)
                            
                    }
                    
                    Spacer()
                    
                    VStack
                        {
                            Text("Draws").fontWeight(.bold).foregroundColor(.blue).underline()
                            
                            Text(String(Draw)).fontWeight(.bold).foregroundColor(.yellow)
                            
                    }
                    
                    
                    Spacer()
                    
                    VStack
                        
                        {
                            Text("Losses").fontWeight(.bold).foregroundColor(.blue).underline()
                            
                            Text(String(Lost)).fontWeight(.bold).foregroundColor(.yellow)
                    }
                    
                    Spacer()
                    
                    VStack
                        
                        
                        { Text("Points").fontWeight(.bold).foregroundColor(.blue).underline()
                            
                            Text(String(Points)).fontWeight(.bold).foregroundColor(.yellow)
                            
                    }
                    
            }.offset(y:-150)
            
            
            
            Spacer()
        }
    }
    
}


#if DEBUG
struct LeagueTableModal_Previews: PreviewProvider {
    static var previews: some View {
        LeagueTableModal(TeamName: "Man Utd",Wins: 10,Draw: 11,Lost: 6,Points: 66)
    }
}
#endif
