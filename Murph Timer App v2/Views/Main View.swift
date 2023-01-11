//
//  MotivateView.swift
//  Murph Timer App v2
//
//  Created by Zack Wagner on 1/9/23.
//

import SwiftUI



struct MainView: View {
    var body: some View {
        ZStack{
            
            
            
            NavigationView{
                List{
                    NavigationLink {
                        RunFreeView()
                    } label: {
                        Text("Run-Free Murph")
                            .font(.title)
                            .fontWeight(.bold)
                    }.listRowBackground(Image("darkplain"))
                    NavigationLink {
                        ContentView()
                    } label: {
                        Text("Segmented Murph")
                            .font(.title)
                            .fontWeight(.bold)
                    }.listRowBackground(Image("darkplain"))
                    NavigationLink {
                        FullMurphView()
                    } label: {
                        Text("Classic Murph")
                            .font(.title)
                            .fontWeight(.bold)
                    }.listRowBackground(Image("darkplain"))
                    NavigationLink {
                        MotivationTabView()
                    } label: {
                        Text("Preparation")
                            .font(.title)
                            .fontWeight(.bold)
                    }.listRowBackground(Image("darkplain"))
                    
                }
                .padding(.top, 5.0)
                .navigationTitle("Choose Your Murph").background{
                    Image("plain")
                }
                    .scrollContentBackground(.hidden)
                    .scrollDisabled(true)
                
            }
        }
    }
    
    struct MainView_Previews: PreviewProvider {
        static var previews: some View {
            MainView()
        }
    }
}
