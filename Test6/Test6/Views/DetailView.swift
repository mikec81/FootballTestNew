import Foundation
import SwiftUI
import Combine






//extension  AnyTransition {
  //  static var SlideandFade: AnyTransition {
    //    AnyTransition.slide.combined(with: .opacity)
        
  //  }
//}

struct DetailView : View {
    @State var ClubName: ClubData
    
    
    @State private var showDetail =  false
    @State private var showGraph =  false
    @EnvironmentObject var settings :  UserSettings
    @State private var testSize2018: CGFloat = 0.0 // change
    @State var testSize2017: CGFloat = 0.0 //change
    @State var testSize2016: CGFloat = 0.0 // change
    var body: some View
        
        
    {
        ZStack {
            VStack
                {
                    
                    
                    Image(ClubName.GroundImage).resizable().frame(height:100).edgesIgnoringSafeArea(.all)
                    
                    Spacer()
            }
            
            VStack {
                
                Image(ClubName.ClubImage).resizable().clipShape(Circle()).overlay(Circle().stroke(Color.gray,lineWidth: 4)).shadow(radius: 10).frame(width: 75, height: 75).offset(y: -55)
            
            Spacer()
            }
            
            
          ZStack
            {
             
                VStack
                    {
   
                        HStack{
                            
                            if ClubName.BeenTo
                            {
                                
                                Button(action:{self.ClubName.BeenTo = false
                                    self.settings.ClubInfo[self.ClubName.id].BeenTo = false
                                    
                                }) {
                                    Image(systemName: "eye.fill")
                                        .imageScale(.large)
                                        .foregroundColor(.green)
                                }
                                
                            }
                                
                            else
                            {Button(action:{self.ClubName.BeenTo = true
                                self.settings.ClubInfo[self.ClubName.id].BeenTo = true
                            }) {
                                Image(systemName: "eye.slash")
                                    .imageScale(.large)
                                    .foregroundColor(.gray)
                                }
                                
                            }
                            
                            
                            
                            if ClubName.FavGround
                            {
                                
                                Button(action:{self.ClubName.FavGround = false
                                    self.settings.ClubInfo[self.ClubName.id].FavGround = false
                                    
                                }) {
                                    Image(systemName: "star.fill")
                                        .imageScale(.large)
                                        .foregroundColor(.yellow)
                                }
                                
                            }
                                
                            else
                            {Button(action:{self.ClubName.FavGround = true
                                self.settings.ClubInfo[self.ClubName.id].FavGround = true
                            }) {
                                Image(systemName: "star")
                                    .imageScale(.large)
                                    .foregroundColor(.gray)
                                }
                                
                            }
                            
                            
                            
                            
                            Text (ClubName.ClubName).foregroundColor(.red).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).font(.body)
                            
                            Button(action: {
                                    withAnimation{
                                        self.showDetail.toggle()
                                                                           if self.showDetail == true
                                        {
                                              
                                            
                                            self.settings.newSize2018 = ((200*(21-(self.ClubName.PremierPostion2018))/20))
                                            self.settings.newSize2017 = ((200*(21-(self.ClubName.PremierPostion2017))/20))
                                            self.settings.newSize2016 = ((200*(21-(self.ClubName.PremierPostion2016))/20))
                                            
                                            
                                            
                                            
                                        }
                                        else{
                                            self.settings.newSize2018 = 0
                                            self.settings.newSize2017 = 0
                                            self.settings.newSize2016 = 0
                                            
                                        }
                                        
                                    }
                                })
                                    
                                    
                                {
                                    Image(systemName: "chevron.right.circle")
                                        .imageScale(.large)
                                        .foregroundColor(.red)
                                        .rotationEffect(.degrees(showDetail ? 90:0))
                                    
                                   
                                }
                                
                            }.offset(y: 75).padding(.bottom, 0)
                            
                          
                                                                   
                            if showDetail{
                               
                                
                                VStack{
                                    
                                  
                                    
                                    HStack(alignment: .bottom){
                                        
                                        BarChart(testSize: testSize2018, testColor: .blue)
                                        BarChart(testSize: testSize2017, testColor: .red)
                                        BarChart(testSize: testSize2016, testColor: .green)
                                    }
                                    
                                    HStack{
                                        
                                        
                                        
                                        Text("2018").foregroundColor(.blue).onAppear(perform: {self.testSize2018 = self.settings.newSize2018})
                                            
                                            .onDisappear(perform: {
                                                
                                                self.testSize2018 = 0
                                                
                                                self.settings.newSize2018 = 0})
                                        
                                        
                                        Text("2017").foregroundColor(.red)
                                            .onAppear(perform: {self.testSize2017 = self.settings.newSize2017})
                                            
                                            .onDisappear(perform: {
                                                
                                                self.testSize2017 = 0
                                                
                                                self.settings.newSize2017 = 0})
                                        
                                        
                                        Text("2016").foregroundColor(.green)
                                            
                                            
                                            .onDisappear(perform: {
                                                
                                                self.testSize2016 = 0
                                                
                                                self.settings.newSize2016 = 0})
                                            
                                            .onAppear(perform: {self.testSize2016 = self.settings.newSize2016})
                                        
                                        
                                        
                                    }.frame(alignment: .center)
                                    
                                    
                                    
                                }.frame(width: 50, height: 300,alignment: .bottom)
                                    .offset(y:(150)).padding(.bottom, (0))

                        }
                        
                  Spacer()
                 
                }
                
                
ZStack
    {
        VStack{
         Spacer()
            Divider()
                
                
                MapView(MapLong: ClubName.ClubLong, MapLat: ClubName.ClubLat, PinName: ClubName.ClubName).frame(height: 150).padding(10).offset(y:0)
        }
                }
                }
                
            }
        }
    }



#if DEBUG
struct DetailView_Previews : PreviewProvider {
    static var previews: some View {
        
        
        DetailView(ClubName: ClubData(id: 2, ClubImage: "Badge14",ClubName: "Man Utd",GroundImage: "Club14",ClubLat: 53.4631, ClubLong: -2.29139,PremierPostion2018:1, PremierPostion2017:20,PremierPostion2016:1,BeenTo: false,FavGround: true,NorS: "North",ShortName:"Man Utd")).environmentObject(UserSettings())
        
        
        
    }
}
#endif

struct BarChart : View {
    var testSize: CGFloat = 0.0
    var testColor: Color = .blue
    var body: some View {
        return RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/20/*@END_MENU_TOKEN@*/)
            
            .frame(width: 40, height: testSize,  alignment: .bottom)
            
            .foregroundColor(testColor)
    }
}
