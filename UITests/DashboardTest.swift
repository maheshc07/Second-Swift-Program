
import Foundation
import XCTest

class DashboardTest : XCTestCase {
    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        self.app = XCUIApplication()
        app.launchArguments.append(contentsOf: ["--UITest"])
        self.app.launch()
        let configurationScreen = ConfigurationScreen()
        if configurationScreen.serverUrlFieldlink.exists {
            configurationScreen.settingCustomServerUrl(Constants.customURL)
        }
    }
    
    override func tearDown() {
        super.tearDown()
        app.terminate()
        GenericLibrary.deleteApp(appName: "Care")
        self.app = nil
    }
    
    func testFavoriteDashboard() {
        let loginScreen = LoginScreen()
        loginScreen.validateLogin(username: Constants.usernameAdmin, password: Constants.passwordAdmin)
        let home =  HomeScreen()
        CustomWait.waitForElementToAppear(home.assignetomeButton, timeoutInSec: 15)
        home.gotoDashboardSection()
        let dashboardScreen = DashboardScreen()
        dashboardScreen.tappingOnDashboardFavoriteButton()
        dashboardScreen.gotoHomeScreen()
        CustomWait.waitForElementToAppear(home.myDashboardButton, timeoutInSec: 3)
        XCTAssertTrue(home.myDashboardButton.exists)
        home.removingMyDashBoard()
        home.logout()
    }
    
    func test8HoursDashBoard() {
        let loginScreen = LoginScreen()
        loginScreen.validateLogin(username: Constants.usernameAdmin, password: Constants.passwordAdmin)
        let home =  HomeScreen()
        CustomWait.waitForElementToAppear(home.assignetomeButton, timeoutInSec: 15)
        home.gotoDashboardSection()
        let dashboardScreen = DashboardScreen()
        dashboardScreen.tappingOnMydashBoard()
        dashboardScreen.tapping8HoursButton()
        CustomWait.waitForElementToAppear(dashboardScreen.interval30mins, timeoutInSec: 5)
        XCTAssertTrue(dashboardScreen.interval30mins.exists)
        dashboardScreen.tappingBackButton()
        dashboardScreen.gotoHomeScreen()
        home.logout()
    }
    
    func test1DayDashBoard() {
        let loginScreen = LoginScreen()
        loginScreen.validateLogin(username: Constants.usernameAdmin, password: Constants.passwordAdmin)
        let home =  HomeScreen()
        CustomWait.waitForElementToAppear(home.assignetomeButton, timeoutInSec: 15)
        home.gotoDashboardSection()
        let dashboardScreen = DashboardScreen()
        dashboardScreen.tappingOnMydashBoard()
        dashboardScreen.tapping1DayButton()
        CustomWait.waitForElementToAppear(dashboardScreen.interval1Hour, timeoutInSec: 5)
        XCTAssertTrue(dashboardScreen.interval1Hour.exists)
        dashboardScreen.tappingBackButton()
        dashboardScreen.gotoHomeScreen()
        home.logout()    
    }
    
    func test5DayDashBoard() {
        let loginScreen = LoginScreen()
        loginScreen.validateLogin(username: Constants.usernameAdmin, password: Constants.passwordAdmin)
        let home =  HomeScreen()
        CustomWait.waitForElementToAppear(home.assignetomeButton, timeoutInSec: 15)
        home.gotoDashboardSection()
        let dashboardScreen = DashboardScreen()
        dashboardScreen.tappingOnMydashBoard()
        dashboardScreen.tapping5DayButton()
        CustomWait.waitForElementToAppear(dashboardScreen.interval8Hour, timeoutInSec: 10)
        XCTAssertTrue(dashboardScreen.interval8Hour.exists)
        dashboardScreen.tappingBackButton()
        dashboardScreen.gotoHomeScreen()
        home.logout()
    }
    
    func test7DayDashBoard() {
        let loginScreen = LoginScreen()
        loginScreen.validateLogin(username: Constants.usernameAdmin, password: Constants.passwordAdmin)
        let home =  HomeScreen()
        CustomWait.waitForElementToAppear(home.assignetomeButton, timeoutInSec: 15)
        home.gotoDashboardSection()
        let dashboardScreen = DashboardScreen()
        dashboardScreen.tappingOnMydashBoard()
        dashboardScreen.tapping7DayButton()
        CustomWait.waitForElementToAppear(dashboardScreen.interval12Hour, timeoutInSec: 15)
        XCTAssertTrue(dashboardScreen.interval12Hour.exists)
        dashboardScreen.tappingBackButton()
        dashboardScreen.gotoHomeScreen()
        home.logout()
    }
    
    func testDashboardTimeZone() {
        let loginScreen = LoginScreen()
        loginScreen.validateLogin(username: Constants.usernameAdmin, password: Constants.passwordAdmin)
        let home = HomeScreen()
        CustomWait.waitForElementToAppear(home.assignetomeButton, timeoutInSec: 15)
        home.gotoDashboardSection()
        let dashboardScreen = DashboardScreen()
        dashboardScreen.tappingOnMydashBoard()
        dashboardScreen.timeZoneButton.tap()
        dashboardScreen.searchField.tap()
        dashboardScreen.searchField.typeText("Kolkata")
        XCTAssertTrue(dashboardScreen.timeZoneKolkata.exists)
        dashboardScreen.timeZoneKolkata.tap()
        dashboardScreen.tappingBackButton()
        dashboardScreen.gotoHomeScreen()
        home.logout()
    }
}

