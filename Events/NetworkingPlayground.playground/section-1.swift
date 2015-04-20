// Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"

let ​individualScores​ = [75, 43, 103, 87, 12]
var teamScore = 0

for score in ​individualScores​ {
    if score > 50 {
        teamScore += 3
    } else {
        teamScore += 1
    }
}
 teamScore


var optionalString: String? = "Hello"
optionalString = nil

var optionalName: String? = nil
var greeting = "Hello"

if let name = optionalName {
    greeting = "Hello, \(name)"
}





let vegetable = "red pepper"
switch vegetable {
    case "celery":
        let vegetableComment = "Add some raisins and make ants on a log."
    case "cucumber", "watercress"
        let vegetableComment = "That would make a good tea sandwich"    
    
}