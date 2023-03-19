//
//  Chars.swift
//  WordRain
//
//  Created by ぱんそう on 2023/03/20.
//

import Foundation

class Chars {
    private let count: Int
    private var nsCharList: [NSString] = []
    
    init (list: [Character]){
        self.count = list.count
        
        for i in 0..<count {
            let nsChar = NSString(string: String(list[i]))
            self.nsCharList.append(nsChar)
        }
    }
    
    func randomChar () -> NSString{
        return nsCharList[NSInteger.random(in: 0..<count)]
    }
}
