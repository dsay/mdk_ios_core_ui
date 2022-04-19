import Foundation

open class DeepLink: NSObject {
    
    public override init() {
        
    }
}

@objc public protocol DeepLinkSubscriber {
     
     @discardableResult
     func open(deepLink: DeepLink?) -> Bool
}

open class DeepLinkContainer {
    
    typealias Subscriber = DeepLinkSubscriber

    public var deepLink: DeepLink? {
        didSet {
            invoke()
        }
    }
    
    private let subscribers: NSHashTable<Subscriber> = .weakObjects()
    
    public init() {
        
    }
    
    func add(subscriber: Subscriber) {
        subscribers.add(subscriber)
        
        tryOpen(deepLink: deepLink, subscriber: subscriber)
    }
    
    func remove(subscriber: Subscriber) {
        subscribers.remove(subscriber)
    }
    
    func invoke() {
        guard let deepLink = deepLink else { return }
        
        for subscriber in subscribers.allObjects.reversed() {
            if tryOpen(deepLink: deepLink, subscriber: subscriber) {
                return
            }
        }
    }
    
    @discardableResult
    private func tryOpen(deepLink: DeepLink?, subscriber: Subscriber) -> Bool {
        if subscriber.open(deepLink: deepLink) {
            self.deepLink = nil
            return true
        } else {
            return false
        }
    }
}

public func += (left: DeepLinkContainer, right: DeepLinkSubscriber) {
    left.add(subscriber: right)
}

public func -= (left: DeepLinkContainer, right: DeepLinkSubscriber) {
    left.remove(subscriber: right)
}
