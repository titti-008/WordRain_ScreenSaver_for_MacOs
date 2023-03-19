//
//  CharRect.swift
//  WordRain
//
//  Created by ぱんそう on 2023/03/20.
//

import Foundation
import ScreenSaver

class CharRect {
    let config: Config
    var position: CGPoint = .zero
    var char: NSString
    var totalOpacity: CGFloat = 0
    var markOpacity: CGFloat = 0
    var rainOpacity: CGFloat = 0
    let initColors: [Int]
    
    var charColorRed: CGFloat = .zero
    var charColorGreen: CGFloat = .zero
    var charColorBlue: CGFloat = .zero
    
    init(config: Config, position: CGPoint, initColors: [Int], totalOpacity: CGFloat){
        self.config = config
        self.position = position
        self.char = config.chars.randomChar()
        self.charColorRed = config.defaultColorRed
        self.charColorGreen = config.defaultColorGreen
        self.charColorBlue = config.defaultColorBlue
        self.initColors = initColors
        self.totalOpacity = totalOpacity
        self.markOpacity = totalOpacity
        self.rainOpacity = totalOpacity
    }
}
