
import Foundation
import XCTest

class ConfigurationScreen {
    
    let careNotificationPopupAllow = XCUIApplication().staticTexts["“Care” Would Like to Send You Notifications"]
    let careNotificationPopupAllowButton = XCUIApplication().alerts["“Care” Would Like to Send You Notifications"].scrollViews.otherElements.buttons["Allow"]
    let serverUrlFieldlink =  XCUIApplication().buttons["Enter custom company URL"]
    let customUrlField =  XCUIApplication().otherElements.textFields["Custom company URL"]
    let defaultUrlFieldlink = XCUIApplication().buttons["Enter default company URL"]
    let defalutUrlTextField =  XCUIApplication().otherElements.textFields["company.response.lithium.com"]
    let continueField = XCUIApplication().buttons["CONTINUE"]
    
    func careNotificationAlertPopup() {
        careNotificationPopupAllow.tap()
        careNotificationPopupAllowButton.tap()
    }
    
    func settingCustomServerUrl(_ serverurl: String) {
        serverUrlFieldlink.tap()
        customUrlField.tap()
        customUrlField.typeText(serverurl)
        continueField.tap()
    }
    
    func settingDefalutServerUrl(_ serverurl: String) {
        defaultUrlFieldlink.tap()
        defalutUrlTextField.tap()
        defalutUrlTextField.typeText(serverurl)
        continueField.tap()
    }
}

