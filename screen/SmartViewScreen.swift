
import Foundation
import XCTest

class SmartViewScreen {
    let smartviewButton = XCUIApplication().scrollViews.otherElements.tables.cells.children(matching: .other).element(boundBy: 0)
    let smartviewhomeButton = XCUIApplication().buttons["Home"]
    let selectedSmartViewButton = XCUIApplication().scrollViews.otherElements.tables.cells.containing(.staticText, identifier:"Mahesh Smart View").children(matching: .other).element(boundBy: 3)
    let workqueuesButton = XCUIApplication().buttons["Work Queues"]
    
    func settingSmartViewAsFavorite() {
        CustomWait.waitForElementToAppear(smartviewButton, timeoutInSec: 5)
        smartviewButton.tap()
    }
    
    func gotoHomeScreen(){
        smartviewhomeButton.tap()
    }
    
    func gotoWorkQueueScreen(){
        CustomWait.waitForElementToAppear(workqueuesButton, timeoutInSec: 5)
        workqueuesButton.tap()
    }
    
    func unsettingSmartviewAsFavorite() {
        selectedSmartViewButton.tap()
    }
    
}
