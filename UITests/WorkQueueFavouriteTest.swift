
import Foundation
import XCTest

class WorkQueueFavouriteTest: XCTestCase {
    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        self.app = XCUIApplication()
        app.launchArguments.append(contentsOf: ["--UITest"])
        self.app.launch()
        GenericLibrary.appReset()
    }
    
    override func tearDown() {
        super.tearDown()
        app.terminate()
        GenericLibrary.deleteApp(appName: "Care")
        self.app = nil
    }
    
    func testFavoriteWorkQueue() {
        let home =  HomeScreen()
        CustomWait.waitForElementToAppear(home.workqueuesButton, timeoutInSec: 15)
        home.gotoWorkqueuesSection()
        let workqueueScreen = WorkQueueScreen()
        workqueueScreen.settingWorkQueueAsFavorite()
        workqueueScreen.gotoSmartViewScreen()
        workqueueScreen.gotoHomeScreen()
        CustomWait.waitForElementToAppear(workqueueScreen.selectedWorkQueueButton, timeoutInSec: 10)
        XCTAssertTrue(workqueueScreen.selectedWorkQueueButton.exists)
        workqueueScreen.unsettingWorkQueueAsFavorite()
        home.logout()
    }
}
