//
//  Config.swift
//  WordRain
//
//  Created by ぱんそう on 2023/03/20.
//

import Foundation
import ScreenSaver

class Config {
    let imageJSONName = "imageRGB"
//    let chars: Chars = Chars.init(list: ["A","1","A"])
    let chars: Chars = Chars.init(list: ["T","e","c","h","o","u","s","e"])
//    let cellHeight: CGFloat = 22
//    let cellWidth: CGFloat = 14
    let cellAspectRecio = 1.7
    let fontAspectRecio = 0.85
    let rainOfNumber = 100
    let backgroudColor: NSColor = .black
    let cellNumberOfWidth: Int = 71
        let cellNumberOfHeight: Int = 40
    
    let defaultColorRed: CGFloat = 190 / 255
    let defaultColorGreen: CGFloat = 255 / 255
    let defaultColorBlue: CGFloat = 180 / 255
    
    var imageColors: ColorsArray = [[[]]]
    
    
    let cellHeight: CGFloat
    let cellWidth: CGFloat
    let width: CGFloat
    let height: CGFloat
    let fontHeight: CGFloat
 
    
    init (height: CGFloat, width: CGFloat) {
        self.width = width
        self.height = height
        self.cellWidth = CGFloat(height / CGFloat(cellNumberOfWidth))

        self.cellHeight = cellWidth * cellAspectRecio
        self.fontHeight = cellHeight * fontAspectRecio
        
        let jsonReader = JSONReader(resourceName: imageJSONName)
        imageColors = jsonReader.readJSON(bundle: Bundle(for: type(of: self)))
    }
}
