
import Foundation
import XCTest

class ConversationWatchTest: XCTestCase {
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
    
    func testConversationWatchUnwatch() {
        let home =  HomeScreen()
        let loginScreen = LoginScreen()
        loginScreen.validateLogin(username: Constants.username, password: Constants.password)
        CustomWait.waitForElementToAppear(home.navigationBarsButton, timeoutInSec: 10)
        home.gotoAssignedToMe()
        let assignedtoMeScreen = AssignedToMeScreen()
        CustomWait.waitForElementToAppear(assignedtoMeScreen.conversationButton, timeoutInSec: 10)
        assignedtoMeScreen.tappingConversation()
        let  postOverflowScreen = PostOverflowScreen()
        postOverflowScreen.tappingOverflowButton()
        postOverflowScreen.tappingWatchButton()
        postOverflowScreen.savingChanges()
        postOverflowScreen.tappingOverflowButton()
        CustomWait.waitForElementToAppear(postOverflowScreen.watchButton, timeoutInSec: 2)
        XCTAssertEqual(postOverflowScreen.watchButton.value as! String, "1" )
        postOverflowScreen.unWatchthePost()
        CustomWait.waitForElementToAppear(postOverflowScreen.watchButton, timeoutInSec: 2)
        XCTAssertEqual(postOverflowScreen.watchButton.value as! String, "0" )
        postOverflowScreen.savingChanges()
        let  conversationOverflowScreen = ConversationOverflowScreen()
        conversationOverflowScreen.gotoAssignedToMeScreen()
        assignedtoMeScreen.gotoHomeScreen()
        home.logout()
    }
}
