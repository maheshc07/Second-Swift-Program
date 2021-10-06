
import Foundation
import XCTest

class DashboardScreen {
    let dashboardfavoriteButton = XCUIApplication().tables.cells.containing(.staticText, identifier:"My Dashboard").children(matching: .other).element(boundBy: 0)
    let dashboardUnfavoriteButton = XCUIApplication().tables.cells.otherElements.containing(.image, identifier:"starFilled").element
    let dashBoardNavigationBar = XCUIApplication().navigationBars.buttons.firstMatch
    let responseButton = XCUIApplication().tables.staticTexts["Response"]
    let timeZoneButton = XCUIApplication().navigationBars["My Dashboard"].children(matching: .button).element(boundBy: 1)
    let myDashBoardButton = XCUIApplication().tables.staticTexts["My Dashboard"]
    let hour1Button = XCUIApplication().tabBars["Tab Bar"].buttons["1H"]
    let hours8Button =  XCUIApplication().tabBars["Tab Bar"].buttons["8H"]
    let dayButton = XCUIApplication().tabBars["Tab Bar"].buttons["1D"]
    let day5Button =  XCUIApplication().tabBars["Tab Bar"].buttons["5D"]
    let day7Button =  XCUIApplication().tabBars["Tab Bar"].buttons["7D"]
    let interval30mins = XCUIApplication().tables.staticTexts["30 MINUTE INTERVAL"]
    let interval1Hour = XCUIApplication().tables.staticTexts["1 HOUR INTERVAL"]
    let interval8Hour = XCUIApplication().tables.staticTexts["8 HOUR INTERVAL"]
    let interval12Hour = XCUIApplication().tables.staticTexts["12 HOUR INTERVAL"]
    let backButton = XCUIApplication().navigationBars["My Dashboard"].buttons["navArrowBack"]
    let searchField = XCUIApplication().searchFields["Search"]
    let timeZoneKolkata = XCUIApplication().tables/*@START_MENU_TOKEN@*/.staticTexts["(+05:30) Asia/Kolkata"]/*[[".cells.staticTexts[\"(+05:30) Asia\/Kolkata\"]",".staticTexts[\"(+05:30) Asia\/Kolkata\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/

    func tappingOnDashboardFavoriteButton(){
        dashboardfavoriteButton.tap()
    }
    
    func gotoHomeScreen() {
        dashBoardNavigationBar.tap()
        responseButton.tap()
    }
    
    func tappingOnMydashBoard(){
        myDashBoardButton.tap()
    }
    
    func changingTimeZone(){
        timeZoneButton.tap()
    }
    
    func tapping8HoursButton(){
        CustomWait.waitForElementToAppear(hours8Button, timeoutInSec: 2)
        hours8Button.tap()
    }
    
    func tapping1DayButton(){
        CustomWait.waitForElementToAppear(dayButton, timeoutInSec: 2)
        dayButton.tap()
    }
    
    func tapping5DayButton(){
        CustomWait.waitForElementToAppear(day5Button, timeoutInSec: 2)
        day5Button.tap()
    }
    
    func tapping7DayButton(){
        CustomWait.waitForElementToAppear(day7Button, timeoutInSec: 2)
        day7Button.tap()
    }
    
    func tappingBackButton(){
        backButton.tap()
    }
    
    func tapping1HourButton()
    {
        CustomWait.waitForElementToAppear(hour1Button, timeoutInSec: 2)
        hour1Button.tap()
    }
}
