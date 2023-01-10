//
//  RunFreeView.swift
//  Murph Timer App v2
//
//  Created by Zack Wagner on 1/10/23.
//

import SwiftUI

struct RunFreeView: View {
    
    @ObservedObject var managerClass: ManagerClass = ManagerClass()
    @State var phase = 0
    @State var titles = ["Run-Free Murph", "Pullups","Pushups","Squats", "Murph Complete Congrats!"]
    @State var times = [0.0, 0.0, 0.0, 0.0, 0.0]
    @State var calisthenicsString = ""
    @State var mile2String = ""
    @State var finalString = ""
    @State var backgrounds = ["plain", "cal", "pushup", "squat", "plain"]
    @State var mile1String = ""
    
    var body: some View {
        ZStack{
            Image("plain").resizable().ignoresSafeArea()
            Image(backgrounds[phase]).resizable()
            
            VStack{
                
                Spacer()
                
                Text(titles[phase]).font(.largeTitle).fontWeight(.bold).multilineTextAlignment(.center).padding()
                
                
                Text(ManagerClass.timeToString(mil: managerClass.secondElapsed))
                    .font(.largeTitle)
                    .multilineTextAlignment(.leading)
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                
                
                
                
                
                
                
                switch managerClass.mode {
                case .stopped:
                    withAnimation{
                        HStack {
                            Button {
                                managerClass.start()
                                phase = phase + 1
                            } label: {
                                Image("BEGIN").resizable().frame(width: 150.0, height: 150.0).scaledToFill().cornerRadius(100)
                            }
                        }
                    }
                        
                case .running:
                    withAnimation{
                        HStack{
                            Spacer()
                            //pause button
                            Button {
                                managerClass.pause()
                            } label: {
                                Image("PAUSE").resizable().frame(width: 100.0, height: 100.0).scaledToFill().cornerRadius(100)
                                
                            }
                            Spacer()
                            //continue button
                            Button {
                                times[phase] = managerClass.secondElapsed
                                
                                if phase == 1{
                                    mile1String = "Pull-Up Split: " +
                                    ManagerClass.timeToString(mil: managerClass.secondElapsed)
                                }
                                else if phase == 2{
                                    calisthenicsString = "Push-Up Split: " + ManagerClass.timeToString(mil: times[phase] - times[0])
                                }
                                else if phase == 3{
                                    mile2String = "Squat Split: " + ManagerClass.timeToString(mil: times[phase] - times[1])
                                    managerClass.finish()
                                    finalString = "Total Time: " + ManagerClass.timeToString(mil: managerClass.secondElapsed)
                                }
                                else {
                                    managerClass.finish()
                                    finalString = "Total Time: " + ManagerClass.timeToString(mil: managerClass.secondElapsed)
                                }
                                
                                phase += 1
                                
                                
                            } label: {
                                Image("DONE").resizable().frame(width: 100.0, height: 100.0).scaledToFill().cornerRadius(100)
                                
                            }
                            Spacer()
                        }
                    }
                    
                    
                    
                    
                    
                    
                case .paused:
                    withAnimation{
                        HStack{
                            Button {
                                managerClass.start()
                            } label: {
                                Image("RESUME").resizable().frame(width: 100.0, height: 100.0).scaledToFill().cornerRadius(100)
                            }
                            Button {
                                managerClass.reset()
                                phase = 0
                                mile1String = ""
                                mile2String = ""
                                calisthenicsString = ""
                                finalString = ""
                            } label: {
                                Image("RESET").resizable().frame(width: 100.0, height: 100.0).scaledToFill().cornerRadius(100)
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
                            Image("START OVER")
                                .cornerRadius(10)
                            
                            
                            
                        }
                        
                        
                    }
                    
                }
                Text(mile1String)
                    .font(.title2)
                    .multilineTextAlignment(.center)
                    .frame(height: 45.0)
                Text(calisthenicsString).font(.title2).frame(height: 40.0)
                Text(mile2String).font(.title2).frame(height: 40.0)
                Text(finalString).font(.title).fontWeight(.bold).frame(height: 60.0)
                
                Spacer()
                Spacer()
                
                
            }
        }

    }
}

struct RunFreeView_Previews: PreviewProvider {
    static var previews: some View {
        RunFreeView()
    }
}
