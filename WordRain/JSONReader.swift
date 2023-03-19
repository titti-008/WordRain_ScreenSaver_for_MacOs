//
//  JSONReader.swift
//  WordRain
//
//  Created by ぱんそう on 2023/03/19.
//

import Foundation

typealias ColorsArray = [[[Int]]]

class JSONReader {
    private let path: String
    private let ext = "json"

    init(resourceName: String) {
        print("Init JSONReader")
        self.path = resourceName
    }

    func readJSON (bundle: Bundle) -> ColorsArray {
        let jsonData:ColorsArray
        if let url = bundle.url(
            forResource: self.path,
            withExtension: self.ext
        ) {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                jsonData = try decoder.decode(ColorsArray.self, from: data)

                print("data: ", data)
                return jsonData
            } catch {
                print("Error: JSONファイルのdecodeに失敗しました", error)
                return [[[2, 2, 2]]]
            }
        } else {
            print("Error: ファイルが見つかりません。")
            return [[[3, 3, 3]]]
        }
    }
}
