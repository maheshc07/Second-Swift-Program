
import Foundation
import XCTest

class ForgotPasswordTest: XCTestCase {
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
    
    func testPasswordChange() {
        let login = LoginScreen()
        CustomWait.waitForElementToAppear(login.passwordFieldLink, timeoutInSec: 5)
        login.forgotPasswordlink()
        let forgotPasswordtest = ForgotPasswordScreen()
        forgotPasswordtest.settingEmailAddressAndTap("abcd@gmail.com")
        CustomWait.waitForElementToAppear(forgotPasswordtest.passwordSetAlert, timeoutInSec: 10)
        XCTAssertTrue(forgotPasswordtest.passwordSetAlert.exists)
        
    }
    
    func testPasswordChangeWithoutEmail() {
        let login = LoginScreen()
        login.forgotPasswordlink()
        let forgotPasswordtest = ForgotPasswordScreen() ;
        forgotPasswordtest.settingEmailAddressAndTap("")
        CustomWait.waitForElementToAppear(forgotPasswordtest.passwordRequiredAlert, timeoutInSec: 10)
        XCTAssertTrue(forgotPasswordtest.passwordRequiredAlert.exists)
                    
    }
    
    func testPasswordChangeCancel() {
        let login = LoginScreen()
        login.forgotPasswordlink()
        let forgotPassword = ForgotPasswordScreen() ;
        forgotPassword.cancelingResetPassword()
        XCTAssertTrue(login.enterEmailTextField.exists)
          
    }
}
