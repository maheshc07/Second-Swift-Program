
import Foundation
import XCTest

extension XCUIElement {
    func clearText() {
        guard let stringValue = self.value as? String else {
            return
        }
        var deleteString = String()
        for _ in stringValue {
            deleteString += convertFromXCUIKeyboardKey(XCUIKeyboardKey.delete)
        }
        self.typeText(deleteString)
    }
    
    func forceTapElement() {
        if self.isHittable {
            self.tap()
        } else {
            let coordinate: XCUICoordinate = self.coordinate(withNormalizedOffset: CGVector(dx:0.0, dy:0.0))
            coordinate.tap()
        }
    }
}

func swipeUpUntilElementFound(app: XCUIApplication, element : XCUIElement, maxNumberOfSwipes : UInt) -> Bool{
    if element.exists{
        return true
    }
    else {
        for _ in 1...maxNumberOfSwipes{
            app.swipeUp()
            if element.exists{
                return true
            }
        }
        return false
    }
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertFromXCUIKeyboardKey(_ input: XCUIKeyboardKey) -> String {
	return input.rawValue
}
