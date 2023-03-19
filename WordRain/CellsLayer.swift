//
//  CellsLayer.swift
//  WordRain
//
//  Created by ぱんそう on 2023/03/20.
//

import Foundation
import ScreenSaver

class CellsLayer {
    let config: Config
    var cells: [[Cell]] = []
    
    init (config: Config) {
        self.config = config
        self.cells = createCells()
        
    }
    
    func createCells () -> [[Cell]] {
        var result:[[Cell]] = []
        for y in 0..<config.cellNumberOfHeight {
            result.append([])
            for x in 0..<config.cellNumberOfWidth {
                let xpos = Int(CGFloat(x) / CGFloat(config.cellNumberOfWidth) * config.width)
                let ypos = Int(CGFloat(y) / CGFloat(config.cellNumberOfHeight) * config.height)
                let position = CGPoint(x: xpos, y: ypos)
                let cell = Cell(
                    config: config,
                    position: position,
                    initColors: config.imageColors[config.cellNumberOfHeight-y-1][x]
                )
                result[y].append(cell)
            }
        }
        
        return result
    }
    
    
    func draw () {
        for y in 0..<cells.count {
            for x in 0..<cells[y].count {
                let cell = cells[y][x]
                if cell.totalOpacity > 0.05 {
                    cell.draw()
                }
            }
        }

    }
    
    // サブクラスでオーバーライドすること
    func animateOneFrame() {
    }
    
}
