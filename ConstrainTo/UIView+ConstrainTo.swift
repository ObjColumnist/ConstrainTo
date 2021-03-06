//
//  UIView+ConstrainTo.swift
//  ConstrainTo
//
//  Created by Spencer MacDonald on 30/05/2016.
//  Copyright © 2016 Square Bracket Software. All rights reserved.
//

import UIKit


/// Extension to `UIView` for the `ConstrainTo` API.
public extension UIView {
    /// Constrains an attribute to the attribute of another view.
    ///
    /// - parameter attribute: `NSLayoutConstraint.Attribute` that you want to constrain.
    /// - parameter relation: `NSLayoutConstraint.Relation` of the contraint defaulting to `.equal`.
    /// - parameter viewAttribute: `NSLayoutConstraint.Attribute` that you want to constrain to.
    /// - parameter view: The `UIView` that you want to constrain to.
    /// - parameter multiplier: Multiplier of the constraint defaulting to `1.0`.
    /// - parameter offset: Offset of the constraint defaulting to `0.0`.
    /// - parameter activate: Whether to activate the constraint defaulting to `true`.
    /// - parameter priority: `UILayoutPriority` defaulting to `.required`.
    ///
    /// - returns: The `NSLayoutConstraint` that was created.
    @discardableResult func constrain(_ attribute: NSLayoutConstraint.Attribute, being relation: NSLayoutConstraint.Relation = .equal, to viewAttribute: NSLayoutConstraint.Attribute, of view: UIView, multipliedBy multiplier: CGFloat = 1.0, offsetBy offset: CGFloat = 0.0, activate: Bool = true, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        let constraint = NSLayoutConstraint(item: self, attribute: attribute, relatedBy: relation, toItem: view, attribute: viewAttribute, multiplier: multiplier, constant: offset)
        constraint.priority = priority
        constraint.isActive = activate
        superview!.addConstraint(constraint)
        return constraint
    }
    
    /// Constrains an attribute to a constant.
    ///
    /// - parameter attribute: `NSLayoutConstraint.Attribute` that you want to constrain.
    /// - parameter relation: `NSLayoutConstraint.Relation` of the contraint defaulting to `.equal`.
    /// - parameter constant: The constant to constrain by.
    /// - parameter activate: Whether to activate the constraint defaulting to `true`.
    /// - parameter priority: `UILayoutPriority` defaulting to `.required`.
    ///
    /// - returns: The `NSLayoutConstraint` that was created.
    @discardableResult func constrain(_ attribute: NSLayoutConstraint.Attribute, being relation: NSLayoutConstraint.Relation = .equal, to constant: CGFloat, activate: Bool = true, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        let constraint = NSLayoutConstraint(item: self, attribute: attribute, relatedBy: relation, toItem: nil, attribute: .notAnAttribute, multiplier: 0.0, constant: constant)
        constraint.priority = priority
        constraint.isActive = activate
        addConstraint(constraint)
        return constraint
    }
    
    /// Constrains an attribute to the same attribute of another view.
    ///
    /// - parameter attribute: `NSLayoutConstraint.Attribute` that you want to constrain.
    /// - parameter view: The `UIView` that you want to constrain to.
    /// - parameter multiplier: Multiplier of the constraint defaulting to `1.0`.
    /// - parameter offset: Offset of the constraint defaulting to `0.0`.
    ///
    /// - returns: The `NSLayoutConstraint` that was created.
    @discardableResult func constrain(to attribute: NSLayoutConstraint.Attribute, of view: UIView, multipliedBy multiplier: CGFloat = 1.0, offsetBy offset: CGFloat = 0.0) -> NSLayoutConstraint {
        return constrain(attribute, being: .equal, to: attribute, of: view, multipliedBy: multiplier, offsetBy: offset)
    }
    
    /// Constrains view to a size.
    ///
    /// - parameter size: The `CGSize` you want to constrain to.
    ///
    /// - returns: The `(widthConstraint: NSLayoutConstraint, heightConstraint: NSLayoutConstraint)` tuple of the constraints that were created.
    @discardableResult func constrain(to size: CGSize) -> (widthConstraint: NSLayoutConstraint, heightConstraint: NSLayoutConstraint) {
        let widthConstraint = constrain(.width, to: size.width)
        let heightConstraint = constrain(.height, to: size.height)
        
        return (widthConstraint, heightConstraint)
    }
    
