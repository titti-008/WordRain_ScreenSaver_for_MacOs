import XCTest
// @testable import WordRain

final class JSONReaderTests: XCTestCase {
    
    func testReadJSON() {
        let testBundle = Bundle(for: type(of: self))
        let reader = JSONReader(resourceName: "sample")
        
        let json = reader.readJSON(bundle: testBundle)
        
        debugPrint("data: ", json)
    
        // 要素数3の配列であること
        XCTAssertEqual(json.count, 1)
        XCTAssertEqual(json, [[[1,2,3]]])
    }

}
