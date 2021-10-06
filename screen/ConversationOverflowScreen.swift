

import Foundation
import XCTest

class ConversationOverflowScreen {
    let sentimentIcon =  XCUIApplication().staticTexts["Sentiment"]
    let doneButton = XCUIApplication().buttons["overflow_done_button"]
    let backButton = XCUIApplication().navigationBars.buttons["Back"]
    let likeButton = XCUIApplication().tables.staticTexts["Like"]
    let conversationOverflowButton = XCUIApplication().buttons["more"].firstMatch
    let tagButton = XCUIApplication().tables.staticTexts["Tags"]
    let retweetButton = XCUIApplication().tables.staticTexts["Retweet"]

    func gotoSentimentScreen() {
        sentimentIcon.tap()
    }
    
    func savingSocialAction() {
        CustomWait.waitForElementToAppear(doneButton, timeoutInSec : 10)
        doneButton.tap()
    }
    
    func gotoAssignedtoMeScreen() {
        backButton.tap()
    }
    
    func gotoLikeScreen() {
        likeButton.tap()
    }
    
    func tappingtheconversationOverflowButton(){
        CustomWait.waitForElementToAppear(conversationOverflowButton, timeoutInSec: 10)
        conversationOverflowButton.tap()
    }
    
    func gotoAssignedToMeScreen() {
        backButton.tap()
    }
    
    func gotoTagScreen() {
        tagButton.tap()
    }
    
    func gotoRetweetScreen() {
        retweetButton.tap()
    }
}

