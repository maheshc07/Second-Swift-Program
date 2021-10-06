
import Foundation
import XCTest

class PriorityTest: XCTestCase {
    var app: XCUIApplication!
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        self.app = XCUIApplication()
        app.launchArguments.append(contentsOf: ["--UITest"])
        self.app.launch()
        GenericLibrary.appReset()
    }
    
    override func tearDown() {
        super.tearDown()
        app.terminate()
        GenericLibrary.deleteApp(appName: "Care")
        self.app = nil
    }
    
    func testCancelPriority() {
        let home =  HomeScreen()
        CustomWait.waitForElementToAppear(home.navigationBarsButton, timeoutInSec: 15)
        home.gotoAssignedToMe()
        let assignedtoMeScreen = AssignedToMeScreen()
        assignedtoMeScreen.tappingConversation()
        let  postOverflowScreen = PostOverflowScreen()
        postOverflowScreen.tappingOverflowButton()
        postOverflowScreen.tappingPriorityButton()
        let priorityScreen = PriorityScreen()
        XCTAssertTrue(priorityScreen.cancelButton.exists)
        priorityScreen.canclePriorityScreen()
        postOverflowScreen.savingChanges()
        let  conversationOverflowScreen = ConversationOverflowScreen()
        conversationOverflowScreen.gotoAssignedToMeScreen()
        assignedtoMeScreen.gotoHomeScreen()
        home.logout()
    }
    
    func testChangePriority() {
        let home =  HomeScreen()
        CustomWait.waitForElementToAppear(home.navigationBarsButton, timeoutInSec: 15)
        home.gotoAssignedToMe()
        let assignedtoMeScreen = AssignedToMeScreen()
        assignedtoMeScreen.tappingConversation()
        let  postOverflowScreen = PostOverflowScreen()
        postOverflowScreen.tappingOverflowButton()
        postOverflowScreen.tappingPriorityButton()
        let priorityScreen = PriorityScreen()
        priorityScreen.settiingP3Priority()
        XCTAssertTrue(priorityScreen.saveButton.exists)
        priorityScreen.savingPriority()
        postOverflowScreen.savingChanges()
        postOverflowScreen.tappingOverflowButton()
        postOverflowScreen.tappingPriorityButton()
        priorityScreen.settingP5Priority()
        priorityScreen.savingPriority()
        postOverflowScreen.savingChanges()
        let  conversationOverflowScreen = ConversationOverflowScreen()
        conversationOverflowScreen.gotoAssignedToMeScreen()
        assignedtoMeScreen.gotoHomeScreen()
        home.logout()
    }
}
