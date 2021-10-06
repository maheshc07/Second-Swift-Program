
import Foundation
import XCTest

class ResponseTemplateTest: XCTestCase {
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
        self.app = nil
    }
    
    func testAddResponseTemplate() {
        let home =  HomeScreen()
        CustomWait.waitForElementToAppear(home.navigationBarsButton, timeoutInSec: 10)
        home.gotoAssignedToMe()
        let assignedtoMeScreen = AssignedToMeScreen()
        assignedtoMeScreen.tappingConversation()
        let replyScreen = ReplyScreen()
        replyScreen.replyToFacebookPost()
        replyScreen.gotoResponseTemplateScreen()
        let responseTemplateScreen = ResponseTemplateScreen()
        responseTemplateScreen.addResponseTemplate()
        XCTAssertTrue(responseTemplateScreen.sendbtn.exists)
        responseTemplateScreen.cancelAddResponseTemplate()
        replyScreen.gotoAssignedtoMeScreen()
        assignedtoMeScreen.gotoHomeScreen()
        home.logout()
    }
    
    func testSearchResponseTemplate() {
        
        let home =  HomeScreen()
        CustomWait.waitForElementToAppear(home.navigationBarsButton, timeoutInSec: 5)
        home.gotoAssignedToMe()
        let assignedtoMeScreen = AssignedToMeScreen()
        assignedtoMeScreen.tappingConversation()
        let replyScreen = ReplyScreen()
        replyScreen.replyToFacebookPost()
        replyScreen.gotoResponseTemplateScreen()
        let responseTemplateScreen = ResponseTemplateScreen()
        responseTemplateScreen.searchResponseTemplate(templatename: "Mobile")
        XCTAssertTrue(responseTemplateScreen.selecttemplteText.exists)
        responseTemplateScreen.cancelSearchResponseTemplate()
        responseTemplateScreen.cancelAddResponseTemplate()
        replyScreen.gotoAssignedtoMeScreen()
        assignedtoMeScreen.gotoHomeScreen()
        home.logout()
    }
    
}
