//
//  QuoteModel.swift
//  Motivation App
//
//  Created by Zack Wagner on 1/5/23.
//

import Foundation

class QuoteModel: ObservableObject {
    
    @Published var quotes = [Quote]()
    
    init(){
        
        self.quotes = DataHorse.getLocalData()
        
    }
    
}

