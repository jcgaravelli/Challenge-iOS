//
//  UIView+Constraints.swift
//  StoneChallenge
//
//  Created by Júlio Garavelli on 26/06/23.
//

import UIKit

public extension UIView {

    func addSubviewOffsideSafeArea(_ view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(view)
        view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        view.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        view.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }

    func addSubviewInsideSafeArea(_ view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(view)
        view.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true
        view.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor).isActive = true
        view.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor).isActive = true
    }
    
    // MARK: - Top, Bottom, Leading, Trailing Superview
    
    @discardableResult
    func topToBottom(of element: UIView, relation: NSLayoutConstraint.Relation = .equal, multiplier: CGFloat = 1, priority: UILayoutPriority = .required, margin: CGFloat = 0.0, isActive: Bool = true) -> Self {
        let constraint = NSLayoutConstraint(item: self, attribute: .top, relatedBy: relation, toItem: element, attribute: .bottom, multiplier: multiplier, constant: margin)
        constraint.priority = priority
        constraint.isActive = isActive
        return self
    }

    @discardableResult
    func bottomToTop(of element: UIView, relation: NSLayoutConstraint.Relation = .equal, multiplier: CGFloat = 1, priority: UILayoutPriority = .required, margin: CGFloat = 0.0, isActive: Bool = true) -> Self {
        let constraint = NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: relation, toItem: element, attribute: .top, multiplier: multiplier, constant: -margin)
        constraint.priority = priority
        constraint.isActive = isActive
        return self
    }

    @discardableResult
    func topToSuperview(_ margin: CGFloat = 0.0, relation: NSLayoutConstraint.Relation = .equal, multiplier: CGFloat = 1, priority: UILayoutPriority = .required, toSafeArea: Bool = false, isActive: Bool = true) -> Self {
        guard let superview = self.superview else { return self }
        let anchor = toSafeArea ? superview.safeAreaLayoutGuide : superview
        let constraint = NSLayoutConstraint(item: self, attribute: .top, relatedBy: relation, toItem: anchor, attribute: .top, multiplier: multiplier, constant: margin)
        constraint.priority = priority
        constraint.isActive = isActive
        return self
    }

    @discardableResult
    func bottomToSuperview(_ margin: CGFloat = 0.0, relation: NSLayoutConstraint.Relation = .equal, multiplier: CGFloat = 1, priority: UILayoutPriority = .required, toSafeArea: Bool = false, isActive: Bool = true) -> Self {
        guard let superview = self.superview else { return self }
        let anchor = toSafeArea ? superview.safeAreaLayoutGuide : superview
        let constraint = NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: relation, toItem: anchor, attribute: .bottom, multiplier: multiplier, constant: -margin)
        constraint.priority = priority
        constraint.isActive = isActive
        return self
    }

    @discardableResult
    func leadingToSuperview(_ margin: CGFloat = 0.0, relation: NSLayoutConstraint.Relation = .equal, multiplier: CGFloat = 1, priority: UILayoutPriority = .required, toSafeArea: Bool = false, isActive: Bool = true) -> Self {
        guard let superview = self.superview else { return self }
        let anchor = toSafeArea ? superview.safeAreaLayoutGuide : superview
        let constraint = NSLayoutConstraint(item: self, attribute: .leading, relatedBy: relation, toItem: anchor, attribute: .leading, multiplier: multiplier, constant: margin)
        constraint.priority = priority
        constraint.isActive = isActive
        return self
    }

    @discardableResult
    func trailingToSuperview(_ margin: CGFloat = 0.0, relation: NSLayoutConstraint.Relation = .equal, multiplier: CGFloat = 1, priority: UILayoutPriority = .required, toSafeArea: Bool = false, isActive: Bool = true) -> Self {
        guard let superview = self.superview else { return self }
        let anchor = toSafeArea ? superview.safeAreaLayoutGuide : superview
        let constraint = NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: relation, toItem: anchor, attribute: .trailing, multiplier: multiplier, constant: -margin)
        constraint.priority = priority
        constraint.isActive = isActive
        return self
    }
    
    @discardableResult
    func verticalToSuperview(_ margin: CGFloat = 0.0, relation: NSLayoutConstraint.Relation = .equal, multiplier: CGFloat = 1, priority: UILayoutPriority = .required, toSafeArea: Bool = false, isActive: Bool = true) -> Self {
        topToSuperview(margin, relation: relation, multiplier: multiplier, priority: priority, toSafeArea: toSafeArea, isActive: isActive)
        bottomToSuperview(margin, relation: relation, multiplier: multiplier, priority: priority, toSafeArea: toSafeArea, isActive: isActive)
        return self
    }

    @discardableResult
    func horizontalToSuperview(_ margin: CGFloat = 0.0, relation: NSLayoutConstraint.Relation = .equal, multiplier: CGFloat = 1, priority: UILayoutPriority = .required, toSafeArea: Bool = false, isActive: Bool = true) -> Self {
        leadingToSuperview(margin, relation: relation, multiplier: multiplier, priority: priority, toSafeArea: toSafeArea, isActive: isActive)
        trailingToSuperview(margin, relation: relation, multiplier: multiplier, priority: priority, toSafeArea: toSafeArea, isActive: isActive)
        return self
    }
}

public extension UIView {
    /// Set translatesAutoresizingMaskIntoConstraints into false automatically while adding the subviews
    @discardableResult
    func addSubviews(_ views: [UIView]) -> Self {
        for view in views {
            view.autoResizingOff()
            addSubview(view)
        }
        return self
    }

    @discardableResult
    func autoResizingOff() -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        return self
    }
}
