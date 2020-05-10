//
//  PremierLeagueTable1819.swift
//  Test6
//
//  Created by mikecurtis on 27/07/2019.
//  Copyright © 2019 mikecurtis. All rights reserved.
//

import SwiftUI

import Combine





struct PremierLeagueTable1819: View {
    @EnvironmentObject var settings :  UserSettings
    @State private var ShowModal: Bool = false
    @State private var selectedTeam:String = ""
    @State private var Wins:Int = 0
    @State private var Draw:Int = 0
    @State private var Lost:Int = 0
    @State private var Points:Int = 0
    
    
    
    var body: some View {
        
        NavigationView
            
            {
                
                List(0...19,id:\.self ){ item in
                    
                    
                    
                    HStack
                        {
                            
                            
                            
                            Text (String(item+1))
                            Image(self.settings.ClubInfo[(self.settings.ClubNumber[item])].ClubImage).resizable().clipShape(Circle()).overlay(Circle().stroke(Color.gray,lineWidth: 4)).shadow(radius: 10).frame(width: 30.0, height: 30.0)
                            
                            
                            if item < 17
                            {
                                
                                Text(String(self.settings.ClubInfo[(self.settings.ClubNumber[item.self])].ClubName)).multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)                    }
                            else
                            {
                                
                                Text(String(self.settings.ClubInfo[(self.settings.ClubNumber[item.self])].ClubName))         .foregroundColor(.red).bold().multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                                
                                Image (systemName: "r.circle.fill").foregroundColor(.red)
                                
                            }
                            
                            Spacer()
                            
                            Text(String(self.settings.Points[item.self]))
                            
                            
                    }.onTapGesture {
                        self.ShowModal.toggle()
                        self.selectedTeam = (self.settings.ClubInfo[(self.settings.ClubNumber[item.self])].ClubName)
                        self.Points = (self.settings.Points[item.self])
                        self.Wins = (self.settings.Won[item.self])
                        self.Draw = (self.settings.Drawn[item.self])
                        self.Lost = (self.settings.Lost[item.self])            }
                    
                }.sheet(isPresented: $ShowModal) {
                    LeagueTableModal(TeamName: (self.selectedTeam), Wins: self.Wins, Draw: self.Draw,Lost: self.Lost, Points: self.Points)
                    
                }
                
       
        }
       
    }
    
}

#if DEBUG
struct PremierLeagueTable1819_Previews: PreviewProvider {
    static var previews: some View {
        PremierLeagueTable1819()
    }
}
#endif




