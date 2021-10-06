
import Foundation
import XCTest

class PriorityScreen {
    let cancelButton = XCUIApplication().navigationBars["Priority"].buttons["Cancel"]
    let p3PriorityButton = XCUIApplication().staticTexts["P3"]
    let p5PriorityButton = XCUIApplication().staticTexts["P5"]
    let saveButton = XCUIApplication().buttons["Save"]
    
    func settiingP3Priority() {
        CustomWait.waitForElementToAppear(p3PriorityButton, timeoutInSec: 3)
        p3PriorityButton.tap()
    }
    
    func savingPriority(){
        saveButton.tap()
    }
    
    func settingP5Priority() {
        CustomWait.waitForElementToAppear(p5PriorityButton, timeoutInSec: 3)
        p5PriorityButton.tap()
    }
    
    func canclePriorityScreen() {
        cancelButton.tap()
    }
}
