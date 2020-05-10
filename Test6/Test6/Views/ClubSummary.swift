//
//  ClubSummary.swift
//  Test6
//
//  Created by mikecurtis on 20/07/2019.
//  Copyright © 2019 mikecurtis. All rights reserved.
//

import SwiftUI
import Combine

struct ClubSummary: View {
     
 var ObjectIndex: Int
  @EnvironmentObject var settings :  UserSettings
    var CardImage: String
    var IconImage: String
   var Club:String
     
  

    var body: some View {
        ZStack {
            
            VStack{
              Image(settings.ClubInfo[ObjectIndex].GroundImage).resizable().frame(width: 150, height: 100).cornerRadius(10)
                ZStack{
                if settings.ClubInfo[ObjectIndex].BeenTo == true
                
                {
                      
                   
                    
                Image(systemName: "eye.fill").foregroundColor(.green).offset(x:-55,y: -25)
                   
                
                
                }
                
                else
                
                {
                     Image(systemName: "eye.fill").foregroundColor(.gray).offset(x:-55,y: -25)
                }
              
                if settings.ClubInfo[ObjectIndex].FavGround == true
                
                {
                Image(systemName: "star.fill").foregroundColor(.yellow).offset(x:55,y: -25)
                
                }
                
                else
                
                {
                    Image(systemName: "star").foregroundColor(.gray).offset(x:55,y: -25)
                     
                }
                
                
                }
                
                Text(settings.ClubInfo[ObjectIndex].ShortName)
              
                
            }
            Image(settings.ClubInfo[ObjectIndex].ClubImage).resizable().frame(width: 25, height: 25).offset(x: -55, y: -45)
            
            
            
            
        }
        
        
        
    }
}

#if DEBUG
struct ClubSummary_Previews: PreviewProvider {
    static var previews: some View {
        ClubSummary(ObjectIndex: 0, CardImage: "Club1",IconImage: "Badge1",Club: "Man Utd")
    }
}
#endif

