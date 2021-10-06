//
//  SnoozeScreen.swift
//  CareUITests
//
//  Created by Mahesh Chandrashekar on 27/04/21.
//  Copyright © 2021 Lithium Social Web. All rights reserved.
//

import Foundation
import XCTest

class SnoozeScreen {
    let assignedToMeButton = XCUIApplication().staticTexts["Assigned to Me"]
    let conversationButton = XCUIApplication().tables.cells.matching(identifier: "Conversation").firstMatch
    let conversationSettingsButton = XCUIApplication().navigationBars.buttons["ellipsisFill"]
    let conversationSettingsDoneButton = XCUIApplication().buttons["overflow_done_button"]
    let snoozeSettingsButton = XCUIApplication().tables/*@START_MENU_TOKEN@*/.cells.staticTexts["Snooze"]/*[[".cells.staticTexts[\"Snooze\"]",".staticTexts[\"Snooze\"]"],[[[-1,1],[-1,0]]],[1]]@END_MENU_TOKEN@*/
    let snoozePage = XCUIApplication().navigationBars["Snooze"].staticTexts["Snooze"]
    let snoozePageDoneButton = XCUIApplication().navigationBars["Snooze"].buttons["Done"]
    let snoozePageCancelButton = XCUIApplication().navigationBars["Snooze"].buttons["Cancel"]
    let unsnoozeButton = XCUIApplication()/*@START_MENU_TOKEN@*/.buttons["Unsnooze"].staticTexts["Unsnooze"]/*[[".buttons[\"Unsnooze\"].staticTexts[\"Unsnooze\"]",".staticTexts[\"Unsnooze\"]"],[[[-1,1],[-1,0]]],[1]]@END_MENU_TOKEN@*/
    let backButton = XCUIApplication().navigationBars.buttons.element(boundBy: 0)
    let snoozedStatus = XCUIApplication().staticTexts["Snoozed"]
    let snoozedTime = XCUIApplication().staticTexts["30 min"]
    
    func gotoAssignedToMe() {
        assignedToMeButton.tap()
    }
    
    func gotoConversation() {
        assignedToMeButton.tap()
        CustomWait.waitForElementToAppear(conversationButton, timeoutInSec: 10)
        conversationButton.tap()
        conversationButton.tap()
    }
    
    func gotoSnoozeSettings()  {
        CustomWait.waitForElementToAppear(conversationSettingsButton, timeoutInSec: 5)
        conversationSettingsButton.tap()
    }
    
}
