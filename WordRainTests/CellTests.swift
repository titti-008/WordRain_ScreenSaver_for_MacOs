//
//  CellTests.swift
//  WordRainTests
//
//  Created by ぱんそう on 2023/03/20.
//

import XCTest

final class CellTests: XCTestCase {
    
    func testIsMarkCell(){
        struct Test {
            let rgb: [Int]
            let result: Bool
        }
        let config = Config(height: 1, width: 1)
        let pos = CGPoint(x: 0, y: 0)
        let tests: [Test] = [
            Test(rgb: [0,0,0], result: false),
            Test(rgb: [1,0,0], result: true),
            Test(rgb: [0,2,0], result: true),
            Test(rgb: [0,0,3], result: true),
            Test(rgb: [255,255,255], result: true),
        ]
        for tt in tests {
            let cell = Cell(config: config, position: pos, initColors: tt.rgb)
            XCTAssertEqual(cell.isMarkCell(), tt.result)
            
        }
        
        
    }
    
    func testDilute () {
        struct Test {
            let rainOpa: CGFloat
            let markOpa: CGFloat
            let isMark: Bool
            let delta: CGFloat
            let wantRainOpa: CGFloat
            let wantMarkOpa: CGFloat
            let wantTotalOpa: CGFloat
        }
        let config = Config(height: 1, width: 1)
        let pos = CGPoint(x: 0, y: 0)
        let tests: [Test] = [
            Test(rainOpa: 0.1, markOpa: 0.1, isMark: true, delta: 0.6, wantRainOpa: 0.0, wantMarkOpa: 0.0, wantTotalOpa: 0.0),
            Test(rainOpa: 1.0, markOpa: 0.1, isMark: true, delta: 0.6, wantRainOpa: 0.4, wantMarkOpa: 0.0, wantTotalOpa: 0.4),
            Test(rainOpa: 0.0, markOpa: 1.0, isMark: true, delta: 1.0, wantRainOpa: 0.0, wantMarkOpa: 0.7, wantTotalOpa: 0.7),
            Test(rainOpa: 1.0, markOpa: 1.0, isMark: true, delta: 0.0, wantRainOpa: 1.0, wantMarkOpa: 1.0, wantTotalOpa: 1.0),
            Test(rainOpa: 2.0, markOpa: 2.0, isMark: true, delta: 0.0, wantRainOpa: 1.0, wantMarkOpa: 1.0, wantTotalOpa: 1.0),
            Test(rainOpa: 1.3, markOpa: 1.0, isMark: true, delta: 1.0, wantRainOpa: 0.30000000000000004, wantMarkOpa: 0.7, wantTotalOpa: 1.0),
            Test(rainOpa: 1.3, markOpa: 1.0, isMark: false, delta: 1.0, wantRainOpa: 0.30000000000000004, wantMarkOpa: 0.7, wantTotalOpa: 0.30000000000000004),
        ]
        
        for tt in tests {
            let cell = Cell(config: config, position: pos, initColors: [1,1,1])
            cell.isMark = tt.isMark
            cell.rainOpacity = tt.rainOpa
            cell.markOpacity = tt.markOpa
            cell.dilute(deltaOpacity: tt.delta)
            XCTAssertEqual(cell.rainOpacity, tt.wantRainOpa)
            XCTAssertEqual(cell.markOpacity, tt.wantMarkOpa)
            XCTAssertEqual(cell.totalOpacity, tt.wantTotalOpa)
        }
        
    }
    
}
