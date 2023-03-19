//
//  Cell.swift
//  WordRain
//
//  Created by ぱんそう on 2023/03/20.
//

import Foundation
import ScreenSaver

class Cell: CharRect {
    var isMark: Bool = false
    private let opacityRetio: CGFloat = 0.1
    
    override init(config: Config, position: CGPoint, initColors: [Int], totalOpacity: CGFloat = 0){
        super.init(config: config, position: position, initColors: initColors, totalOpacity: totalOpacity)
        
        
        self.isMark = isMarkCell()
        setMarkCell()
    }
    
    func dilute (deltaOpacity: CGFloat) {
        if rainOpacity == 0 && markOpacity == 0 {
            return
        }

        let afterRainOpacity = rainOpacity - deltaOpacity
        if afterRainOpacity > 0 {
            self.rainOpacity = afterRainOpacity
        } else {
            rainOpacity = 0
        }
        
        let afterMarkOpacity = markOpacity - deltaOpacity * opacityRetio
        if afterMarkOpacity > 0 {
            markOpacity = afterMarkOpacity
        } else {
            markOpacity = 0
        }
        
        if isMark {
            totalOpacity = rainOpacity + markOpacity
        } else {
            totalOpacity = rainOpacity
        }
        
        if rainOpacity > 1.0 {
            rainOpacity = 1.0
        }
        
        if markOpacity > 1.0 {
            markOpacity = 1.0
        }
        
        if totalOpacity > 1.0 {
            totalOpacity = 1.0
        }
    }
    
    func draw(){
        let cellRect = NSRect(
            x: position.x,
            y: position.y,
            width: config.cellWidth,
            height: config.cellHeight
        )
        
        var alpha = CGFloat.random(in: 5...10) / 4 * totalOpacity
        if alpha < 0 {
            alpha = 0
        } else if alpha > 1.0 {
            alpha = 1.0
        }
        let defaultColor: NSColor = NSColor.init(
            red: charColorRed,
            green: charColorGreen,
            blue: charColorBlue,
//            alpha: 1.0
            alpha: alpha
        )
        
        self.char.draw(with: cellRect, attributes: [
            .foregroundColor: defaultColor,
            .font: NSFont.systemFont(ofSize: config.fontHeight, weight: NSFont.Weight.ultraLight),
        ])
    }
    
    func setMarkCell () {
        if isMark {
            charColorRed = CGFloat(initColors[0]) / 255
            charColorGreen =  CGFloat(initColors[1]) / 255
            charColorBlue =  CGFloat(initColors[2]) / 255
        }
    }
    
    func isMarkCell() -> Bool{
        for color in initColors {
            if color != 0 {
                return true
            }
        }
        return false
    }
    
    func changeChar(parentCell: Cell) {
        if totalOpacity < 0.4 {
            char = parentCell.char
            parentCell.char = config.chars.randomChar()
        }
    }
}
