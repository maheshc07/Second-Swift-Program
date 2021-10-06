
import Foundation
import XCTest

class AgentStateTest: XCTestCase {
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
        GenericLibrary.appReset()
    }
    
    override func tearDown() {
        super.tearDown()
        app.terminate()
        GenericLibrary.deleteApp(appName: "Care")
        self.app = nil
    }
    
    func testAvailableAgentStateStatus() {
        let loginScreen = LoginScreen()
        let agentStateScreen = AgentStateScreen()
        CustomWait.waitForElementToAppear(loginScreen.homePage, timeoutInSec: 15)
        loginScreen.tapHamburgerMenuButton(name: "Care")
        XCTAssertTrue(agentStateScreen.availableStatus.exists)
        agentStateScreen.gotoAvailable()
        CustomWait.waitForElementToAppear(agentStateScreen.availableStatus, timeoutInSec: 5)
        XCTAssertTrue(agentStateScreen.availableStatus.exists)
        CustomWait.waitForElementToAppear(loginScreen.logoutButton, timeoutInSec: 5)
        loginScreen.logoutButton.tap()
    }
    
    func testCoffeeAgentStateStatus() {
        let loginScreen = LoginScreen()
        let agentStateScreen = AgentStateScreen()
        CustomWait.waitForElementToAppear(loginScreen.homePage, timeoutInSec: 15)
        loginScreen.tapHamburgerMenuButton(name: "Care")
        agentStateScreen.gotoCoffee()
        CustomWait.waitForElementToAppear(agentStateScreen.responseButton, timeoutInSec: 5)
        agentStateScreen.responseButton.forceTapElement()
        CustomWait.waitForElementToAppear(agentStateScreen.coffeePageStatus, timeoutInSec: 5)
        XCTAssertTrue(agentStateScreen.coffeePageStatus.exists)
        loginScreen.tapHamburgerMenuButton(name: "Care")
        agentStateScreen.gotoAvailable()
        CustomWait.waitForElementToAppear(loginScreen.logoutButton, timeoutInSec: 5)
        loginScreen.logoutButton.tap()
    }   
    
    func testDinnerAgentStateStatus() {
        let loginScreen = LoginScreen()
        let agentStateScreen = AgentStateScreen()
        CustomWait.waitForElementToAppear(loginScreen.homePage, timeoutInSec: 15)
        loginScreen.tapHamburgerMenuButton(name: "Care")
        agentStateScreen.gotoDinner()
        XCTAssertTrue(agentStateScreen.dinnerStatus.exists)
        CustomWait.waitForElementToAppear(agentStateScreen.returnToAvailable, timeoutInSec: 5)
        agentStateScreen.returnToAvailable.tap()
        loginScreen.tapHamburgerMenuButton(name: "Care")
        CustomWait.waitForElementToAppear(loginScreen.logoutButton, timeoutInSec: 5)
        loginScreen.logoutButton.tap()
    }
    
    func testCoffeetoAvailableAgentStateStatus() {
        let loginScreen = LoginScreen()
        let agentStateScreen = AgentStateScreen()
        CustomWait.waitForElementToAppear(loginScreen.homePage, timeoutInSec: 15)
        loginScreen.tapHamburgerMenuButton(name: "Care")
        agentStateScreen.gotoCoffee()
        CustomWait.waitForElementToAppear(agentStateScreen.responseButton, timeoutInSec: 5)
        agentStateScreen.responseButton.forceTapElement()
        CustomWait.waitForElementToAppear(agentStateScreen.coffeePageStatus, timeoutInSec: 5)
        XCTAssertTrue(agentStateScreen.coffeePageStatus.exists)
        loginScreen.tapHamburgerMenuButton(name: "Care")
        agentStateScreen.gotoAvailable()
        XCTAssertTrue(agentStateScreen.availableStatus.exists)
        CustomWait.waitForElementToAppear(loginScreen.logoutButton, timeoutInSec: 5)
        loginScreen.logoutButton.tap()
    }
    
    func testDinnerToAvailableAgentStateStatus() {
        let loginScreen = LoginScreen()
        let agentStateScreen = AgentStateScreen()
        CustomWait.waitForElementToAppear(loginScreen.homePage, timeoutInSec: 15)
        loginScreen.tapHamburgerMenuButton(name: "Care")
        agentStateScreen.gotoDinner()
        XCTAssertTrue(agentStateScreen.dinnerStatus.exists)
        agentStateScreen.returnToAvailable.tap()
        loginScreen.tapHamburgerMenuButton(name: "Care")
        CustomWait.waitForElementToAppear(agentStateScreen.availableStatus, timeoutInSec: 5)
        XCTAssertTrue(agentStateScreen.availableStatus.exists)
        CustomWait.waitForElementToAppear(loginScreen.logoutButton, timeoutInSec: 5)
        loginScreen.logoutButton.tap()
    }
    
    func testCoffeetoDinnerAgentStateStatus() {
        let loginScreen = LoginScreen()
        let agentStateScreen = AgentStateScreen()
        CustomWait.waitForElementToAppear(loginScreen.homePage, timeoutInSec: 15)
        loginScreen.tapHamburgerMenuButton(name: "Care")
        agentStateScreen.gotoCoffee()
        CustomWait.waitForElementToAppear(agentStateScreen.responseButton, timeoutInSec: 5)
        agentStateScreen.responseButton.forceTapElement()
        CustomWait.waitForElementToAppear(agentStateScreen.coffeePageStatus, timeoutInSec: 5)
        XCTAssertTrue(agentStateScreen.coffeePageStatus.exists)
        loginScreen.tapHamburgerMenuButton(name: "Care")
        agentStateScreen.gotoDinner()
        XCTAssertTrue(agentStateScreen.dinnerStatus.exists)
        agentStateScreen.returnToAvailable.tap()
        loginScreen.tapHamburgerMenuButton(name: "Care")
        CustomWait.waitForElementToAppear(agentStateScreen.availableStatus, timeoutInSec: 5)
        XCTAssertTrue(agentStateScreen.availableStatus.exists)
        CustomWait.waitForElementToAppear(loginScreen.logoutButton, timeoutInSec: 5)
        loginScreen.logoutButton.tap()
    }
    
    func testChangeAgentStateStatusCancel() {
        let loginScreen = LoginScreen()
        let agentStateScreen = AgentStateScreen()
        CustomWait.waitForElementToAppear(loginScreen.homePage, timeoutInSec: 15)
        loginScreen.tapHamburgerMenuButton(name: "Care")
        agentStateScreen.availableStatus.tap()
        agentStateScreen.cancelButton.tap()
        agentStateScreen.responseButton.tap()
        XCTAssertTrue(agentStateScreen.homePage.exists)
        loginScreen.tapHamburgerMenuButton(name: "Care")
        CustomWait.waitForElementToAppear(loginScreen.logoutButton, timeoutInSec: 5)
        loginScreen.logoutButton.tap()
    }
    
    func testAgentStateStatusinAssignedtoMe() {
        let loginScreen = LoginScreen()
        let agentStateScreen = AgentStateScreen()
        CustomWait.waitForElementToAppear(loginScreen.homePage, timeoutInSec: 15)
        loginScreen.tapHamburgerMenuButton(name: "Care")
        agentStateScreen.gotoCoffee()
        CustomWait.waitForElementToAppear(agentStateScreen.responseButton, timeoutInSec: 10)
        agentStateScreen.responseButton.tap()
        CustomWait.waitForElementToAppear(agentStateScreen.assignedToMeButton, timeoutInSec: 5)
        agentStateScreen.assignedToMeButton.tap()
        XCTAssertTrue(agentStateScreen.coffeePageStatus.exists)
        agentStateScreen.backButton.tap()
        loginScreen.tapHamburgerMenuButton(name: "Care")
        agentStateScreen.gotoAvailable()
        loginScreen.logoutButton.tap()
    }
    
    func testAgentStateStatusinNeedsAttention() {
        let loginScreen = LoginScreen()
        let agentStateScreen = AgentStateScreen()
        CustomWait.waitForElementToAppear(loginScreen.homePage, timeoutInSec: 15)
        loginScreen.tapHamburgerMenuButton(name: "Care")
        agentStateScreen.gotoCoffee()
        CustomWait.waitForElementToAppear(agentStateScreen.responseButton, timeoutInSec: 10)
        agentStateScreen.responseButton.forceTapElement()
        CustomWait.waitForElementToAppear(agentStateScreen.needsAttentionButton, timeoutInSec: 5)
        agentStateScreen.needsAttentionButton.tap()
        XCTAssertTrue(agentStateScreen.coffeePageStatus.exists)
        agentStateScreen.backButton.tap()
        loginScreen.tapHamburgerMenuButton(name: "Care")
        agentStateScreen.gotoAvailable()
        loginScreen.logoutButton.tap()
    }
    
    func testAgentStateStatusinPending() {
        let loginScreen = LoginScreen()
        let agentStateScreen = AgentStateScreen()
        CustomWait.waitForElementToAppear(loginScreen.homePage, timeoutInSec: 15)
        loginScreen.tapHamburgerMenuButton(name: "Care")
        agentStateScreen.gotoCoffee()
        CustomWait.waitForElementToAppear(agentStateScreen.responseButton, timeoutInSec: 10)
        agentStateScreen.responseButton.tap()
        CustomWait.waitForElementToAppear(agentStateScreen.pendingButton, timeoutInSec: 5)
        agentStateScreen.pendingButton.tap()
        XCTAssertTrue(agentStateScreen.coffeePageStatus.exists)
        agentStateScreen.backButton.tap()
        loginScreen.tapHamburgerMenuButton(name: "Care")
        agentStateScreen.gotoAvailable()
        loginScreen.logoutButton.tap()
    }
    
    func testAgentStateStatusinNeedsApproval() {
        let loginScreen = LoginScreen()
        let agentStateScreen = AgentStateScreen()
        CustomWait.waitForElementToAppear(loginScreen.homePage, timeoutInSec: 15)
        loginScreen.tapHamburgerMenuButton(name: "Care")
        agentStateScreen.gotoCoffee()
        CustomWait.waitForElementToAppear(agentStateScreen.responseButton, timeoutInSec: 10)
        agentStateScreen.responseButton.tap()
        CustomWait.waitForElementToAppear(agentStateScreen.needsApprovalButton, timeoutInSec: 5)
        agentStateScreen.needsApprovalButton.tap()
        XCTAssertTrue(agentStateScreen.coffeePageStatus.exists)
        agentStateScreen.backButton.tap()
        loginScreen.tapHamburgerMenuButton(name: "Care")
        agentStateScreen.gotoAvailable()
        loginScreen.logoutButton.tap()
    }
    
    func testAgentStateStatusinWatching() {
        let loginScreen = LoginScreen()
        let agentStateScreen = AgentStateScreen()
        CustomWait.waitForElementToAppear(loginScreen.homePage, timeoutInSec: 15)
        loginScreen.tapHamburgerMenuButton(name: "Care")
        agentStateScreen.gotoCoffee()
        CustomWait.waitForElementToAppear(agentStateScreen.responseButton, timeoutInSec: 10)
        agentStateScreen.responseButton.tap()
        CustomWait.waitForElementToAppear(agentStateScreen.watchingButton, timeoutInSec: 5)
        agentStateScreen.watchingButton.tap()
        XCTAssertTrue(agentStateScreen.coffeePageStatus.exists)
        agentStateScreen.backButton.tap()
        loginScreen.tapHamburgerMenuButton(name: "Care")
        agentStateScreen.gotoAvailable()
        loginScreen.logoutButton.tap()
    }
    
    func testAgentStateStatusinSmartViewPage()
    {
        let loginScreen = LoginScreen()
        let agentStateScreen = AgentStateScreen()
        CustomWait.waitForElementToAppear(loginScreen.homePage, timeoutInSec: 15)
        loginScreen.tapHamburgerMenuButton(name: "Care")
        agentStateScreen.gotoCoffee()
        CustomWait.waitForElementToAppear(agentStateScreen.responseButton, timeoutInSec: 15)
        agentStateScreen.responseButton.tap()
        CustomWait.waitForElementToAppear(agentStateScreen.smartViewTabButton, timeoutInSec: 10)
        agentStateScreen.smartViewTabButton.tap()
        XCTAssertTrue(agentStateScreen.coffeePageStatus.exists)
        agentStateScreen.smartViewButton.tap()
        XCTAssertTrue(agentStateScreen.coffeePageStatus.exists)
        agentStateScreen.backButton.tap()
        loginScreen.tapHamburgerMenuButton(name: "Care")
        agentStateScreen.gotoAvailable()
        loginScreen.logoutButton.tap()
    }
    
    func testAgentStateStatusinWorkQueuePage() {
        let loginScreen = LoginScreen()
        let agentStateScreen = AgentStateScreen()
        CustomWait.waitForElementToAppear(loginScreen.homePage, timeoutInSec: 25)
        loginScreen.tapHamburgerMenuButton(name: "Care")
        agentStateScreen.gotoCoffee()
        CustomWait.waitForElementToAppear(agentStateScreen.responseButton, timeoutInSec: 15)
        agentStateScreen.responseButton.forceTapElement()
        CustomWait.waitForElementToAppear(agentStateScreen.workQueueTabButton, timeoutInSec: 10)
        agentStateScreen.workQueueTabButton.tap()
        XCTAssertTrue(agentStateScreen.coffeePageStatus.exists)
        agentStateScreen.defaultWorkQueueButton.tap()
        XCTAssertTrue(agentStateScreen.coffeePageStatus.exists)
        agentStateScreen.backButton.tap()
        loginScreen.tapHamburgerMenuButton(name: "Care")
        agentStateScreen.gotoAvailable()
        loginScreen.logoutButton.tap()
    }
    
    func testAgentStateStatusinDashboardPage() {
        let loginScreen = LoginScreen()
        let agentStateScreen = AgentStateScreen()
        CustomWait.waitForElementToAppear(loginScreen.homePage, timeoutInSec: 15)
        loginScreen.tapHamburgerMenuButton(name: "Care")
        agentStateScreen.gotoCoffee()
        CustomWait.waitForElementToAppear(agentStateScreen.dashboardButton, timeoutInSec: 10)
        agentStateScreen.dashboardButton.tap()
        CustomWait.waitForElementToAppear(agentStateScreen.coffeePageStatus, timeoutInSec: 5)
        XCTAssertTrue(agentStateScreen.coffeePageStatus.exists)
        agentStateScreen.myDashboardButton.tap()
        XCTAssertTrue(agentStateScreen.coffeePageStatus.exists)
        agentStateScreen.backButton.tap()
        loginScreen.tapHamburgerMenuButton(name: "Dashboards")
        agentStateScreen.gotoAvailable()
        loginScreen.logoutButton.tap()
    }
    
    func testAgentStateStatusinNotificationSettings() {
        let loginScreen = LoginScreen()
        let agentStateScreen = AgentStateScreen()
        CustomWait.waitForElementToAppear(loginScreen.homePage, timeoutInSec: 15)
        loginScreen.tapHamburgerMenuButton(name: "Care")
        agentStateScreen.gotoCoffee()
        CustomWait.waitForElementToAppear(agentStateScreen.notificationSettingsButton, timeoutInSec: 5)
        agentStateScreen.notificationSettingsButton.tap()
        CustomWait.waitForElementToAppear(agentStateScreen.coffeePageStatus, timeoutInSec: 5)
        XCTAssert(agentStateScreen.coffeePageStatus.exists)
        loginScreen.tapHamburgerMenuButton(name: "Notifications")
        agentStateScreen.gotoAvailable()
        loginScreen.logoutButton.tap()
    }
    
    func testAgentStateStatusinConversationUnderAssignedToMe() {
        let loginScreen = LoginScreen()
        let agentStateScreen = AgentStateScreen()
        CustomWait.waitForElementToAppear(loginScreen.homePage, timeoutInSec: 15)
        loginScreen.tapHamburgerMenuButton(name: "Care")
        agentStateScreen.gotoCoffee()
        CustomWait.waitForElementToAppear(agentStateScreen.responseButton, timeoutInSec: 10)
        agentStateScreen.responseButton.tap()
        agentStateScreen.gotoConversationUnderAssignedToMe()
        XCTAssertTrue(agentStateScreen.coffeePageStatus.exists)
        agentStateScreen.backButton.tap()
        agentStateScreen.backButton.tap()
        loginScreen.tapHamburgerMenuButton(name: "Care")
        agentStateScreen.gotoAvailable()
        loginScreen.logoutButton.tap()
    }
    
    func testAgentStateStatusinConversationUnderPending() {
        let loginScreen = LoginScreen()
        let agentStateScreen = AgentStateScreen()
        CustomWait.waitForElementToAppear(loginScreen.homePage, timeoutInSec: 15)
        loginScreen.tapHamburgerMenuButton(name: "Care")
        agentStateScreen.gotoCoffee()
        CustomWait.waitForElementToAppear(agentStateScreen.responseButton, timeoutInSec: 10)
        agentStateScreen.responseButton.tap()
        agentStateScreen.gotoConversationUnderPending()
        XCTAssertTrue(agentStateScreen.coffeePageStatus.exists)
        agentStateScreen.backButton.tap()
        agentStateScreen.backButton.tap()
        loginScreen.tapHamburgerMenuButton(name: "Care")
        agentStateScreen.gotoAvailable()
        loginScreen.logoutButton.tap()
    }
    
    func testAgentStateStatusinConversationUnderNeedsApproval() {
        let loginScreen = LoginScreen()
        let agentStateScreen = AgentStateScreen()
        CustomWait.waitForElementToAppear(loginScreen.homePage, timeoutInSec: 15)
        loginScreen.tapHamburgerMenuButton(name: "Care")
        agentStateScreen.gotoCoffee()
        CustomWait.waitForElementToAppear(agentStateScreen.responseButton, timeoutInSec: 10)
        agentStateScreen.responseButton.tap()
        agentStateScreen.gotoConversationUnderNeedsApproval()
        XCTAssertTrue(agentStateScreen.coffeePageStatus.exists)
        agentStateScreen.backButton.tap()
        agentStateScreen.backButton.tap()
        loginScreen.tapHamburgerMenuButton(name: "Care")
        agentStateScreen.gotoAvailable()
        loginScreen.logoutButton.tap()
    }
    
    func testAgentStateStatusinConversationUnderWatching() {
        let loginScreen = LoginScreen()
        let agentStateScreen = AgentStateScreen()
        CustomWait.waitForElementToAppear(loginScreen.homePage, timeoutInSec: 15)
        loginScreen.tapHamburgerMenuButton(name: "Care")
        agentStateScreen.gotoCoffee()
        CustomWait.waitForElementToAppear(agentStateScreen.responseButton, timeoutInSec: 10)
        agentStateScreen.responseButton.tap()
        agentStateScreen.gotoConversationUnderWatching()
        XCTAssertTrue(agentStateScreen.coffeePageStatus.exists)
        agentStateScreen.backButton.tap()
        agentStateScreen.backButton.tap()
        loginScreen.tapHamburgerMenuButton(name: "Care")
        agentStateScreen.gotoAvailable()
        loginScreen.logoutButton.tap()
    }
}
