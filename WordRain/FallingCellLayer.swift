//
//  FallingCellLayer.swift
//  WordRain
//
//  Created by ぱんそう on 2023/03/20.
//

import Foundation
import ScreenSaver

class FallingCellLayer: CellsLayer {
    let shiftPeriod = 2
    var shiftQuoter = 0
    
    let deltaOpacity = 0.008
    
    override init (config: Config) {
        super.init(config: config)
    }
    
    override func animateOneFrame() {
        plotHeadCell()
        shiftUnderCell()
    }
    
    func plotHeadCell () {
        for _ in 1...1 {
            let randomYpos = Int.random(in: 0..<config.cellNumberOfHeight)
            let randomXpos = Int.random(in: 0..<config.cellNumberOfWidth)
            let cell = cells[randomYpos][randomXpos]
            cell.rainOpacity = CGFloat.random(in: 1...10) / 10
            cell.markOpacity = CGFloat.random(in: 1...5) / 10
        }
    }
    
    func shiftUnderCell (){
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

                if cells[ypos][xpos].rainOpacity == 0 {
                    continue
                }

                cells[ypos][xpos].dilute(deltaOpacity: deltaOpacity)

                if ypos <= 0 {
                    continue
                }

                let inheritancedCell = cells[ypos-1][xpos]
                inheritancedCell.rainOpacity = cells[ypos][xpos].rainOpacity + deltaOpacity * 0.5
                inheritancedCell.markOpacity = cells[ypos][xpos].markOpacity + deltaOpacity * 0.5
                
                inheritancedCell.char = cells[ypos][xpos].char
                cells[ypos][xpos].char = config.chars.randomChar()
            }
        }

        shiftQuoter += 1
    }
}
