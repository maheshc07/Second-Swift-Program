
import Foundation
import XCTest

class HomeScreen {
    let navigationBarsButton = XCUIApplication().navigationBars["Care"].children(matching: .button).element(boundBy: 0)
    let logoutButton = XCUIApplication().staticTexts["Log Out"]
    let workqueuesButton = XCUIApplication().buttons["Work Queues"]
    let smartviewButton = XCUIApplication().buttons["Smart Views"]
    let assignetomeButton = XCUIApplication().staticTexts["Assigned to Me"]
    let navigationSearchButton = XCUIApplication().navigationBars["Care"].buttons["Search"]
    let searchTextField = XCUIApplication().textFields["Search"]
    let assignedTwitterConversation = XCUIApplication().staticTexts["@anusuya_user"]
    let deleteButton =  XCUIApplication().buttons["delete"]
    let splashView = XCUIApplication().otherElements["SplashView"]
    let dashBoardButton = XCUIApplication().staticTexts["Dashboards"]
    let myDashboardButton = XCUIApplication().scrollViews.otherElements.tables.cells.containing(.staticText, identifier:"My Dashboard").children(matching: .other).element(boundBy: 3)
    
    func logout()  {
        navigationBarsButton.tap()
        logoutButton.tap()
    }
    
    func gotoWorkqueuesSection() {
        workqueuesButton.tap()
    }
    
    func gotoSmartviewsSection() {
        smartviewButton.tap()
    }
    
    func gotoAssignedToMe() {
        assignetomeButton.tap()
    }
    
    func gotoDashboardSection() {
        navigationBarsButton.tap()
        dashBoardButton.tap()
    }
    
    func removingMyDashBoard(){
        CustomWait.waitForElementToAppear(myDashboardButton, timeoutInSec: 2)
        myDashboardButton.tap()
    }
}
