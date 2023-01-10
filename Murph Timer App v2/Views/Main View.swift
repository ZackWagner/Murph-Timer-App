//
//  MotivateView.swift
//  Murph Timer App v2
//
//  Created by Zack Wagner on 1/9/23.
//

import SwiftUI



struct MainView: View {
    var body: some View {
        NavigationView{
            List{
                NavigationLink {
                    RunFreeView()
                } label: {
                    Text("Run-Free Murph")
                }
                NavigationLink {
                    ContentView()
                } label: {
                    Text("Segmented Murph")
                }
                NavigationLink {
                    FullMurphView()
                } label: {
                    Text("Classic Murph")
                }
                NavigationLink {
                    MotivationTabView()
                } label: {
                    Text("Preparation")
                }

            }.navigationTitle("Choose Your Murph")
            
        }
    }
    
    struct MainView_Previews: PreviewProvider {
        static var previews: some View {
            MainView()
        }
    }
}
