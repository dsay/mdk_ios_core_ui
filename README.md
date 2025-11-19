# mdk_ios_core_ui

A Swift Package Manager library providing essential UI components and architectural patterns for iOS applications.

## Overview

`mdk_ios_core_ui` is a modular Swift package that provides two core libraries:
- **Coordinator**: A flexible coordinator pattern implementation for managing navigation and app flow
- **Alert**: A modern, fluent API for creating and presenting alerts and action sheets

## Requirements

- iOS 14.0+
- Swift 5.4+
- Xcode 12.0+

## Installation

### Swift Package Manager

Add `mdk_ios_core_ui` to your project using Swift Package Manager:

1. In Xcode, select **File > Add Packages...**
2. Enter the repository URL
3. Select the libraries you need: `Alert`, `Coordinator`, or both

Or add it to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/dsay/mdk_ios_core_ui.git", from: "1.0.0")
]
```

Then specify the products in your target dependencies:

```swift
.target(
    name: "YourTarget",
    dependencies: [
        .product(name: "Alert", package: "mdk_ios_core_ui"),
        .product(name: "Coordinator", package: "mdk_ios_core_ui"),
    ]
)
```

## Libraries

### Coordinator

A protocol-based coordinator pattern implementation for managing navigation flow in iOS applications. The package includes specialized coordinators for different container types.

#### Features

- **Protocol-based architecture**: Flexible and type-safe coordinator protocol
- **Multiple coordinator types**:
  - `WindowCoordinator`: Manages window-level navigation
  - `NavigationCoordinator`: Controls UINavigationController-based flows
  - `TabBarCoordinator`: Manages UITabBarController-based interfaces
  - `ViewControllerCoordinator`: Handles single view controller presentation
- **Child coordinator management**: Built-in support for coordinator hierarchy
- **Deep linking support**: Integrated deep link handling
- **Type-safe containers**: Generic container types ensure compile-time safety

#### Basic Usage

```swift
import Coordinator

// Define your coordinator
final class MainCoordinator: NavigationCoordinator {
    
    override func start() {
        let viewController = MainViewController()
        push(viewController, animated: false)
    }
    
    func showDetail() {
        let detailVC = DetailViewController()
        push(detailVC)
    }
}

// Use in your app
let navigationController = UINavigationController()
let coordinator = MainCoordinator(container: navigationController)
coordinator.start()
```

#### TabBarCoordinator Usage

```swift
final class AppTabBarCoordinator: TabBarCoordinator {
    
    override func start() {
        let homeNav = UINavigationController()
        let homeCoordinator = HomeCoordinator(container: homeNav)
        
        let profileNav = UINavigationController()
        let profileCoordinator = ProfileCoordinator(container: profileNav)
        
        set([homeCoordinator, profileCoordinator])
    }
}
```

#### WindowCoordinator Usage

```swift
final class AppCoordinator: WindowCoordinator {
    
    override func start() {
        // Setup root view controller
        let navigationController = UINavigationController()
        set(navigationController)
        
        // Start child coordinator
        let mainCoordinator = MainCoordinator(container: navigationController)
        addChild(mainCoordinator)
        mainCoordinator.start()
    }
}
```

### Alert

A modern, fluent API for creating and presenting UIKit alerts and action sheets with a chainable syntax.

#### Features

- **Fluent API**: Chainable methods for intuitive alert creation
- **Type-safe actions**: Predefined action types (Default, Cancel, Destructive)
- **Customizable**: Support for custom tint colors and configurations
- **Action handlers**: Index-based or individual action handlers
- **MainActor compliance**: Thread-safe UI operations

#### Basic Usage

```swift
import Alert

// Simple alert
Alert
    .alert(Alert.Configurator(title: "Hello", message: "Welcome!"))
    .action(.Default("OK"))
    .show(viewController)

// Action sheet with multiple actions
Alert
    .actionSheet(Alert.Configurator(title: "Choose an option"))
    .actions(["Option 1", "Option 2", "Option 3"])
    .sink { action, index in
        print("Selected option at index: \(index)")
    }
    .show(viewController)

// Alert with custom actions
Alert
    .alert(Alert.Configurator(title: "Delete Item", message: "Are you sure?"))
    .action(.Destructive("Delete")) {
        // Handle delete
    }
    .action(.Cancel("Cancel"))
    .show(viewController)
```

## Demo Application

The package includes a demo application showcasing the coordinator pattern implementation. See the `Demo/` directory for examples of:

- App-level coordinator setup
- Navigation coordinator implementation
- Tab bar coordinator usage
- Auth flow coordination
- Alert integration

## Architecture

### Coordinator Pattern

The coordinator pattern separates navigation logic from view controllers, making your code:
- **Testable**: Navigation logic can be tested independently
- **Reusable**: Coordinators can be composed and reused
- **Maintainable**: Clear separation of concerns
- **Flexible**: Easy to modify navigation flows

### Alert System

The alert system provides:
- **Declarative syntax**: Build alerts with a fluent, chainable API
- **Type safety**: Compile-time checking of action types
- **Flexibility**: Support for both simple and complex alert scenarios

## Testing

The package includes comprehensive unit tests:

```bash
swift test
```

Tests are located in:
- `Tests/CoordinatorTests/`
- `Tests/AlertTests/`

## License

This project is licensed under the Apache License 2.0 - see the [LICENSE](http://www.apache.org/licenses/LICENSE-2.0) file for details.

## Author

Dmitriy Sai 
