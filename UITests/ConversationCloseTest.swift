
import Foundation
import XCTest
class ConversationCloseTest: XCTestCase {
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
    
    func testCloseAsOption() {
        let home =  HomeScreen()
        let loginScreen = LoginScreen()
        loginScreen.validateLogin(username: Constants.username, password: Constants.password)
        CustomWait.waitForElementToAppear(home.navigationBarsButton, timeoutInSec: 10)
        home.gotoAssignedToMe()
        let assignedtoMeScreen = AssignedToMeScreen()
        assignedtoMeScreen.tappingConversation()
        let  postOverflowScreen = PostOverflowScreen()
        postOverflowScreen.tappingOverflowButton()
        postOverflowScreen.tappingCloseAsButton()
        let closeScreen = CloseScreen()
        closeScreen.selectiingCloseAsOptions()
        XCTAssertTrue(closeScreen.closeButton.exists)
        closeScreen.cancleCloseOption()
        postOverflowScreen.savingChanges()
        let  conversationOverflowScreen = ConversationOverflowScreen()
        conversationOverflowScreen.gotoAssignedToMeScreen()
        assignedtoMeScreen.gotoHomeScreen()
        home.logout()
    }
    
    func testCancelingCloseAsOption() {
        let home =  HomeScreen()
        let loginScreen = LoginScreen()
        loginScreen.validateLogin(username: Constants.username, password: Constants.password)
        CustomWait.waitForElementToAppear(home.navigationBarsButton, timeoutInSec: 10)
        home.gotoAssignedToMe()
        let assignedtoMeScreen = AssignedToMeScreen()
        assignedtoMeScreen.tappingConversation()
        let  postOverflowScreen = PostOverflowScreen()
        postOverflowScreen.tappingOverflowButton()
        postOverflowScreen.tappingCloseAsButton()
        let closeScreen = CloseScreen()
        closeScreen.cancleCloseOption()
        XCTAssertTrue(postOverflowScreen.doneButton.exists)
        postOverflowScreen.savingChanges()
        let  conversationOverflowScreen = ConversationOverflowScreen()
        conversationOverflowScreen.gotoAssignedToMeScreen()
        assignedtoMeScreen.gotoHomeScreen()
        home.logout()
    }
}
