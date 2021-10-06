
import Foundation
import XCTest
class CustomWait {
    
    static func waitForElementToAppear(_ element: XCUIElement, timeoutInSec : Int) -> Bool {
        let expectation = XCTKVOExpectation(keyPath: "exists", object: element,
                                            expectedValue: true)
        let result = XCTWaiter().wait(for: [expectation], timeout: (TimeInterval(timeoutInSec)) )
        return result == .completed
    }
    
}
