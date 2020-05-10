//
//  ContentView.swift
//  Test6
//
//  Created by mikecurtis on 03/07/2019.
//  Copyright © 2019 mikecurtis. All rights reserved.
//

import SwiftUI

import Combine



struct ContentView : View {
    
    @EnvironmentObject var settings :  UserSettings
    @State private var FavColor:Color = .yellow
    @State private var VisitColor:Color = .green
    @State private var ClearColor:Color = .gray
    @State private var ShowFav: Bool = true
    @State private var ShowVisited: Bool = true
    var SectionListArray = UniArray(InputArray: ["North","South","Midlands"])
    @State var FirstRun: Bool = true
    @State var TestState: Bool = true
    
    var body: some View {
        
        
        
        NavigationView {
            
            
            
            
            
            List {
                
                NavigationLink(destination:PremierLeagueTable1819().environmentObject(self.settings))
                {
                    Text ("2018/19 Season").bold().foregroundColor(.blue)            }
                
                
                
                
                Text ("All Clubs").bold().foregroundColor(.red)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack
                        {
                            
                            ForEach(settings.ClubInfo){ item in
                                
                                ClubSummary(ObjectIndex: item.id, CardImage: item.GroundImage,IconImage: item.ClubImage,Club: item.ClubName )
                                    .contextMenu
                                    {
                                                                                Button(action: {
                                            
                                                                                    
                                                                                    if self.settings.ClubInfo[item.id].FavGround == true
                                                                                        
                                            {
                                             
                                                self.settings.ClubInfo[item.id].FavGround = false
                                                
                                            }
                                            else
                                            {
                                                
                                                self.settings.ClubInfo[item.id].FavGround = true
                                            }
                                            
                                        })
                                            
                                        {
                                            HStack
                                                {
                                                    
                                                    
                                                    
                                                    
                                                    
                                                    Text("Toggle Favorites")
                                                    Image(systemName: "star.fill")
                                                    
                                                    
                                            }
                                        }
                                        
                                        
                                        
                                        Button(action: {
                                            
                                              print( self.settings.ClubInfo[item.id].BeenTo)
                                            
                                           
                                            
                                            self.TestState = self.settings.ClubInfo[item.id].BeenTo
                                            
                                            if self.TestState == true
                                            {
                                                self.settings.ClubInfo[item.id].BeenTo = false
   print( self.settings.ClubInfo[item.id].BeenTo)
   
                                            }
                                            else
                                            {
                                                self.settings.ClubInfo[item.id].BeenTo = true
     
                                                   print( self.settings.ClubInfo[item.id].BeenTo)
                                                
                                            }
                                            
                                        }){
                                            HStack
                                                {
                                                    
                                                    Text("Toggle Been To")
                                                    Image(systemName: "eye.fill")
                                                    
                                                    
                                            }
                                        }
                                        
                                        
                                        
                                }
                                
                                
                                
                                
                                
                            }
                            
                    }.frame(height: 175)
                    
                    
                }
                
                
                
                
                
                
                
                Button(action: {self.ShowVisited.toggle()}) {
                    
                    if self.ShowVisited == true
                    {
                        Text("Visited").foregroundColor(.white)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).padding(5).background(Color.green)
                            .cornerRadius(10)
                    }
                        
                    else
                    {
                        Text("Visited").foregroundColor(.green).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).background(Color.white)
                            .padding(5)
                            .border(Color.green, width: 4)
                            .cornerRadius(10)                                                                                 }
                    
                    
                }
                
                
                
                Toggle(isOn: $ShowFav) {
                    Text("Favorites").foregroundColor(.green).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    
                }
                
                
                
                
                
                Section(header:Text (SectionListArray[0]).bold().foregroundColor(.red))
                {
                    ForEach(settings.ClubInfo){ item in
                        
                        if ((self.ShowFav != true || item.FavGround == true) && item.NorS == self.SectionListArray[0])
                        {
                            VStack
                                {
                                    
                                    NavigationLink(destination: DetailView(ClubName: item).environmentObject(self.settings))
                                    {
                                        
                                        
                                        ClubTable(item: item, VisitColor: self.VisitColor, ClearColor: self.ClearColor, FavColor: self.FavColor, Beento: self.ShowVisited)
                                    }
                            }
                        }
                    }
                    
                    
                }
                
                Section(header:Text (SectionListArray[1]).bold().foregroundColor(.red))
                {
                    ForEach(settings.ClubInfo){ item in
                        
                        if ((self.ShowFav != true || item.FavGround == true) && item.NorS == self.SectionListArray[1])
                        {
                            VStack
                                {
                                    
                                    NavigationLink(destination: DetailView(ClubName: item).environmentObject(self.settings))
                                    {
                                        
                                        
                                        ClubTable(item: item, VisitColor: self.VisitColor, ClearColor: self.ClearColor, FavColor: self.FavColor, Beento: self.ShowVisited)
                                    }
                            }
                        }
                    }
                    
                    
                }
                
                Section(header:Text (SectionListArray[2]).bold().foregroundColor(.red))
                {
                    ForEach(settings.ClubInfo){ item in
                        
                        if ((self.ShowFav != true || item.FavGround == true) && item.NorS == self.SectionListArray[2])
                        {
                            VStack
                                {
                                    
                                    NavigationLink(destination: DetailView(ClubName: item).environmentObject(self.settings))
                                    {
                                        
                                        
                                        ClubTable(item: item, VisitColor: self.VisitColor, ClearColor: self.ClearColor, FavColor: self.FavColor, Beento: self.ShowVisited)
                                    }
                            }
                        }
                    }
                    
                    
                }
                
                
                
                
            }.navigationBarTitle("Premier League")
            
            
        }.onAppear(perform:
            
            
            {
                if self.FirstRun == true
                {
                    self.settings.ClubInfo = ReturnJson(json: readJSONFromFile(fileName: "DataJSON"))
                    self.FirstRun = false
                }
                
                
        }
            
            
            
            
            
        )
            .navigationBarHidden(true)
            
            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
        
        
    }
    
}


#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(UserSettings())
    }
}
#endif

struct ClubTable : View {
    
    var item: ClubData
    var VisitColor: Color
    var ClearColor: Color
    var FavColor: Color
    var Beento: Bool
    
    var body: some View {
        return VStack
            
            {
                HStack{
                    
                    Image(self.item.ClubImage).resizable().frame(width: 75, height: 75).cornerRadius(10)   
                    Text(self.item.ShortName).foregroundColor(.red).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)                     .multilineTextAlignment(.leading)
                    Spacer()
                    if self.Beento == true
                    {
                        if self.item.BeenTo
                            
                        {
                            
                            Image(systemName: "star.fill")
                                .imageScale(.large)
                                .foregroundColor(self.VisitColor).offset(x:-25)
                            
                        }
                            
                            
                        else
                            
                        {
                            Image(systemName: "star")
                                .imageScale(.large)
                                .foregroundColor(self.ClearColor)
                                .offset(x:-25)
                            
                            
                        }
                        
                    }
                    
                    
                    
                    
                    
                    if self.item.FavGround
                    {
                        
                        Image(systemName: "star.fill")
                            .imageScale(.large)
                            .foregroundColor(self.FavColor)
                    }
                        
                    else
                        
                    {
                        
                        Image(systemName: "star")
                            .imageScale(.large)
                            .foregroundColor(self.ClearColor)
                        
                    }
                }
        }
    }
}

