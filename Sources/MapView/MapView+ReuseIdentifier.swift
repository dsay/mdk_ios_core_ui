import MapKit

public extension MKMapView {
    
    func register<T: MapReuseIdentifier>(_ class: T.Type) {
        let identifier = T.identifier
        register(T.self, forAnnotationViewWithReuseIdentifier: identifier)
    }
    
    func dequeueReusable<T: MapReuseIdentifier>() -> T {
        guard let view = dequeueReusableAnnotationView(withIdentifier: T.identifier) as? T else {
            fatalError("\(T.self) not found")
        }
        return view
    }
}

public protocol MapReuseIdentifier: AnyObject {
    
    static var identifier: String { get }
}

public extension MapReuseIdentifier where Self: UIView {

    static var identifier: String {
        let type = String(describing: self)
        return type
    }
}

public extension MKMapView {

    open func setCenterCoordinate(_ centerCoordinate: CLLocationCoordinate2D,
                                  withZoomRadius regionRadius: Double,
                                  animated: Bool = true) {

        let coordinateRegion = MKCoordinateRegion(center: centerCoordinate,
                                                  latitudinalMeters: regionRadius * 2.0,
                                                  longitudinalMeters: regionRadius * 2.0)
        setRegion(coordinateRegion, animated: animated)
    }
    
    open func updateUserLocation() {
        showsUserLocation = false
        showsUserLocation = true
    }

    open func reloadAnnotations(_ newAnnotations: [MKAnnotation]) {
        removeAnnotations(self.annotations)
        addAnnotations(newAnnotations)
    }
    
    func fitAll(in coordinates: [CLLocationCoordinate2D]) {
        guard coordinates.count > 1 else {
            coordinates.first.flatMap { setCenterCoordinate($0, withZoomRadius: Constant.Game.zoomLevel) }
            return
        }
        
        var zoomRect: MKMapRect  = MKMapRect.null

        for coordinate in coordinates {
            let aPoint = MKMapPoint(coordinate)
            let rect = MKMapRect(x: aPoint.x, y: aPoint.y, width: 1.1, height: 1.1)

            if zoomRect.isNull {
                zoomRect = rect
            } else {
                zoomRect = zoomRect.union(rect)
            }
        }
    
        setVisibleMapRect(zoomRect,
                          edgePadding: UIEdgeInsets(top: 100, left: 100, bottom: 100, right: 100),
                          animated: true)
    }
}
