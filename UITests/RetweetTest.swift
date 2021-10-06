
import XCTest
class RetweetTest: XCTestCase {
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
    
    func testRetweet() {
        let loginScreen = LoginScreen()
        loginScreen.validateLogin(username: Constants.username, password: Constants.password)
        let home =  HomeScreen()
        CustomWait.waitForElementToAppear(home.navigationBarsButton,timeoutInSec: 5)
        home.gotoAssignedToMe()
        let assignedtoMeScreen = AssignedToMeScreen()
        assignedtoMeScreen.tappingOtherTwitterConversation()
        let  conversationOverflowScreen = ConversationOverflowScreen()
        conversationOverflowScreen.tappingtheconversationOverflowButton()
        conversationOverflowScreen.gotoRetweetScreen()
        let retweetScreen = RetweetScreen()
        retweetScreen.RetweetPost(text: GenericLibrary.randomString(length: 20))
        CustomWait.waitForElementToAppear(retweetScreen.doneButton,timeoutInSec: 2)
        XCTAssertTrue(retweetScreen.doneButton.exists)
        retweetScreen.saveRetweet()
        conversationOverflowScreen.savingSocialAction()
        conversationOverflowScreen.gotoAssignedToMeScreen()
        assignedtoMeScreen.gotoHomeScreen()
        home.logout()
    }
    
    func testRetweetMoreThan280Character() {
        let loginScreen = LoginScreen()
        loginScreen.validateLogin(username: Constants.username, password: Constants.password)
        let home =  HomeScreen()
        CustomWait.waitForElementToAppear(home.navigationBarsButton,timeoutInSec: 5)
        home.gotoAssignedToMe()
        let assignedtoMeScreen = AssignedToMeScreen()
        assignedtoMeScreen.tappingOtherTwitterConversation()
        let  conversationOverflowScreen = ConversationOverflowScreen()
        conversationOverflowScreen.tappingtheconversationOverflowButton()
        conversationOverflowScreen.gotoRetweetScreen()
        let retweetScreen = RetweetScreen()
        retweetScreen.RetweetWithMoreCharacters(text: GenericLibrary.randomString(length: 281))
        XCTAssertEqual(retweetScreen.sendButton.isEnabled, false)
        retweetScreen.cancelingRetweet()
        retweetScreen.saveRetweet()
        conversationOverflowScreen.savingSocialAction()
        conversationOverflowScreen.gotoAssignedToMeScreen()
        assignedtoMeScreen.gotoHomeScreen()
        home.logout()
    }
}
