
import Foundation
import XCTest
class ReplyScreen {
    
   let replyButton = XCUIApplication().buttons["Reply"]
   let selectTemplateButton = XCUIApplication().buttons["template action icon"]
    let backButton = XCUIApplication().buttons["Back"]
    
    func replyToFacebookPost(){
        replyButton.tap()
    }
    
    func gotoResponseTemplateScreen(){
        selectTemplateButton.tap()
    }
    
    func gotoAssignedtoMeScreen() {
        backButton.tap()
    }
    
}
