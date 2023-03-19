//
//  WindowRainsLayer.swift
//  WordRain
//
//  Created by ぱんそう on 2023/03/20.
//

import Foundation
import ScreenSaver

class WindowRainsLayar: CellsLayer {
    let shiftPeriod = 2
    var shiftQuoter = 0
    
    let deltaOpacity = 0.008
    
    override init (config: Config) {
        super.init(config: config)
    }
    
    override func animateOneFrame() {
        plotHeadCell()
        attackWindowByRain()
        // shiftUnderCell()
    }
    
    func plotHeadCell () {
        for _ in 1...1 {
            let randomYpos = Int.random(in: 0..<config.cellNumberOfHeight)
            let randomXpos = Int.random(in: 0..<config.cellNumberOfWidth)
            let cell = cells[randomYpos][randomXpos]
            cell.rainOpacity = CGFloat.random(in: 1...5) / 10
            cell.markOpacity = CGFloat.random(in: 1...5) / 10
        }
    }
    
    func attackWindowByRain (){
        if shiftQuoter >= shiftPeriod {
            shiftQuoter = 0
        }
        
        let xRepertNumber = (config.cellNumberOfWidth / shiftPeriod) + (config.cellNumberOfWidth % shiftPeriod)
        
        for ypos in 0..<config.cellNumberOfHeight {
            for x in 0..<xRepertNumber {
                
                let xpos = x * shiftPeriod + shiftQuoter
                if xpos >= config.cellNumberOfWidth {
                    continue
                }
                
                let cell = cells[ypos][xpos]
                
                if cell.rainOpacity == 0 {
                    continue
                }
                
                cell.dilute(deltaOpacity: deltaOpacity)
                
                if ypos + 1 >= config.cellNumberOfHeight {
                    continue
                }
                
                let inheritancedCell = cells[ypos+1][xpos]
                
                if inheritancedCell.rainOpacity > cell.rainOpacity {
                    continue
                }
                inheritancedCell.rainOpacity = cell.rainOpacity - deltaOpacity * 0.6
                inheritancedCell.markOpacity = cell.markOpacity - deltaOpacity * 0.6
                
                inheritancedCell.changeChar(parentCell: cell)
            }
        }
        
        shiftQuoter += 1
    }
    
}
