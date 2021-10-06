
import Foundation
import XCTest
class ResponseTemplateScreen {
    let selecttemplteText = XCUIApplication().staticTexts["MobileAgent Template"]
    let sendbtn = XCUIApplication().buttons["Send"]
    let cancelResponseTemplatebtn = XCUIApplication().navigationBars["Templates"].buttons["Cancel"]
    let cancelReplybtn = XCUIApplication().navigationBars["Reply"].buttons["Cancel"]
    let backbtn = XCUIApplication().buttons["Back"]
    let clearbtn = XCUIApplication().buttons["Clear text"]
    let searchIconbtn = XCUIApplication().buttons["Icon Search Menu"]
    let searchTemplateTextField = XCUIApplication().searchFields["Search Templates"]
    
    func searchResponseTemplate(templatename: String){
        searchIconbtn.tap()
        searchTemplateTextField.tap()
        searchTemplateTextField.typeText(templatename)
    }
    
    func addResponseTemplate(){
        selecttemplteText.tap()
    }
    
    func cancelAddResponseTemplate() {
        cancelReplybtn.tap()
    }
    
    func cancelSearchResponseTemplate() {
        cancelResponseTemplatebtn.tap()
    }
    
    func gotoReplyScreen() {
        backbtn.tap()
    }
}
