
import Foundation
import XCTest

class InternalNoteTest: XCTestCase {
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
    }
    
    override func tearDown() {
        super.tearDown()
        app.terminate()
        GenericLibrary.deleteApp(appName: "Care")
        self.app = nil
    }
    
    func testInternalNoteCancel() {
        let loginScreen = LoginScreen()
        loginScreen.validateLogin(username: Constants.username, password: Constants.password)
        let home =  HomeScreen()
        CustomWait.waitForElementToAppear(home.navigationBarsButton, timeoutInSec: 15)
        home.gotoAssignedToMe()
        let assignedtoMeScreen = AssignedToMeScreen()
        CustomWait.waitForElementToAppear(assignedtoMeScreen.conversationButton, timeoutInSec: 15)
        assignedtoMeScreen.tappingConversation()
        let  internalNoteScreen = InternalNoteScreen()
        internalNoteScreen.tappingOnInternalNote()
        XCTAssertTrue(internalNoteScreen.internalNotePage.exists)
        internalNoteScreen.cancelInternalNoteScreen()
        XCTAssertTrue(internalNoteScreen.internalNoteButton.exists)
        let  conversationOverflowScreen = ConversationOverflowScreen()
        conversationOverflowScreen.gotoAssignedToMeScreen()
        assignedtoMeScreen.gotoHomeScreen()
        home.logout()
    }
    
    func testAddingEmptyInternalNote() {
        let loginScreen = LoginScreen()
        loginScreen.validateLogin(username: Constants.username, password: Constants.password)
        let home =  HomeScreen()
        CustomWait.waitForElementToAppear(home.navigationBarsButton, timeoutInSec: 10)
        home.gotoAssignedToMe()
        let assignedtoMeScreen = AssignedToMeScreen()
        CustomWait.waitForElementToAppear(assignedtoMeScreen.conversationButton, timeoutInSec: 15)
        assignedtoMeScreen.tappingConversation()
        let  internalNoteScreen = InternalNoteScreen()
        internalNoteScreen.tappingOnInternalNote()
        internalNoteScreen.addingEmptyInternalNote()
        CustomWait.waitForElementToAppear(internalNoteScreen.internalNoteAlertCancelButton, timeoutInSec: 3)
        XCTAssertTrue(internalNoteScreen.internalNoteAlertCancelButton.exists)
        internalNoteScreen.dismissEmptyInternalNote()
        internalNoteScreen.cancelInternalNoteScreen()
        let  conversationOverflowScreen = ConversationOverflowScreen()
        conversationOverflowScreen.gotoAssignedToMeScreen()
        assignedtoMeScreen.gotoHomeScreen()
        home.logout()
    }
    
    func testAddingInternalNote() {
        let loginScreen = LoginScreen()
        loginScreen.validateLogin(username: Constants.username, password: Constants.password)
        let home =  HomeScreen()
        CustomWait.waitForElementToAppear(home.navigationBarsButton, timeoutInSec: 10)
        home.gotoAssignedToMe()
        let assignedtoMeScreen = AssignedToMeScreen()
        CustomWait.waitForElementToAppear(assignedtoMeScreen.conversationButton, timeoutInSec: 15)
        assignedtoMeScreen.tappingConversation()
        let  internalNoteScreen = InternalNoteScreen()
        internalNoteScreen.tappingOnInternalNote()
        internalNoteScreen.savingInternalNote(internalNoteText: "InternalNote_Automation")
        let  conversationOverflowScreen = ConversationOverflowScreen()
        conversationOverflowScreen.gotoAssignedToMeScreen()
        assignedtoMeScreen.gotoHomeScreen()
        home.gotoAssignedToMe()
        assignedtoMeScreen.tappingConversation()
        assignedtoMeScreen.swipeUpConversation()
        CustomWait.waitForElementToAppear(assignedtoMeScreen.internalNote, timeoutInSec: 3)
        XCTAssertTrue(assignedtoMeScreen.internalNote.exists)
        conversationOverflowScreen.gotoAssignedToMeScreen()
        assignedtoMeScreen.gotoHomeScreen()
        home.logout()
    }
}
