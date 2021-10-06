
import Foundation
import XCTest
class SentimentScreen {
    let postiveIcon = XCUIApplication().tables.staticTexts["Postive"]
    let neutralIcon = XCUIApplication().staticTexts["Neutral"]
    let negativeIcon = XCUIApplication().staticTexts["Negative"]
    let cancelButton = XCUIApplication().navigationBars["Sentiment"].buttons["Cancel"]
    let doneButton = XCUIApplication().navigationBars["Sentiment"].buttons["Done"]
    let sentimentCheckmarkIcon = XCUIApplication().staticTexts["sentiment_checkmark_icon"]
    
    
    func addingSentiment(){
        postiveIcon.tap()
        doneButton.tap()
    }
    func cancelingSentiment(){
        cancelButton.tap()
    }
    func removingSentiment(){
        postiveIcon.tap()
        doneButton.tap()
    }
}
