
import Foundation
import XCTest

class GenericLibrary {
    
    
    static func randomString(length: Int) -> String {
        
        let letters : NSString = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let len = UInt32(letters.length)
        var randomString = ""
        for _ in 0 ..< length {
            let rand = arc4random_uniform(len)
            var nextChar = letters.character(at: Int(rand))
            randomString += NSString(characters: &nextChar, length: 1) as String
        }
        return randomString
    }
    
    static func deleteApp(appName: String) {
        
//        Code used for iOS 13
//        let springboard = XCUIApplication(bundleIdentifier: "com.apple.springboard")
//        XCUIApplication().terminate()
//        springboard.activate()
//        let icon = springboard.icons[appName]
//        if icon.exists {
//            let iconFrame = icon.frame
//            let springboardFrame = springboard.frame
//            icon.press(forDuration: 1.3)
//            springboard.coordinate(withNormalizedOffset: CGVector(dx: (iconFrame.minX + 3 * UIScreen.main.scale) / springboardFrame.maxX, dy: (iconFrame.minY + 3 * UIScreen.main.scale) / springboardFrame.maxY)).tap()
//            sleep(1)
//            springboard.alerts.buttons["Remove App"].tap()
//            XCUIDevice.shared.press(.home)
//        }
        
//      Code used for iOS 14
//      Put the app in the background
        
        let springboard = XCUIApplication(bundleIdentifier: "com.apple.springboard")
                XCUIApplication().terminate()
                springboard.activate()

        if springboard.icons[appName].waitForExistence(timeout: 5) {
            springboard.icons[appName].press(forDuration: 1.5);
        }

        if springboard.collectionViews.buttons["Remove App"].waitForExistence(timeout: 5) {
            springboard.collectionViews.buttons["Remove App"].tap()
        }

        if springboard.alerts["Remove “\(appName)”?"].scrollViews.otherElements.buttons["Delete App"].waitForExistence(timeout: 5) {
            springboard.alerts["Remove “\(appName)”?"].scrollViews.otherElements.buttons["Delete App"].tap()
        }

        if springboard.alerts["Delete “\(appName)”?"].scrollViews.otherElements.buttons["Delete"].waitForExistence(timeout: 5) {
            springboard.alerts["Delete “\(appName)”?"].scrollViews.otherElements.buttons["Delete"].tap()
        }
    }
    
    static func appReset() {
        let loginScreen = LoginScreen()
        let home =  HomeScreen()
        let configurationScreen = ConfigurationScreen()
        if home.splashView.exists {
            CustomWait.waitForElementToAppear(home.navigationBarsButton, timeoutInSec: 10)
            home.logout()
            loginScreen.validateLogin(username: Constants.usernameAdmin, password: Constants.passwordAdmin)
        }
        else if configurationScreen.serverUrlFieldlink.exists {
            configurationScreen.settingCustomServerUrl(Constants.customURL)
            CustomWait.waitForElementToAppear(loginScreen.enterEmailTextField, timeoutInSec: 2)
            loginScreen.validateLogin(username: Constants.usernameAdmin, password: Constants.passwordAdmin)
        }
        else if loginScreen.enterEmailTextField.exists {
            loginScreen.validateLogin(username: Constants.usernameAdmin, password: Constants.passwordAdmin)
        }
    }    
}
