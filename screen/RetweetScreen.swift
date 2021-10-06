
import Foundation
import XCTest
class RetweetScreen {
    let retweetButton = XCUIApplication().tables.staticTexts["@ind_fashions"]
    let retweetTextview = XCUIApplication().textViews.element(boundBy: 0)
    let sendButton = XCUIApplication().toolbars.buttons["Send"]
    let doneButton = XCUIApplication().navigationBars["Retweets"].buttons["Done"]
    let cancelButton = XCUIApplication().navigationBars["Retweet"].buttons["Cancel"]
    
    func RetweetPost(text: String){
        retweetButton.tap()
        retweetTextview.tap()
        retweetTextview.typeText(text)
        CustomWait.waitForElementToAppear(sendButton, timeoutInSec: 2)
        sendButton.tap()
    }
    
    func cancelingRetweet(){
        cancelButton.tap()
    }
    
    func RetweetWithMoreCharacters(text: String){
        retweetButton.tap()
        retweetTextview.tap()
        retweetTextview.typeText(text)
    }
    
    func saveRetweet(){
        doneButton.tap()
    }
}
