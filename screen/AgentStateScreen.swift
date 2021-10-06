
import Foundation
import XCTest

class AgentStateScreen {
    let hamburgerMenuButton = XCUIApplication().navigationBars["Care"].children(matching: .button).element(boundBy: 0)
    let availableStatus = XCUIApplication().tables.staticTexts["Available"]
    let coffeeStatus = XCUIApplication().tables.staticTexts["Coffee"]
    let dinnerStatus = XCUIApplication().tables.staticTexts["Dinner"]
    let returnToAvailable = XCUIApplication().buttons["Return to Available"]
    let homePage = XCUIApplication().staticTexts["Home"]
    let coffeePageStatus = XCUIApplication().staticTexts["Coffee"]
    let responseButton = XCUIApplication().tables.staticTexts["Response"]
    let cancelButton = XCUIApplication().navigationBars["Change Agent State"].buttons["Cancel"]
    let assignedToMeButton = XCUIApplication().scrollViews.otherElements.tables/*@START_MENU_TOKEN@*/.staticTexts["Assigned to Me"]/*[[".cells.staticTexts[\"Assigned to Me\"]",".staticTexts[\"Assigned to Me\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
    let needsAttentionButton = XCUIApplication().scrollViews.otherElements.tables.staticTexts["Needs Attention"]
    let pendingButton = XCUIApplication().scrollViews.otherElements.tables.staticTexts["Pending"]
    let needsApprovalButton = XCUIApplication().scrollViews.otherElements.tables.staticTexts["Needs Approval"]
    let watchingButton = XCUIApplication().scrollViews.otherElements.tables.staticTexts["Watching"]
    let backButton = XCUIApplication().navigationBars.buttons.element(boundBy: 0)
    let dashboardButton = XCUIApplication().tables.staticTexts["Dashboards"]
    let smartViewTabButton = XCUIApplication()/*@START_MENU_TOKEN@*/.buttons["Smart Views"]/*[[".segmentedControls.buttons[\"Smart Views\"]",".buttons[\"Smart Views\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
    let workQueueTabButton = XCUIApplication().buttons["Work Queues"]
    let smartViewButton = XCUIApplication().scrollViews.otherElements.tables/*@START_MENU_TOKEN@*/.staticTexts["Mahesh Smart View"]/*[[".cells.staticTexts[\"Mahesh Smart View\"]",".staticTexts[\"Mahesh Smart View\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
    let defaultWorkQueueButton = XCUIApplication().scrollViews.otherElements.tables.staticTexts["Default Work Queue"]
    let myDashboardButton = XCUIApplication().staticTexts["My Dashboard"]
    let homeTabButton = XCUIApplication().buttons["Home"]
    let yellowStateButton = XCUIApplication().otherElements["YellowStateView"]
    let greenStateButton = XCUIApplication().tables["Agent States Options Table View"].cells.containing(.staticText, identifier:"Available").element
    let availableStateButton = XCUIApplication().tables["Agent States Options Table View"].cells.containing(.staticText, identifier:"Available").children(matching: .other).element(boundBy: 0).children(matching: .other).element
    let notificationSettingsButton = XCUIApplication().staticTexts["Notification Settings"]
    let conversationButton = XCUIApplication().tables.cells.matching(identifier: "Conversation").firstMatch
    
    
    func gotoAvailable() {
        if availableStatus.exists {
            availableStatus.tap()
            availableStateButton.tap()
        }
        else if coffeeStatus.exists {
            coffeeStatus.tap()
            availableStatus.tap()
        }
        else {
            dinnerStatus.tap()
            availableStatus.tap()
        }
    }
    
    func gotoCoffee() {
        if availableStatus.exists {
            availableStatus.tap()
            coffeeStatus.tap()
        }
        else if coffeeStatus.exists {
            coffeeStatus.tap()
        }
        else {
            dinnerStatus.tap()
            coffeeStatus.tap()
        }
    }
    
    func gotoDinner() {
        if dinnerStatus.exists {
            dinnerStatus.tap()
        }
        else if availableStatus.exists {
            availableStatus.tap()
            dinnerStatus.tap()
        }
        else{
            coffeeStatus.tap()
            dinnerStatus.tap()
        }
    }
    
    func gotoConversationUnderAssignedToMe() {
        assignedToMeButton.tap()
        CustomWait.waitForElementToAppear(conversationButton, timeoutInSec: 10)
        conversationButton.tap()
        conversationButton.tap()
    }
    
    func gotoConversationUnderPending() {
        pendingButton.tap()
        CustomWait.waitForElementToAppear(conversationButton, timeoutInSec: 10)
        conversationButton.tap()
        conversationButton.tap()
    }
    
    func gotoConversationUnderNeedsApproval() {
        needsApprovalButton.tap()
        CustomWait.waitForElementToAppear(conversationButton, timeoutInSec: 10)
        conversationButton.tap()
        CustomWait.waitForElementToAppear(conversationButton, timeoutInSec: 10)
        conversationButton.tap()
    }
    
    func gotoConversationUnderWatching() {
        watchingButton.tap()
        CustomWait.waitForElementToAppear(conversationButton, timeoutInSec: 10)
        conversationButton.tap()
        CustomWait.waitForElementToAppear(conversationButton, timeoutInSec: 10)
        conversationButton.tap()
    }
}
