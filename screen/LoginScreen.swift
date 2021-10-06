
import Foundation
import XCTest

class LoginScreen {
    let enterEmailTextField =  XCUIApplication().otherElements.textFields["Email"]
    let enterPasswordTextField =  XCUIApplication().otherElements.secureTextFields["Password"]
    let loginButton = XCUIApplication().buttons["LOGIN"]
    let passwordFieldLink =  XCUIApplication().buttons["Forgot Password?"]
    let failedLoginMessage = XCUIApplication().staticTexts["Login Failed"]
    let iconSttingButton = XCUIApplication().buttons["Icon SettingsCog"]
    let cancelButton = XCUIApplication().navigationBars["Reset Password"].buttons["Cancel"]
    let careHamburgerMenuButton = XCUIApplication().navigationBars["Care"].children(matching: .button).element(boundBy: 0)
    let dashboardHamburgerMenuButton = XCUIApplication().navigationBars["Dashboards"].children(matching: .button).element
    let notificationsHamburgerMenuButton = XCUIApplication().navigationBars["Notifications"].children(matching: .button).element
    let homePage = XCUIApplication().staticTexts["Home"]
    let logoutButton = XCUIApplication().tables/*@START_MENU_TOKEN@*/.staticTexts["Log Out"]/*[[".cells.staticTexts[\"Log Out\"]",".staticTexts[\"Log Out\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
    
    func validateLogin(username: String ,password: String) {
        enterEmailTextField.forceTapElement()
        enterEmailTextField.clearText()
        enterEmailTextField.typeText(username)
        enterPasswordTextField.forceTapElement()
        enterPasswordTextField.typeText(password)
        CustomWait.waitForElementToAppear(loginButton, timeoutInSec : 2)
        loginButton.tap()
    }
    
    func invalidLogin(username: String , password: String)  {
        enterEmailTextField.forceTapElement()
        enterEmailTextField.clearText()
        enterEmailTextField.typeText(username)
        enterPasswordTextField.forceTapElement()
        enterPasswordTextField.typeText(password)
    }
    
    func forgotPasswordlink() {
        CustomWait.waitForElementToAppear(passwordFieldLink, timeoutInSec: 5)
        passwordFieldLink.tap()
    }
    
    func gotoServerURL() {
        iconSttingButton.tap()
    }
    
    func tapHamburgerMenuButton(name: String) {
        if (name == "Care") {
            careHamburgerMenuButton.tap()
        }
        else if (name == "Dashboards") {
            dashboardHamburgerMenuButton.tap()
        }
        else {
            notificationsHamburgerMenuButton.tap()
        }
    }
}


