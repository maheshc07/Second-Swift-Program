
import Foundation
import XCTest
class ForgotPasswordScreen {
    
    let enterEmailTextField =  XCUIApplication().textFields["reset_email"]
    let resetButton = XCUIApplication().buttons["reset_button"]
    let passwordSetAlert = XCUIApplication().alerts["Check Your Email"].buttons["Ok"]
    let passwordRequiredAlert = XCUIApplication().alerts["Invalid email address"].buttons["Ok"]
    let cancelbutton = XCUIApplication().buttons["Cancel"]
    let resetPasswordPage = XCUIApplication().navigationBars["Reset Password"]
    
    func settingEmailAddressAndTap(_ emailaddress: String) {
        resetPasswordPage.tap()
        CustomWait.waitForElementToAppear(enterEmailTextField, timeoutInSec: 5)
        enterEmailTextField.tap()
        enterEmailTextField.typeText(emailaddress)
        resetButton.tap()
    }
    
    func cancelingResetPassword() {
        cancelbutton.tap()
    }
}
