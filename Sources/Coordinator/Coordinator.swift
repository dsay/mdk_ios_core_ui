import UIKit

public protocol Coordinator: Hashable, AnyObject {
    
    typealias Completion = () -> Void
    
    associatedtype Сontainer: UIResponder
    
    var id: String { get set }
    var container: Сontainer { get set }
    var children: Set<AnyHashable> { get set }
    
    func start()
}

