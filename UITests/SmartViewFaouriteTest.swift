
import Foundation
import XCTest

class SmartViewFavouriteTest : XCTestCase {
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
    
    func testFavoriteSmartView() {
        let home =  HomeScreen()
        CustomWait.waitForElementToAppear(home.smartviewButton, timeoutInSec: 15)
        home.gotoSmartviewsSection()
        let smartViewScreen = SmartViewScreen()
        smartViewScreen.settingSmartViewAsFavorite()
        smartViewScreen.gotoWorkQueueScreen()
        smartViewScreen.gotoHomeScreen()
        CustomWait.waitForElementToAppear(smartViewScreen.selectedSmartViewButton, timeoutInSec: 8)
        XCTAssertTrue(smartViewScreen.selectedSmartViewButton.exists)
        smartViewScreen.unsettingSmartviewAsFavorite()
        home.logout()
    }
}
