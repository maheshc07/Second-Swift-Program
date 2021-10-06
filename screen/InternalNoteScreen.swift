
import Foundation
import XCTest
class InternalNoteScreen {
    let internalNoteButton = XCUIApplication().buttons["Note"]
    let cancelButton = XCUIApplication().navigationBars.buttons["Cancel"]
    let internalNoteTextField = XCUIApplication().textViews["internal_note_field"]
    let doneButton = XCUIApplication().buttons["Done"]
    let internalNoteAlertCancelButton = XCUIApplication().alerts["Internal Note can't be empty"].buttons["Cancel"]
    let internalNotePage = XCUIApplication().staticTexts["Internal Note"]
    
    func tappingOnInternalNote(){
        CustomWait.waitForElementToAppear(internalNoteButton, timeoutInSec: 2)
        internalNoteButton.tap()
    }
    
    func cancelInternalNoteScreen(){
        cancelButton.tap()
    }
    
    func savingInternalNote(internalNoteText: String) {
        internalNoteTextField.typeText(internalNoteText)
        doneButton.tap()
    }
    
    func addingEmptyInternalNote() {
        doneButton.tap()
    }
    
    func dismissEmptyInternalNote() {
        internalNoteAlertCancelButton.tap()
    }
    
}
