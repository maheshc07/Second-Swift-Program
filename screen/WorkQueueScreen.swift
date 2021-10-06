
import Foundation
import XCTest
class WorkQueueScreen {
    let workQueuesButton = XCUIApplication().scrollViews.otherElements.tables.cells.containing(.staticText, identifier:"Default Work Queue").children(matching: .other).element(boundBy: 0)
    let homeButton = XCUIApplication().buttons["Home"]
    let smartViewButton = XCUIApplication().buttons["Smart Views"]
    let selectedWorkQueueButton = XCUIApplication().scrollViews.otherElements.tables.cells.containing(.staticText, identifier:"Default Work Queue").children(matching: .other).element(boundBy: 3)
    
    func settingWorkQueueAsFavorite() {
        workQueuesButton.tap()
    }
    
    func gotoHomeScreen(){
        homeButton.tap()
    }
    
    func unsettingWorkQueueAsFavorite() {
        selectedWorkQueueButton.tap()
    }
    
    func gotoSmartViewScreen(){
        smartViewButton.tap()
    }
}
