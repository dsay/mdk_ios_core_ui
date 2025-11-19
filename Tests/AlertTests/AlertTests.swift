import XCTest
@testable import Alert

@MainActor
extension Alert.Action {
    static var cancel: Cancel = .init("Cancel")
    static var `default`: Default = .init("Default")
    static var destructive: Destructive = .init("Destructive")
}

@MainActor
extension Alert.Configurator {
    static var config: Alert.Configurator = .init(title: "Title", message: "Message", tintColor: .red)
    static var emptyConfig: Alert.Configurator = .init()
}

@MainActor
final class AlertTests: XCTestCase {
    
    // MARK: - Configurator Tests
    
    func testConfiguratorInitialization() {
        let config = Alert.Configurator(title: "Test Title", message: "Test Message", tintColor: .blue)
        
        XCTAssertEqual(config.title, "Test Title")
        XCTAssertEqual(config.message, "Test Message")
        XCTAssertEqual(config.tintColor, .blue)
    }
    
    func testConfiguratorWithNilValues() {
        let config = Alert.Configurator()
        
        XCTAssertNil(config.title)
        XCTAssertNil(config.message)
        XCTAssertNil(config.tintColor)
    }
    
    func testConfiguratorPartialInitialization() {
        let config = Alert.Configurator(title: "Only Title")
        
        XCTAssertEqual(config.title, "Only Title")
        XCTAssertNil(config.message)
        XCTAssertNil(config.tintColor)
    }
    
    // MARK: - Action Tests
    
    func testDefaultAction() {
        let action = Alert.Action.Default("Test Action")
        
        XCTAssertEqual(action.title, "Test Action")
        XCTAssertEqual(action.style, .default)
    }
    
    func testDefaultActionWithNilTitle() {
        let action = Alert.Action.Default()
        
        XCTAssertNil(action.title)
        XCTAssertEqual(action.style, .default)
    }
    
    func testCancelAction() {
        let action = Alert.Action.Cancel("Cancel Action")
        
        XCTAssertEqual(action.title, "Cancel Action")
        XCTAssertEqual(action.style, .cancel)
    }
    
    func testCancelActionWithNilTitle() {
        let action = Alert.Action.Cancel()
        
        XCTAssertNil(action.title)
        XCTAssertEqual(action.style, .cancel)
    }
    
    func testDestructiveAction() {
        let action = Alert.Action.Destructive("Delete")
        
        XCTAssertEqual(action.title, "Delete")
        XCTAssertEqual(action.style, .destructive)
    }
    
    func testDestructiveActionWithNilTitle() {
        let action = Alert.Action.Destructive()
        
        XCTAssertNil(action.title)
        XCTAssertEqual(action.style, .destructive)
    }
    
    // MARK: - Alert Creation Tests
    
    func testAlertCreation() {
        let config = Alert.Configurator(title: "Alert Title", message: "Alert Message", tintColor: .red)
        let alert = Alert.alert(config)
        
        XCTAssertEqual(alert.alertController.title, "Alert Title")
        XCTAssertEqual(alert.alertController.message, "Alert Message")
        XCTAssertEqual(alert.alertController.preferredStyle, .alert)
        XCTAssertEqual(alert.alertController.view.tintColor, .red)
    }
    
    func testAlertCreationWithEmptyConfig() {
        let config = Alert.Configurator()
        let alert = Alert.alert(config)
        
        XCTAssertNil(alert.alertController.title)
        XCTAssertNil(alert.alertController.message)
        XCTAssertEqual(alert.alertController.preferredStyle, .alert)
    }
    
    func testActionSheetCreation() {
        let config = Alert.Configurator(title: "Action Sheet", message: "Choose Option", tintColor: .blue)
        let alert = Alert.actionSheet(config)
        
        XCTAssertEqual(alert.alertController.title, "Action Sheet")
        XCTAssertEqual(alert.alertController.message, "Choose Option")
        XCTAssertEqual(alert.alertController.preferredStyle, .actionSheet)
        XCTAssertEqual(alert.alertController.view.tintColor, .blue)
    }
    
    func testActionSheetCreationWithEmptyConfig() {
        let config = Alert.Configurator()
        let alert = Alert.actionSheet(config)
        
        XCTAssertNil(alert.alertController.title)
        XCTAssertNil(alert.alertController.message)
        XCTAssertEqual(alert.alertController.preferredStyle, .actionSheet)
    }
    
    // MARK: - Action Addition Tests
    
    func testAddingSingleDefaultAction() {
        let alert = Alert.alert(.config).action(.Default("OK"))
        
        XCTAssertEqual(alert.alertController.actions.count, 1)
        
        if let action = alert.alertController.actions.first {
            XCTAssertEqual(action.title, "OK")
            XCTAssertEqual(action.style, .default)
        } else {
            XCTFail("Action should exist")
        }
    }
    
    func testAddingSingleCancelAction() {
        let alert = Alert.alert(.config).action(.Cancel("Cancel"))
        
        XCTAssertEqual(alert.alertController.actions.count, 1)
        
        if let action = alert.alertController.actions.first {
            XCTAssertEqual(action.title, "Cancel")
            XCTAssertEqual(action.style, .cancel)
        } else {
            XCTFail("Action should exist")
        }
    }
    
    func testAddingSingleDestructiveAction() {
        let alert = Alert.alert(.config).action(.Destructive("Delete"))
        
        XCTAssertEqual(alert.alertController.actions.count, 1)
        
        if let action = alert.alertController.actions.first {
            XCTAssertEqual(action.title, "Delete")
            XCTAssertEqual(action.style, .destructive)
        } else {
            XCTFail("Action should exist")
        }
    }
    
