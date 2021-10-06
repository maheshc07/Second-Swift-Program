
import Foundation
import XCTest

class AssignedToMeScreen {
    let assignedfacebookconversation = XCUIApplication().staticTexts["NuHealth"]
    let assignedTwitterConversation = XCUIApplication().staticTexts["@anusuya_user"]
    let assignedToMeBackButton = XCUIApplication().navigationBars["Assigned to Me 2"].buttons["Back"]
    let assignedTwitterConversation2 = XCUIApplication().staticTexts["@anusuya_user2"]
    let conversationButton = XCUIApplication().tables.cells.matching(identifier: "Conversation").firstMatch
    let backButton = XCUIApplication().navigationBars.buttons.element(boundBy: 0)
    let internalNote = XCUIApplication().staticTexts["Internal Note added by You"]
    let conversationMessage = XCUIApplication().staticTexts["NuPlant"]
    
    func tappingConversation() {
        conversationButton.tap()
    }
    
    func tappingTwitterConversation() {
        assignedTwitterConversation.tap()
    }
    
    func gotoHomeScreen() {
        backButton.tap()
    }
    
    func tappingOtherTwitterConversation() {
        assignedTwitterConversation2.tap()
    }
    
    func swipeUpConversation() {
        conversationMessage.swipeUp()
    }
}
