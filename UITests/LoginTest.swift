
import Foundation
import XCTest

class LoginTest: XCTestCase {
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
    
    func testLogin() {
        let loginScreen = LoginScreen()
        loginScreen.validateLogin(username: Constants.username, password: Constants.password)
        let home =  HomeScreen()
        CustomWait.waitForElementToAppear(home.navigationBarsButton, timeoutInSec: 12)
        XCTAssertTrue(home.assignetomeButton.exists)
        home.logout()
    }
    
    func testInValidLogin() {
        let loginScreen = LoginScreen()
        loginScreen.validateLogin(username: "invalid@gmail.com", password: "Lithium@1")
        CustomWait.waitForElementToAppear(loginScreen.failedLoginMessage, timeoutInSec: 15)
        XCTAssertTrue(loginScreen.failedLoginMessage.exists)
    }
}