    func testAddingMultipleActions() {
        let alert = Alert.alert(.config)
            .action(.Default("Option 1"))
            .action(.Default("Option 2"))
            .action(.Cancel("Cancel"))
        
        XCTAssertEqual(alert.alertController.actions.count, 3)
        XCTAssertEqual(alert.alertController.actions[0].title, "Option 1")
        XCTAssertEqual(alert.alertController.actions[1].title, "Option 2")
        XCTAssertEqual(alert.alertController.actions[2].title, "Cancel")
    }
    
    func testAddingActionsArray() {
        let alert = Alert.alert(.config)
            .actions([.Default("Action 1"), .Default("Action 2"), .Destructive("Delete")])
        
        XCTAssertEqual(alert.alertController.actions.count, 3)
        XCTAssertEqual(alert.alertController.actions[0].title, "Action 1")
        XCTAssertEqual(alert.alertController.actions[0].style, .default)
        XCTAssertEqual(alert.alertController.actions[1].title, "Action 2")
        XCTAssertEqual(alert.alertController.actions[1].style, .default)
        XCTAssertEqual(alert.alertController.actions[2].title, "Delete")
        XCTAssertEqual(alert.alertController.actions[2].style, .destructive)
    }
    
    func testAddingStringActionsArray() {
        let alert = Alert.alert(.config)
            .actions(["Option 1", "Option 2", "Option 3"])
        
        XCTAssertEqual(alert.alertController.actions.count, 3)
        XCTAssertEqual(alert.alertController.actions[0].title, "Option 1")
        XCTAssertEqual(alert.alertController.actions[1].title, "Option 2")
        XCTAssertEqual(alert.alertController.actions[2].title, "Option 3")
        
        // All should be default style
        alert.alertController.actions.forEach { action in
            XCTAssertEqual(action.style, .default)
        }
    }
    
    // MARK: - Chaining Tests
    
    func testFluentAPIChainingForAlert() {
        let alert = Alert
            .alert(.config)
            .action(.Default("Save"))
            .action(.Destructive("Delete"))
            .action(.Cancel("Cancel"))
        
        XCTAssertEqual(alert.alertController.preferredStyle, .alert)
        XCTAssertEqual(alert.alertController.actions.count, 3)
    }
    
    func testFluentAPIChainingForActionSheet() {
        let alert = Alert
            .actionSheet(.config)
            .actions(["Option 1", "Option 2"])
            .action(.Cancel("Cancel"))
        
        XCTAssertEqual(alert.alertController.preferredStyle, .actionSheet)
        XCTAssertEqual(alert.alertController.actions.count, 3)
    }
    
    func testComplexChaining() {
        let alert = Alert
            .alert(Alert.Configurator(title: "Complex", message: "Test", tintColor: .green))
            .actions(["A", "B", "C"])
            .action(.Destructive("Delete"))
            .action(.Cancel("Cancel"))
        
        XCTAssertEqual(alert.alertController.actions.count, 5)
        XCTAssertEqual(alert.alertController.title, "Complex")
        XCTAssertEqual(alert.alertController.message, "Test")
        XCTAssertEqual(alert.alertController.view.tintColor, .green)
    }
    
    // MARK: - Integration Tests
    
    func testCompleteAlertWorkflow() {
        let config = Alert.Configurator(title: "Delete Item", message: "Are you sure?", tintColor: .systemRed)
        var actionCalled = false
        
        let alert = Alert
            .alert(config)
            .action(.Destructive("Delete")) {
                actionCalled = true
            }
            .action(.Cancel("Cancel"))
        
        XCTAssertEqual(alert.alertController.title, "Delete Item")
        XCTAssertEqual(alert.alertController.message, "Are you sure?")
        XCTAssertEqual(alert.alertController.actions.count, 2)
        XCTAssertEqual(alert.alertController.actions[0].style, .destructive)
        XCTAssertEqual(alert.alertController.actions[1].style, .cancel)
    }
    
    func testCompleteActionSheetWorkflow() {
        let config = Alert.Configurator(title: "Choose Action")
        var selectedIndex: Int?
        
        let alert = Alert
            .actionSheet(config)
            .actions(["Edit", "Share", "Copy"])
            .action(.Destructive("Delete"))
            .action(.Cancel("Cancel"))
            .sink { _, index in
                selectedIndex = index
            }
        
        XCTAssertEqual(alert.alertController.title, "Choose Action")
        XCTAssertEqual(alert.alertController.actions.count, 5)
        XCTAssertNotNil(alert.handler)
    }
    
    func testAlertWithMixedActions() {
        let alert = Alert
            .alert(.config)
            .actions([.Default("Action 1")])
            .actions(["Action 2", "Action 3"])
            .action(.Destructive("Dangerous"))
            .action(.Cancel("Dismiss"))
        
        XCTAssertEqual(alert.alertController.actions.count, 5)
        
        // Verify order and styles
        XCTAssertEqual(alert.alertController.actions[0].style, .default)
        XCTAssertEqual(alert.alertController.actions[1].style, .default)
        XCTAssertEqual(alert.alertController.actions[2].style, .default)
        XCTAssertEqual(alert.alertController.actions[3].style, .destructive)
        XCTAssertEqual(alert.alertController.actions[4].style, .cancel)
    }
}
