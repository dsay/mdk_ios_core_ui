import UIKit

/// A horizontal scroll view that stretches content vertically and allows scrolling only horizontally
class HorizontalScrollView: UIScrollView {
    
    // MARK: - Properties
    
    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .equalSpacing
        stack.spacing = 8
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    // MARK: - Setup
    
    private func setupView() {
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            // Content height equals scroll view height (no vertical scrolling)
            stackView.heightAnchor.constraint(equalTo: heightAnchor)
        ])
        
        // Disable vertical scrolling
        showsVerticalScrollIndicator = false
        showsHorizontalScrollIndicator = true
        alwaysBounceVertical = false
        alwaysBounceHorizontal = true
    }
    
    // MARK: - Public Methods
    
    /// Adds multiple arranged views to the stack view
    /// - Parameter views: Array of UIView instances to add
    func addArrangedViews(_ views: [UIView]) {
        views.forEach { view in
            stackView.addArrangedSubview(view)
        }
    }
    
    /// Adds a single arranged view to the stack view
    /// - Parameter view: UIView instance to add
    func addArrangedView(_ view: UIView) {
        stackView.addArrangedSubview(view)
    }
    
    /// Removes all arranged views from the stack view
    func deleteArrangedViews() {
        stackView.arrangedSubviews.forEach { view in
            stackView.removeArrangedSubview(view)
            view.removeFromSuperview()
        }
    }
    
    /// Removes a specific arranged view from the stack view
    /// - Parameter view: UIView instance to remove
    func deleteArrangedView(_ view: UIView) {
        stackView.removeArrangedSubview(view)
        view.removeFromSuperview()
    }
    
    // MARK: - Configuration
    
    /// Configure stack view spacing
    /// - Parameter spacing: Spacing between arranged subviews
    func setSpacing(_ spacing: CGFloat) {
        stackView.spacing = spacing
    }
    
    /// Configure stack view distribution
    /// - Parameter distribution: Distribution type for arranged subviews
    func setDistribution(_ distribution: UIStackView.Distribution) {
        stackView.distribution = distribution
    }
    
    /// Configure stack view alignment
    /// - Parameter alignment: Alignment for arranged subviews
    func setAlignment(_ alignment: UIStackView.Alignment) {
        stackView.alignment = alignment
    }
    
    /// Configure stack view padding
    /// - Parameter padding: Space for arranged subviews
    func setPadding(top: CGFloat = 0,
                    left: CGFloat = 0,
                    bottom: CGFloat = 0,
                    right: CGFloat = 0)
    {
        stackView.layoutMargins = UIEdgeInsets(top: top,
                                               left: left,
                                               bottom: bottom,
                                               right: right)
        stackView.isLayoutMarginsRelativeArrangement = true
    }
}
