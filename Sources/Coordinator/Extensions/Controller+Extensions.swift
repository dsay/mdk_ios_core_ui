import Foundation

public extension CoordinatorController {
    
    init(with dependencies: Dependencies, _ input: Input, _ output: Output?) {
        self.init()
        self.dependencies = dependencies
        self.input = input
        self.output = output
    }
    
    func configure() {
        
    }
}
