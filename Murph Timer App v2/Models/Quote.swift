//
//  Quote.swift
//  Motivation App
//
//  Created by Zack Wagner on 1/5/23.
//

import Foundation


class Quote: Identifiable, Decodable {
    
    var id:UUID?
    var text:String
    var from:String
    
    
}
