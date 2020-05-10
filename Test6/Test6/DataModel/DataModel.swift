//
//  DataModel.swift
//  Test6
//
//  Created by mikecurtis on 27/07/2019.
//  Copyright © 2019 mikecurtis. All rights reserved.
//

import SwiftUI
import Combine


class UserSettings: ObservableObject //ObservableObject
{
   
    
    
    var newSize2018: CGFloat = 0 // change
    var newSize2017: CGFloat = 0 // change
    var newSize2016: CGFloat = 0 // change
        let ClubNumber =  [12,11,5,16,0,13,19,7,10,18,17,6,14,1,3,15,2,4,8,9]
        let Points = [98,97,72,71,70,66,57,54,52,52,50,49,45,45,40,39,36,34,26,16]
        let Won = [32,30,21,23,21,19,16,15,15,15,14,14,12,13,11,9,9,10,7,3]
        let Drawn = [2,7,9,2,7,9,9,9,7,7,8,7,9,6,7,12,9,4,5,7]
        let Lost = [4,1,8,13,10,10,13,14,16,16,16,17,17,19,20,17,20,24,26,28]

    @Published var ClubInfo : [ClubData] = []

       
        
    
}


    

    


struct ClubData: Identifiable,Codable{
  
    
     var id : Int
    var ClubImage:String
    var ClubName:String
    var GroundImage: String
    var ClubLat: Double
   var ClubLong:Double
    var PremierPostion2018: CGFloat
    var PremierPostion2017: CGFloat
    var PremierPostion2016: CGFloat
    var  BeenTo: Bool
    var  FavGround: Bool
    var NorS: String
    var ShortName: String
    
 
    
}

