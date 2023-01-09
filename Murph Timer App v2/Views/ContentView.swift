//
//  ContentView.swift
//  Murph Timer App v2
//
//  Created by Zack Wagner on 1/6/23.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var managerClass: ManagerClass = ManagerClass()
    @State var phase = 0
    @State var titles = ["Mile 1","Calitchtenics","Mile 2", "Murph Complete, Congrats!"]
    @State var times = [0.0, 0.0, 0.0, 0.0]
    @State var mile1String = ""
    @State var calisthenicsString = ""
    @State var mile2String = ""
    @State var finalString = ""
    
    
    var body: some View {
        VStack{
            
            Text(titles[phase]).padding()
            
                
            Text(ManagerClass.timeToString(mil: managerClass.secondElapsed))
                .font(.largeTitle)
                .multilineTextAlignment(.leading)
                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                .frame(width: .infinity)
                
                
                
                
               
            
            
            switch managerClass.mode {
            case .stopped:
                withAnimation{
                    Button {
                        managerClass.start()
                    } label: {
                        Image(systemName: "play.fill")
                            .foregroundColor(.white)
                            .font(.title)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(100)
                    }
                }
            case .running:
                withAnimation{
                    HStack{
                        //pause button
                        Button {
                            managerClass.pause()
                        } label: {
                            Image("PAUSE").resizable().frame(width: 100.0, height: 100.0).scaledToFill()
                            
                        }
                        //continue button
                        Button {
                            times[phase] = managerClass.secondElapsed
                            
                            if phase == 0{
                                mile1String = "Mile 1 Split: " +
                                ManagerClass.timeToString(mil: managerClass.secondElapsed)
                            }
                            else if phase == 1{
                                calisthenicsString = "Calisthenics Split: " + String(format: "%.2f", times[phase] - times[0])
                            }
                            else if phase == 2{
                                mile2String = "Mile 2 Split: " + String(format: "%.2f", (times[phase] - times[1]))
                                managerClass.finish()
                                finalString = "Total Time: " + ManagerClass.timeToString(mil: managerClass.secondElapsed)
                            }
                            else {
                                managerClass.finish()
                                finalString = "Total Time: " + ManagerClass.timeToString(mil: managerClass.secondElapsed)
                            }
                            
                            phase += 1
                            
                            
                        } label: {
                            Image("DONE").resizable().frame(width: 100.0, height: 100.0).scaledToFill()
                            
                        }
                    }
                }
                
                
                
                
                
                
            case .paused:
                withAnimation{
                    HStack{
                        Button {
                            managerClass.start()
                        } label: {
                            Image("RESUME").resizable().frame(width: 100.0, height: 100.0).scaledToFill()
                        }
                        Button {
                            managerClass.reset()
                            phase = 0
                            mile1String = ""
                            mile2String = ""
                            calisthenicsString = ""
                            finalString = ""
                        } label: {
                            Image("RESET").resizable().frame(width: 100.0, height: 100.0).scaledToFill()
                        }
                    }
                }
            case.finished:
                withAnimation{
                    Button {
                        managerClass.reset()
                        phase = 0
                        mile1String = ""
                        mile2String = ""
                        calisthenicsString = ""
                        finalString = ""
                    } label: {
                        Image(systemName: "stop.fill")
                            .foregroundColor(.white)
                            .font(.title)
                            .padding()
                            .background(Color.yellow)
                            .cornerRadius(100)
                        
                    }
                    
                    
                }
                
            }
                Text(mile1String)
                Text(calisthenicsString)
                Text(mile2String)
                Text(finalString)
                
                
        
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
