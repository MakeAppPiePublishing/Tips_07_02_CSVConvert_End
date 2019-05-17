//
//  An exercise file for iOS Development Tips Weekly
//  by Steven Lipton (C)2018, All rights reserved
//  For videos go to http://bit.ly/TipsLinkedInLearning
//  For code go to http://bit.ly/AppPieGithub
//
import UIKit

// We'll break apart a csv stream of dounut menu items
// data is An item number X0000XX(String), Description(String) and price(String).
// item number  has three parts.
//      X               0000            XX
//     /                 |               \
//  type                number          2 Toppings
//  H - HOLE            (unique)         X - none
//  F - FILLED                           C - Chocolate
//                                       G - glazed
//                                       S - Sprinkles
//

// Here's our data
var dataString = """
H0001XG,Plain, 0.95
F0002XX,Lemon, 1.49
F0003CX,Boston Cream, 1.49
F0004CS,Choco Nutella, 1.95
H0005SX,Happy,$0.95
H0006SX,Strawberry Filled, $0.95
"""

class MenuEntry{
    var itemNumber:String = ""
    var description:String = ""
    var price:String = "0.00"
    init(csvRecord:String, separator:Character){
        let record = csvRecord.split(separator: separator)
        itemNumber = String(record[0])
        description = String(record[1])
        price = String(record[2])
    }
    
}

var menu = [MenuEntry]()
dataString.enumerateLines { (line, stop) in
    menu.append(MenuEntry(csvRecord: line, separator: ","))
}


for menuEntry in menu{
    var displayString = menuEntry.description
    if menuEntry.itemNumber.hasPrefix("F"){
        displayString += " filled"
    }
    displayString += " doughnut"
    if menuEntry.itemNumber.suffix(2).firstIndex(of: "S") != nil {
        displayString += " with sprinkles"
    }
    displayString += "\t" + menuEntry.price
    print(displayString)
}



