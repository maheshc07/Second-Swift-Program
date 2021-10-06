
import Foundation
import XCTest

class AddTagTest: XCTestCase {
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
    
    func testRemoveTag() {
        let loginScreen = LoginScreen()
        loginScreen.validateLogin(username: Constants.username, password: Constants.password)
        let home =  HomeScreen()
        CustomWait.waitForElementToAppear(home.navigationBarsButton, timeoutInSec: 10)
        home.gotoAssignedToMe()
        let assignedtoMeScreen = AssignedToMeScreen()
        assignedtoMeScreen.tappingConversation()
        let  conversationOverflowScreen = ConversationOverflowScreen()
        conversationOverflowScreen.tappingtheconversationOverflowButton()
        conversationOverflowScreen.gotoTagScreen()
        let tagScreen = TagScreen()
        tagScreen.searchTag()
        tagScreen.addTag()
        tagScreen.saveTag()
        conversationOverflowScreen.savingSocialAction()
        conversationOverflowScreen.gotoAssignedToMeScreen()
        assignedtoMeScreen.gotoHomeScreen()
        home.gotoAssignedToMe()
        assignedtoMeScreen.tappingConversation()
        conversationOverflowScreen.tappingtheconversationOverflowButton()
        conversationOverflowScreen.gotoTagScreen()
        XCTAssertTrue(tagScreen.tagCountAdd.exists)
        conversationOverflowScreen.gotoTagScreen()
        tagScreen.removeTag()
        conversationOverflowScreen.savingSocialAction()
        conversationOverflowScreen.gotoAssignedToMeScreen()
        assignedtoMeScreen.gotoHomeScreen()
        home.gotoAssignedToMe()
        assignedtoMeScreen.tappingConversation()
        conversationOverflowScreen.tappingtheconversationOverflowButton()
        CustomWait.waitForElementToAppear(tagScreen.tagCountRemove, timeoutInSec: 3)
        XCTAssertTrue(tagScreen.tagCountRemove.exists)
        conversationOverflowScreen.savingSocialAction()
        conversationOverflowScreen.gotoAssignedToMeScreen()
        assignedtoMeScreen.gotoHomeScreen()
        home.logout()
    }
    
    func testTagAdd() {
        let loginScreen = LoginScreen()
        loginScreen.validateLogin(username: Constants.username, password: Constants.password)
        let home =  HomeScreen()
        CustomWait.waitForElementToAppear(home.navigationBarsButton, timeoutInSec: 10)
        home.gotoAssignedToMe()
        let assignedtoMeScreen = AssignedToMeScreen()
        assignedtoMeScreen.tappingConversation()
        let  conversationOverflowScreen = ConversationOverflowScreen()
        conversationOverflowScreen.tappingtheconversationOverflowButton()
        conversationOverflowScreen.gotoTagScreen()
        let tagScreen = TagScreen()
        tagScreen.searchTag()
        tagScreen.addTag()
        tagScreen.saveTag()
        conversationOverflowScreen.savingSocialAction()
        conversationOverflowScreen.gotoAssignedToMeScreen()
        assignedtoMeScreen.gotoHomeScreen()
        home.gotoAssignedToMe()
        assignedtoMeScreen.tappingConversation()
        conversationOverflowScreen.tappingtheconversationOverflowButton()
        conversationOverflowScreen.gotoTagScreen()
        XCTAssertTrue(tagScreen.tagCountAdd.exists)
        conversationOverflowScreen.gotoTagScreen()
        tagScreen.removeTag()
        conversationOverflowScreen.savingSocialAction()
        conversationOverflowScreen.gotoAssignedToMeScreen()
        assignedtoMeScreen.gotoHomeScreen()
        home.logout()
    }
    
    func testCancelTag() {
        let loginScreen = LoginScreen()
        loginScreen.validateLogin(username: Constants.username, password: Constants.password)
        let home =  HomeScreen()
        CustomWait.waitForElementToAppear(home.navigationBarsButton,timeoutInSec: 15)
        home.gotoAssignedToMe()
        let assignedtoMeScreen = AssignedToMeScreen()
        CustomWait.waitForElementToAppear(assignedtoMeScreen.conversationButton,timeoutInSec: 15)
        assignedtoMeScreen.tappingConversation()
        let  conversationOverflowScreen = ConversationOverflowScreen()
        conversationOverflowScreen.tappingtheconversationOverflowButton()
        conversationOverflowScreen.gotoTagScreen()
        let tagScreen = TagScreen()
        tagScreen.cancelTag()
        XCTAssertTrue(conversationOverflowScreen.tagButton.exists)
        conversationOverflowScreen.savingSocialAction()
        conversationOverflowScreen.gotoAssignedToMeScreen()
        assignedtoMeScreen.gotoHomeScreen()
        home.logout()
    }
    
    func testSearchTag() {
        let loginScreen = LoginScreen()
        loginScreen.validateLogin(username: Constants.username, password: Constants.password)
        let home =  HomeScreen()
        CustomWait.waitForElementToAppear(home.navigationBarsButton,timeoutInSec: 15)
        home.gotoAssignedToMe()
        let assignedtoMeScreen = AssignedToMeScreen()
        assignedtoMeScreen.tappingConversation()
        let  conversationOverflowScreen = ConversationOverflowScreen()
        conversationOverflowScreen.tappingtheconversationOverflowButton()
        CustomWait.waitForElementToAppear(conversationOverflowScreen.conversationOverflowButton, timeoutInSec: 5)
        conversationOverflowScreen.gotoTagScreen()
        let tagScreen = TagScreen()
        tagScreen.searchTagWithText(text: "mobileTag")
        XCTAssertTrue(tagScreen.tagAdd.exists)
        tagScreen.cancelSearch()
        conversationOverflowScreen.savingSocialAction()
        conversationOverflowScreen.gotoAssignedToMeScreen()
        assignedtoMeScreen.gotoHomeScreen()
        home.logout()
    }
}

