import Foundation

public protocol CoordinatorController {
    
    associatedtype Input
    associatedtype Output
    associatedtype Dependencies
    
    var input: Input! { get set }
    var output: Output? { get set }
     
    var dependencies: Dependencies! { get set }
    
    init()
    init(with dependencies: Dependencies, _ input: Input, _ output: Output?)
    
    func configure()
}
