
import XCTest
class TwitterConversationOverflowTest: XCTestCase {
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

    func testRemoveSentimentTwitterPost() {
        let loginScreen = LoginScreen()
        loginScreen.validateLogin(username: Constants.username, password: Constants.password)
        let home =  HomeScreen()
        CustomWait.waitForElementToAppear(home.navigationBarsButton, timeoutInSec: 5)
        home.gotoAssignedToMe()
        let assignedtoMeScreen = AssignedToMeScreen()
        assignedtoMeScreen.tappingTwitterConversation()
        let  conversationOverflowScreen = ConversationOverflowScreen()
        conversationOverflowScreen.tappingtheconversationOverflowButton()
        conversationOverflowScreen.gotoSentimentScreen()
        let sentimentScreen = SentimentScreen()
        sentimentScreen.addingSentiment()
        conversationOverflowScreen.gotoSentimentScreen()
        XCTAssertTrue(sentimentScreen.postiveIcon.exists)
        sentimentScreen.removingSentiment()
        conversationOverflowScreen.savingSocialAction()
        conversationOverflowScreen.gotoAssignedToMeScreen()
        assignedtoMeScreen.gotoHomeScreen()
        home.logout()
    }
    func testAddSentimentTwitterPost() {
        let loginScreen = LoginScreen()
        loginScreen.validateLogin(username: Constants.username, password: Constants.password)
        let home =  HomeScreen()
        CustomWait.waitForElementToAppear(home.navigationBarsButton, timeoutInSec: 5)
        home.gotoAssignedToMe()
        let assignedtoMeScreen = AssignedToMeScreen()
        assignedtoMeScreen.tappingTwitterConversation()
        let  conversationOverflowScreen = ConversationOverflowScreen()
        conversationOverflowScreen.tappingtheconversationOverflowButton()
        conversationOverflowScreen.gotoSentimentScreen()
        let sentimentScreen = SentimentScreen()
        sentimentScreen.addingSentiment()
        conversationOverflowScreen.gotoSentimentScreen()
        XCTAssertTrue(sentimentScreen.postiveIcon.exists)
        sentimentScreen.removingSentiment()
        conversationOverflowScreen.savingSocialAction()
        conversationOverflowScreen.gotoAssignedToMeScreen()
        assignedtoMeScreen.gotoHomeScreen()
        home.logout()
    }
    
    func testCancelSentiment() {
        let loginScreen = LoginScreen()
        loginScreen.validateLogin(username: Constants.username, password: Constants.password)
        let home =  HomeScreen()
        CustomWait.waitForElementToAppear(home.navigationBarsButton, timeoutInSec: 5)
        home.gotoAssignedToMe()
        let assignedtoMeScreen = AssignedToMeScreen()
        assignedtoMeScreen.tappingTwitterConversation()
        let  conversationOverflowScreen = ConversationOverflowScreen()
        conversationOverflowScreen.tappingtheconversationOverflowButton()
        conversationOverflowScreen.gotoSentimentScreen()
        let sentimentScreen = SentimentScreen()
        sentimentScreen.cancelingSentiment()
        XCTAssertTrue(conversationOverflowScreen.sentimentIcon.exists)
        conversationOverflowScreen.savingSocialAction()
        conversationOverflowScreen.gotoAssignedToMeScreen()
        assignedtoMeScreen.gotoHomeScreen()
        home.logout()
    }
    
    func testUnlikeTwitterPost() {
        let loginScreen = LoginScreen()
        loginScreen.validateLogin(username: Constants.username, password: Constants.password)
        let home =  HomeScreen()
        CustomWait.waitForElementToAppear(home.navigationBarsButton,timeoutInSec: 5)
        home.gotoAssignedToMe()
        let assignedtoMeScreen = AssignedToMeScreen()
        assignedtoMeScreen.tappingTwitterConversation()
        let  conversationOverflowScreen = ConversationOverflowScreen()
        conversationOverflowScreen.tappingtheconversationOverflowButton()
        conversationOverflowScreen.gotoLikeScreen()
        let likeScreen = LikeScreen()
        likeScreen.likeThePost()
        conversationOverflowScreen.savingSocialAction()
        conversationOverflowScreen.gotoAssignedToMeScreen()
        assignedtoMeScreen.tappingTwitterConversation()
        conversationOverflowScreen.tappingtheconversationOverflowButton()
        CustomWait.waitForElementToAppear(likeScreen.likeCount, timeoutInSec: 2)
        XCTAssertTrue(likeScreen.likeCount.exists)
        conversationOverflowScreen.gotoLikeScreen()
        likeScreen.unlikeThePost()
        conversationOverflowScreen.savingSocialAction()
        conversationOverflowScreen.gotoAssignedToMeScreen()
        assignedtoMeScreen.gotoHomeScreen()
        home.logout()
    }
    func testlikeTwitterPost() {
        let loginScreen = LoginScreen()
        loginScreen.validateLogin(username: Constants.username, password: Constants.password)
        let home =  HomeScreen()
        CustomWait.waitForElementToAppear(home.navigationBarsButton, timeoutInSec: 5)
        home.gotoAssignedToMe()
        let assignedtoMeScreen = AssignedToMeScreen()
        assignedtoMeScreen.tappingTwitterConversation()
        let  conversationOverflowScreen = ConversationOverflowScreen()
        conversationOverflowScreen.tappingtheconversationOverflowButton()
        conversationOverflowScreen.gotoLikeScreen()
        let likeScreen = LikeScreen()
        likeScreen.likeThePost()
        conversationOverflowScreen.savingSocialAction()
        conversationOverflowScreen.gotoAssignedToMeScreen()
        assignedtoMeScreen.tappingTwitterConversation()
        conversationOverflowScreen.tappingtheconversationOverflowButton()
        CustomWait.waitForElementToAppear(likeScreen.likeCount, timeoutInSec: 2)
        XCTAssertTrue(likeScreen.likeCount.exists)
        conversationOverflowScreen.gotoLikeScreen()
        likeScreen.unlikeThePost()
        conversationOverflowScreen.savingSocialAction()
        conversationOverflowScreen.gotoAssignedToMeScreen()
        assignedtoMeScreen.gotoHomeScreen()
        home.logout()
    }
    func testCancelLikeTwitterPost(){
        let loginScreen = LoginScreen()
        loginScreen.validateLogin(username: Constants.username, password: Constants.password)
        let home =  HomeScreen()
        CustomWait.waitForElementToAppear(home.navigationBarsButton, timeoutInSec: 5)
        home.gotoAssignedToMe()
        let assignedtoMeScreen = AssignedToMeScreen()
        assignedtoMeScreen.tappingTwitterConversation()
        let  conversationOverflowScreen = ConversationOverflowScreen()
        conversationOverflowScreen.tappingtheconversationOverflowButton()
        conversationOverflowScreen.gotoLikeScreen()
        let likeScreen = LikeScreen()
        likeScreen.cancelingLike()
        XCTAssertFalse(likeScreen.likeButton.exists)
        conversationOverflowScreen.savingSocialAction()
        conversationOverflowScreen.gotoAssignedToMeScreen()
        assignedtoMeScreen.gotoHomeScreen()
        home.logout()
    }    
}
