//
//  SnoozeTest.swift
//  CareUITests
//
//  Created by Mahesh Chandrashekar on 27/04/21.
//  Copyright © 2021 Lithium Social Web. All rights reserved.
//

import Foundation
import XCTest

class SnoozeTest: XCTestCase {
    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        self.app = XCUIApplication()
        app.launchArguments.append(contentsOf: ["--UITest"])
        self.app.launch()
        let configurationScreen = ConfigurationScreen()
        if configurationScreen.serverUrlFieldlink.exists {
            configurationScreen.settingCustomServerUrl(Constants.customURL)
        }
        GenericLibrary.appReset()
    }
    
    override func tearDown() {
        super.tearDown()
        app.terminate()
        GenericLibrary.deleteApp(appName: "Care")
        self.app = nil
    }
    
    func testSnoozeOptionInConversationSettings() {
        let loginScreen = LoginScreen()
        let snoozeScreen = SnoozeScreen()
        CustomWait.waitForElementToAppear(loginScreen.homePage, timeoutInSec: 15)
        snoozeScreen.gotoConversation()
        snoozeScreen.gotoSnoozeSettings()
        XCTAssertTrue(snoozeScreen.snoozeSettingsButton.exists)
        snoozeScreen.conversationSettingsDoneButton.tap()
        snoozeScreen.backButton.tap()
        snoozeScreen.backButton.tap()
        loginScreen.tapHamburgerMenuButton(name: "Care")
        loginScreen.logoutButton.tap()
    }
    
    func testSnoozePageScreen() {
        let loginScreen = LoginScreen()
        let snoozeScreen = SnoozeScreen()
        CustomWait.waitForElementToAppear(loginScreen.homePage, timeoutInSec: 15)
        snoozeScreen.gotoConversation()
        snoozeScreen.gotoSnoozeSettings()
        snoozeScreen.snoozeSettingsButton.tap()
        CustomWait.waitForElementToAppear(snoozeScreen.snoozePage, timeoutInSec: 5)
        XCTAssertTrue(snoozeScreen.snoozePage.exists)
        snoozeScreen.snoozePageCancelButton.tap()
        snoozeScreen.conversationSettingsDoneButton.tap()
        snoozeScreen.backButton.tap()
        snoozeScreen.backButton.tap()
        loginScreen.tapHamburgerMenuButton(name: "Care")
        loginScreen.logoutButton.tap()
    }
    
    func testAddingSnoozeForConversation() {
        let loginScreen = LoginScreen()
        let snoozeScreen = SnoozeScreen()
        CustomWait.waitForElementToAppear(loginScreen.homePage, timeoutInSec: 15)
        snoozeScreen.gotoConversation()
        snoozeScreen.gotoSnoozeSettings()
        snoozeScreen.snoozeSettingsButton.tap()
        CustomWait.waitForElementToAppear(snoozeScreen.snoozePage, timeoutInSec: 5)
        snoozeScreen.snoozePageDoneButton.tap()
        snoozeScreen.conversationSettingsDoneButton.tap()
        XCTAssertTrue(snoozeScreen.snoozedTime.exists)
        XCTAssertTrue(snoozeScreen.snoozedStatus.exists)
        snoozeScreen.backButton.tap()
        snoozeScreen.backButton.tap()
        loginScreen.tapHamburgerMenuButton(name: "Care")
        loginScreen.logoutButton.tap()
    }
}