    /// Constrains frame to another view's frame.
    ///
    /// - parameter view: The `UIView` that you want to constrain to (typically the superview).
    /// - parameter insets: `UIEdgeInsets` defaulting to `.zero`.
    ///
    /// - returns: The `(topConstraint: NSLayoutConstraint, leftConstraint: NSLayoutConstraint, bottomConstraint: NSLayoutConstraint, rightConstraint: NSLayoutConstraint)` tuple of the constraints that were created.
    @discardableResult func constrain(to view: UIView, insetBy insets: UIEdgeInsets = UIEdgeInsets.zero) -> (topConstraint: NSLayoutConstraint, leftConstraint: NSLayoutConstraint, bottomConstraint: NSLayoutConstraint, rightConstraint: NSLayoutConstraint) {
        let topConstraint = constrain(.top, to: .top, of: view, offsetBy: insets.top)
        let leftConstraint = constrain(.left, to: .left, of: view, offsetBy: insets.left)
        let bottomConstraint = constrain(.bottom, to: .bottom, of: view, offsetBy: -insets.bottom)
        let rightConstraint = constrain(.right, to: .right, of: view, offsetBy: -insets.right)
        
        return (topConstraint, leftConstraint, bottomConstraint, rightConstraint)
    }
    
    /// Constrains edges to another view's edges.
    ///
    /// - parameter view: The `UIView` that you want to constrain to (typically the superview).
    /// - parameter insets: `UIEdgeInsets` defaulting to `.zero`.
    ///
    /// - returns: The `(topConstraint: NSLayoutConstraint, leadingConstraint: NSLayoutConstraint, bottomConstraint: NSLayoutConstraint, trailingConstraint: NSLayoutConstraint)` tuple of the constraints that were created.
    @discardableResult func constrain(toEdgesOf view: UIView, insetBy insets: UIEdgeInsets = .zero) -> (topConstraint: NSLayoutConstraint, leadingConstraint: NSLayoutConstraint, bottomConstraint: NSLayoutConstraint, trailingConstraint: NSLayoutConstraint) {
        let topConstraint = constrain(.top, to: .top, of: view, offsetBy: insets.top)
        let leadingConstraint = constrain(.leading, to: .leading, of: view, offsetBy: insets.left)
        let bottomConstraint = constrain(.bottom, to: .bottom, of: view, offsetBy: -insets.bottom)
        let trailingConstraint = constrain(.trailing, to: .trailing, of: view, offsetBy: -insets.right)
        
        return (topConstraint, leadingConstraint, bottomConstraint, trailingConstraint)
    }
    
    /// Constrains margins to another view's margins.
    ///
    /// - parameter view: The `UIView` that you want to constrain to (typically the superview).
    /// - parameter insets: `UIEdgeInsets `defaulting to `.zero`.
    ///
    /// - returns: The `(topMarginConstraint: NSLayoutConstraint, leadingMarginConstraint: NSLayoutConstraint, bottomMarginConstraint: NSLayoutConstraint, trailingMarginConstraint: NSLayoutConstraint)` tuple of the constraints that were created.
    @discardableResult func constrain(toMarginsOf view: UIView, insetBy insets: UIEdgeInsets = .zero) -> (topMarginConstraint: NSLayoutConstraint, leadingMarginConstraint: NSLayoutConstraint, bottomMarginConstraint: NSLayoutConstraint, trailingMarginConstraint: NSLayoutConstraint) {
        let topMarginConstraint = constrain(.topMargin, to: .topMargin, of: view, offsetBy: insets.top)
        let leadingMarginConstraint = constrain(.leadingMargin, to: .leadingMargin, of: view, offsetBy: insets.left)
        let bottomMarginConstraint = constrain(.bottomMargin, to: .bottomMargin, of: view, offsetBy: -insets.bottom)
        let trailingMarginConstraint = constrain(.trailingMargin, to: .trailingMargin, of: view, offsetBy: -insets.right)
        
        return (topMarginConstraint, leadingMarginConstraint, bottomMarginConstraint, trailingMarginConstraint)
    }
    

    /// Constrains to the center of a view.
    ///
    /// - parameter view: The `UIView` that you want to constrain to (typically the superview).
    /// - parameter offsets: `CGPoint` defaulting to `.zero`
    ///
    /// - returns: The `(xConstraint: NSLayoutConstraint, yConstraint: NSLayoutConstraint)` tuple of the constraints that were created.
    @discardableResult func constrain(toCenterOf view: UIView, offsetBy offsets: CGPoint = .zero) -> (xConstraint: NSLayoutConstraint, yConstraint: NSLayoutConstraint) {
        let xConstraint = constrain(.centerX, to: .centerX, of: view, offsetBy: offsets.x)
        let yConstraint = constrain(.centerY, to: .centerY, of: view, offsetBy: offsets.y)
        
        return (xConstraint, yConstraint)
    }
    
    /// Constrain to the size of a view.
    ///
    /// - parameter view: The `UIView` that you want to constrain to (typically the superview).
    ///
    /// - returns: The `(widthConstraint: NSLayoutConstraint, heightConstraint: NSLayoutConstraint)` tuple of the constraints that were created.
    @discardableResult func constrain(toSizeOf view: UIView) -> (widthConstraint: NSLayoutConstraint, heightConstraint: NSLayoutConstraint) {
        let widthConstraint = constrain(.width, to: .width, of: view)
        let heightConstraint = constrain(.height, to: .height, of: view)
        
        return (widthConstraint, heightConstraint)
    }
}
