
import Foundation
import XCTest
class ShowDiscussionTest: XCTestCase {
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
        GenericLibrary.deleteApp(appName: "Lithium")
        self.app = nil
    }
    
    func testShowDiscussionSwitch() {
        let loginScreen = LoginScreen()
        loginScreen.validateLogin(username: Constants.username, password: Constants.password)
        let home =  HomeScreen()
        CustomWait.waitForElementToAppear(home.navigationBarsButton, timeoutInSec: 10)
        home.gotoAssignedToMe()
        let assignedtoMeScreen = AssignedToMeScreen()
        assignedtoMeScreen.tappingConversation()
        let  postOverflowScreen = PostOverflowScreen()
        postOverflowScreen.tappingOverflowButton()
        postOverflowScreen.tappingShowDiscussionButton()
        postOverflowScreen.savingChanges()
        postOverflowScreen.tappingOverflowButton()
        CustomWait.waitForElementToAppear(postOverflowScreen.showDiscussionSwitch, timeoutInSec: 2)
        XCTAssertEqual(postOverflowScreen.showDiscussionSwitch.value as! String, "1" )
        postOverflowScreen.tappingShowDiscussionButton()
        postOverflowScreen.savingChanges()
        postOverflowScreen.tappingOverflowButton()
        XCTAssertEqual(postOverflowScreen.showDiscussionSwitch.value as! String, "0" )
        postOverflowScreen.savingChanges()
        let  conversationOverflowScreen = ConversationOverflowScreen()
        conversationOverflowScreen.gotoAssignedToMeScreen()
        assignedtoMeScreen.gotoHomeScreen()
        home.logout()
    }
}
