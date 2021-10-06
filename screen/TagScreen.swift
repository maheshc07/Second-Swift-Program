
import XCTest

class TagScreen {
    let searchOrAddTagsSearchField  = XCUIApplication().searchFields["Search or add tags"]
    let doneButton = XCUIApplication().buttons["PostTagsViewControllerDoneButton"]
    let tagNode = XCUIApplication().tables.cells.containing(.staticText, identifier:"America").buttons["Triangle"]
    let tagAdd = XCUIApplication().tables.staticTexts["mobileTag"]
    let tagCountAdd = XCUIApplication().tables.staticTexts["3"]
    let tagCountRemove = XCUIApplication().tables.staticTexts["2"]
    let cancelTags = XCUIApplication().buttons["Cancel"]
    let saveButton = XCUIApplication().buttons["Save"]
    
    func searchTag() {
        searchOrAddTagsSearchField.tap()
    }
    
    func searchTagWithText(text: String) {
        searchOrAddTagsSearchField.tap()
        searchOrAddTagsSearchField.typeText(text)
    }
    
    func addTag() {
        tagNode.tap()
        tagAdd.tap()
        CustomWait.waitForElementToAppear(doneButton, timeoutInSec: 3)
        doneButton.tap()
    }
    
    func saveTag() {
        saveButton.tap()
    }
    
    func cancelTag() {
        cancelTags.tap()
    }
    
    func removeTag() {
        tagAdd.tap()
        saveButton.tap()
    }
    
    func cancelSearch() {
        cancelTags.tap()
    }
}
