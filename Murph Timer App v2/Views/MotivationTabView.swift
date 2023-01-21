//
//  MotivationTabView.swift
//  Murph Timer App v2
//
//  Created by Zack Wagner on 1/10/23.
//

import SwiftUI


struct MotivationTabView: View {
    
    @ObservedObject var quoteModel = QuoteModel()
    @State var num = Int.random(in: 0...100)
    
    var body: some View {
        ZStack{
            Image("plain")
            
            VStack{
                Spacer()
                    .frame(height: 290.0)
                Text("Lets Get Ready!")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                
                VStack(alignment: .leading){
                    Text("1) Are you dressed for the weather?")
                    
                    Text("2) Do you have water ready?")
                    Text("3) Do you have space for calisthenics?")
                    Text("4) Is your pull-up bar set up?")
                    Text("5) Are your shoes tied?")
                    Text("6) Are you excited?")
                }
                .padding(/*@START_MENU_TOKEN@*/.vertical, 6.0/*@END_MENU_TOKEN@*/)
                
                HStack{
                    Image("running").resizable()
                        .scaledToFit()
                    Image("cal").resizable().scaledToFit()
                    Image("squat").resizable()
                        .scaledToFit()
                        
                }
                .padding(.top, 6.0)
                .frame(width: 400.0, height: 200.0)
                
                Text("\"" + quoteModel.quotes[num].text+"\"").font(.headline).multilineTextAlignment(.center).frame(width:300, height: 150.0)
                Button {
                    num = Int.random(in: 0...quoteModel.quotes.count-1)
                } label: {
                    Text("new quote")
                }
                Spacer()

                
            }
        }
    }
}

struct MotivationTabView_Previews: PreviewProvider {
    static var previews: some View {
        MotivationTabView()
    }
}
