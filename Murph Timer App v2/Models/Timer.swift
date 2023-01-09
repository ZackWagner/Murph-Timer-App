//
//  Timer.swift
//  Murph Timer App v2
//
//  Created by Zack Wagner on 1/6/23.
//

import Foundation

enum mode{
    case running
    case stopped
    case paused
    case finished
    
    
}

class ManagerClass: ObservableObject {
    @Published var secondElapsed = 0.0
    @Published var mode: mode = .stopped
    var timer = Timer()
    
    func start() {
        mode = .running
        timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true){ timer in
            self.secondElapsed += 0.01
        }
        
    }
    func stop() {
        timer.invalidate()
        mode = .stopped
    }
    func pause() {
        timer.invalidate()
        mode = .paused
    }
    func reset() {
        mode = .stopped
        secondElapsed = 0.0
        
    }
    func finish(){
        timer.invalidate()
        mode = .finished
        
    }
    static func timeToString(mil:Double) -> (String){
        var milisec = mil.truncatingRemainder(dividingBy: 1)
        milisec = milisec * 100
        let intMil = Int(mil)
        let hours = intMil / 3600
        let minutes = (intMil % 3600) / 60
        let seconds = (intMil % 3600) % 60
        
        if minutes != 0 {
            if seconds < 10 {
                if hours != 0{
                    if milisec < 10 {
                        return String(hours) + ":0" + String(minutes) + ":" + String(seconds) +   ".0" + String(format: "%.0f", milisec)
                    }
                    
                    else{
                        return String(hours) + ":0" + String(minutes) + ":" + String(seconds) +   "." + String(format: "%.0f", milisec)
                    }
                }
                else {
                    if milisec < 10 {
                        return String(minutes) + ":0" + String(seconds) +   ".0" + String(format: "%.0f", milisec)
                    }
                    
                    else{
                        return String(minutes) + ":0" + String(seconds) +   "." + String(format: "%.0f", milisec)
                    }
                }
            }
            else{
                if hours != 0{
                    if milisec < 10 {
                        return String(hours) + ":" + String(minutes) + ":" + String(seconds) +   ".0" + String(format: "%.0f", milisec)
                    }
                    
                    else{
                        return String(hours) + ":" + String(minutes) + ":" + String(seconds) +   "." + String(format: "%.0f", milisec)
                    }
                }
                else {
                    if milisec < 10 {
                        return String(minutes) + ":" + String(seconds) +   ".0" + String(format: "%.0f", milisec)
                    }
                    
                    else{
                        return String(minutes) + ":" + String(seconds) +   "." + String(format: "%.0f", milisec)
                    }
                }
            }
        }
        else{
            if seconds < 10 {
                if hours != 0{
                    if milisec < 10 {
                        return String(seconds) +   ".0" + String(format: "%.0f", milisec)
                    }
                    
                    else{
                        return String(seconds) +   "." + String(format: "%.0f", milisec)
                    }
                }
                else {
                    if milisec < 10 {
                        return String(seconds) +   ".0" + String(format: "%.0f", milisec)
                    }
                    
                    else{
                        return String(seconds) +   "." + String(format: "%.0f", milisec)
                    }
                }
            }
            else{
                if hours != 0{
                    if milisec < 10 {
                        return String(seconds) +   ".0" + String(format: "%.0f", milisec)
                    }
                    
                    else{
                        return String(seconds) +   "." + String(format: "%.0f", milisec)
                    }
                }
                else {
                    if milisec < 10 {
                        return String(seconds) +   ".0" + String(format: "%.0f", milisec)
                    }
                    
                    else{
                        return String(seconds) +   "." + String(format: "%.0f", milisec)
                    }
                }
            }
        }
    }
}
