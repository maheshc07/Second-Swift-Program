
import Foundation
import XCTest
class CloseScreen {
    let overflowButton =  XCUIApplication().buttons["overflow white icon"]
    let cancelButton = XCUIApplication().navigationBars["Close As"].buttons["Cancel"]
    let closeAsOptions = XCUIApplication().tables.staticTexts["Resolved"]
    let closeButton = XCUIApplication().buttons["Close"]
    
    func selectiingCloseAsOptions() {
        closeAsOptions.tap()
    }
    
    func cancleCloseOption() {
        cancelButton.tap()
    }
}
