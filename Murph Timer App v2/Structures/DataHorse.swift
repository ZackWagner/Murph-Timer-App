//
//  DataHorse.swift
//  Motivation App
//
//  Created by Zack Wagner on 1/5/23.
//

import Foundation


class DataHorse {
    
    static func getLocalData() -> [Quote] {
        
        //Parse Local Json File
        
        let pathString = Bundle.main.path(forResource: "enterpreneur-quotes", ofType: "json")
        guard pathString != nil else{
            
            return [Quote]()
        }
        let url = URL(fileURLWithPath: pathString!)
        
        do{
            let data =  try Data(contentsOf: url)
            
            let decoder = JSONDecoder()
            
            do{
                let quoteData = try decoder.decode([Quote].self, from: data)
                
                for r in quoteData {
                    r.id = UUID()
                }
                return quoteData
                
            }
            catch{
                print(error)
            }
            
        }
        
        catch{
            print(error)
        }
        
        return [Quote]()
        
    }
    
}
