//
//  JSONReadingFunctions.swift
//
//
//
//  Copyright © 2019 mikecurtis. All rights reserved.
//

import SwiftUI
import Combine



func readJSONFromFile(fileName: String) -> String
  {
var TempString: String = ""
let path = Bundle.main.path(forResource: fileName, ofType: "json")
    do {
            // Get the contents
let contents = try NSString(contentsOfFile: path! , encoding: String.Encoding.utf8.rawValue)
         TempString =  String(contents)
        }
        catch let error as NSError {
            print("Ooops! Something went wrong: \(error)")
        }
        
        return TempString
    
}

func ReturnJson(json: String) -> [ClubData] {

    let data = Data(json.utf8)
            do {
            
                let outputinfo =  try JSONDecoder().decode([ClubData].self, from: data)
             return outputinfo
            } catch {
                return {[ClubData(id: 0, ClubImage: "Badge1",ClubName: "Arsenal",GroundImage: "Club1",ClubLat: 51.554901, ClubLong: -0.108436,PremierPostion2018:1,PremierPostion2017:1,PremierPostion2016:1,BeenTo: false, FavGround: false, NorS: "South", ShortName: "Arsenal")]}()
               
          
}
}
