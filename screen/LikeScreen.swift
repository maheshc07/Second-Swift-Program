
import Foundation
import XCTest
class LikeScreen {
    let likeButton = XCUIApplication().tables.staticTexts["@ind_fashions"]
    let doneButton = XCUIApplication().navigationBars["Likes"].buttons["Done"]
    let likeCount = XCUIApplication().tables.staticTexts["1"]
    
    func likeThePost(){
        likeButton.tap()
        doneButton.tap()
    }
    func cancelingLike(){
        doneButton.tap()
    }
    func unlikeThePost(){
        likeButton.tap()
        doneButton.tap()
    }
}
