import UIKit

public protocol Coordinator: Hashable, DeepLinkSubscriber {
    
    associatedtype Сontainer: UIResponder
    associatedtype Controller = CoordinatorController

    var id: String! { get set }
    var container: Сontainer! { get set }
    var controller: Controller! { get set }
    var children: Set<AnyHashable>! { get set }
    var deepLinkContainer: DeepLinkContainer! { get set}

    init()
    init(with container: Сontainer, _ controller: Controller, _ deepLinkContainer: DeepLinkContainer)

    func start()
}
