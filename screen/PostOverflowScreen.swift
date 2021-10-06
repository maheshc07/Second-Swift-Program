import Foundation
import XCTest

class PostOverflowScreen {
    let overflowButton =  XCUIApplication().navigationBars.buttons["ellipsisFill"]
    let closeAsButton = XCUIApplication().tables.staticTexts["Close As"]
    let doneButton = XCUIApplication().buttons["Done"]
    let watchButton = XCUIApplication().tables.switches["Watch"]
    let priorityButton = XCUIApplication().tables.staticTexts["Priority"]
    let showDiscussionSwitch = XCUIApplication().tables.switches["Show Discussion"]
    
    func tappingOverflowButton() {
        CustomWait.waitForElementToAppear(overflowButton, timeoutInSec: 5)
        overflowButton.tap()
    }
    
    func tappingCloseAsButton() {
        CustomWait.waitForElementToAppear(closeAsButton, timeoutInSec: 5)
        closeAsButton.tap()
    }
    
    func savingChanges() {
        CustomWait.waitForElementToAppear(doneButton, timeoutInSec: 5)
        doneButton.forceTapElement()
    }
    
    func tappingWatchButton() {
        CustomWait.waitForElementToAppear(watchButton, timeoutInSec: 5)
        watchButton.tap()
    }
    
    func unWatchthePost() {
        CustomWait.waitForElementToAppear(watchButton, timeoutInSec: 5)
        watchButton.tap()
    }
    
    func tappingPriorityButton() {
        CustomWait.waitForElementToAppear(priorityButton, timeoutInSec: 5)
        priorityButton.tap()
    }
    
    func tappingShowDiscussionButton() {
        CustomWait.waitForElementToAppear(showDiscussionSwitch, timeoutInSec: 5)
        showDiscussionSwitch.tap()
    }
}
