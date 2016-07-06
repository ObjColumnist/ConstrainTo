//
//  UIView+ConstrainTo.swift
//  ConstrainTo
//
//  Created by Spencer MacDonald on 30/05/2016.
//  Copyright © 2016 Square Bracket Software. All rights reserved.
//

import UIKit

/**
 Extension to UIView for ConstrainTo API
 */
public extension UIView {
    /**
     Constrains an attribute to the attribute of another view
     
     - parameters:
         - attribute: `NSLayoutAttribute` that you want to constrain
         - relation: `NSLayoutRelation` of the contraint defaulting to .Equal
         - viewAttribute: `NSLayoutAttribute` that you want to constrain to
         - view: The `UIView` that you want to constrain to
         - multiplier: Multiplier of the constraint defaulting to 1.0
         - offset: Offset of the constraint defaulting to 0.0
         - priority: constraint priority defaulting to UILayoutPriorityRequired
     
     - returns: 
        NSLayoutConstraint: The layout constraint that was created
     */
    public func constrain(attribute: NSLayoutAttribute, being relation: NSLayoutRelation = .Equal, to viewAttribute: NSLayoutAttribute, of view: UIView, multipliedBy multiplier: CGFloat = 1.0, offsetBy offset: CGFloat = 0.0, priority: Float = UILayoutPriorityRequired) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        let constraint = NSLayoutConstraint(item: self, attribute: attribute, relatedBy: relation, toItem: view, attribute: viewAttribute, multiplier: multiplier, constant: offset)
        constraint.priority = priority
        constraint.active = true
        superview!.addConstraint(constraint)
        return constraint
    }
    
    /**
     Constrains an attribute to a constant
     
     - parameters:
         - attribute: `NSLayoutAttribute` that you want to constrain
         - relation: `NSLayoutRelation` of the contraint defaulting to .Equal
         - constant: The constant to constrain by
         - priority: constraint priority defaulting to UILayoutPriorityRequired
     
     - returns:
        NSLayoutConstraint: The layout constraint that was created
     */
    public func constrain(attribute: NSLayoutAttribute, being relation: NSLayoutRelation = .Equal, to constant: CGFloat, priority: Float = UILayoutPriorityRequired) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        let constraint = NSLayoutConstraint(item: self, attribute: attribute, relatedBy: relation, toItem: nil, attribute: .NotAnAttribute, multiplier: 0.0, constant: constant)
        constraint.priority = priority
        constraint.active = true
        addConstraint(constraint)
        return constraint
    }
    
    /**
     Constrains to a size
     
     - parameters:
         - size: The size you want to constrain to
     
     - returns:
        (widthConstraint: NSLayoutConstraint, heightConstraint: NSLayoutConstraint): Tuple of the width and height layout constraints that were created
     */
    public func constrain(to size: CGSize) -> (widthConstraint: NSLayoutConstraint, heightConstraint: NSLayoutConstraint) {
        let widthConstraint = constrain(.Width, to: size.width)
        let heightConstraint = constrain(.Height, to: size.height)
        
        return (widthConstraint, heightConstraint)
    }
    
    /**
     Constrains frame to another view's frame
     
     - parameters:
         - view: The `UIView` that you want to constrain to (typically the superview)
         - insets: UIEdgeInsets defaulting to `UIEdgeInsetsZero`
     
     - returns:
        (topConstraint: NSLayoutConstraint, leftConstraint: NSLayoutConstraint, bottomConstraint: NSLayoutConstraint, rightConstraint: NSLayoutConstraint): Tuple of the top, left, bottom and right layout constraints that were created
     */
    public func constrain(to view: UIView, insetBy insets: UIEdgeInsets = UIEdgeInsetsZero) -> (topConstraint: NSLayoutConstraint, leftConstraint: NSLayoutConstraint, bottomConstraint: NSLayoutConstraint, rightConstraint: NSLayoutConstraint) {
        let topConstraint = constrain(.Top, to: .Top, of: view, offsetBy: insets.top)
        let leftConstraint = constrain(.Left, to: .Left, of: view, offsetBy: insets.left)
        let bottomConstraint = constrain(.Bottom, to: .Bottom, of: view, offsetBy: -insets.bottom)
        let rightConstraint = constrain(.Right, to: .Right, of: view, offsetBy: -insets.right)
        
        return (topConstraint, leftConstraint, bottomConstraint, rightConstraint)
    }
    
    /**
     Constrains edges to another view's edges
     
     - parameters:
     - view: The `UIView` that you want to constrain to (typically the superview)
     - insets: UIEdgeInsets defaulting to `UIEdgeInsetsZero`
     
     - returns:
     (topConstraint: NSLayoutConstraint, leadingConstraint: NSLayoutConstraint, bottomConstraint: NSLayoutConstraint, trailingConstraint: NSLayoutConstraint): Tuple of the top, leading, bottom and trailing layout constraints that were created
     */
    public func constrain(toEdgesOf view: UIView, insetBy insets: UIEdgeInsets = UIEdgeInsetsZero) -> (topConstraint: NSLayoutConstraint, leadingConstraint: NSLayoutConstraint, bottomConstraint: NSLayoutConstraint, trailingConstraint: NSLayoutConstraint) {
        let topConstraint = constrain(.Top, to: .Top, of: view, offsetBy: insets.top)
        let leadingConstraint = constrain(.Leading, to: .Leading, of: view, offsetBy: insets.left)
        let bottomConstraint = constrain(.Bottom, to: .Bottom, of: view, offsetBy: -insets.bottom)
        let trailingConstraint = constrain(.Trailing, to: .Trailing, of: view, offsetBy: -insets.right)
        
        return (topConstraint, leadingConstraint, bottomConstraint, trailingConstraint)
    }
    
    /**
     Constrains margins to another view's margins
     
     - parameters:
         - view: The `UIView` that you want to constrain to (typically the superview)
         - insets: UIEdgeInsets defaulting to `UIEdgeInsetsZero`
     
     - returns:
        (topMarginConstraint: NSLayoutConstraint, leadingMarginConstraint: NSLayoutConstraint, bottomMarginConstraint: NSLayoutConstraint, trailingMarginConstraint: NSLayoutConstraint): Tuple of the top, left, bottom and right layout constraints that were created
     */
    public func constrain(toMarginsOf view: UIView, insetBy insets: UIEdgeInsets = UIEdgeInsetsZero) -> (topMarginConstraint: NSLayoutConstraint, leadingMarginConstraint: NSLayoutConstraint, bottomMarginConstraint: NSLayoutConstraint, trailingMarginConstraint: NSLayoutConstraint) {
        let topMarginConstraint = constrain(.TopMargin, to: .TopMargin, of: view, offsetBy: insets.top)
        let leadingMarginConstraint = constrain(.LeadingMargin, to: .LeadingMargin, of: view, offsetBy: insets.left)
        let bottomMarginConstraint = constrain(.BottomMargin, to: .BottomMargin, of: view, offsetBy: -insets.bottom)
        let trailingMarginConstraint = constrain(.TrailingMargin, to: .TrailingMargin, of: view, offsetBy: -insets.right)
        
        return (topMarginConstraint, leadingMarginConstraint, bottomMarginConstraint, trailingMarginConstraint)
    }
    
    /**
     Constrains to the center of a view
     
     - parameters:
         - view: The `UIView` that you want to constrain to (typically the superview)
         - offsets: `CGPoint` defaulting to CGPoint.zero
     
     - returns:
        (xConstraint: NSLayoutConstraint, y: NSLayoutConstraint): Tuple of the x and y layout constraints that were created
     */
    public func constrain(toCenterOf view: UIView, offsetBy offsets: CGPoint = CGPoint.zero) -> (xConstraint: NSLayoutConstraint, yConstraint: NSLayoutConstraint) {
        let xConstraint = constrain(.CenterX, to: .CenterX, of: view, offsetBy: offsets.x)
        let yConstraint = constrain(.CenterY, to: .CenterY, of: view, offsetBy: offsets.y)
        
        return (xConstraint, yConstraint)
    }
    
    /**
     Constrain to the size of a view
     
     - parameters:
     - view: The `UIView` that you want to constrain to (typically the superview)
     
     - returns:
     (widthConstraint: NSLayoutConstraint, heightConstraint: NSLayoutConstraint): Tuple of the width and height layout constraints that were created
     */
    public func constrain(toSizeOf view: UIView) -> (widthConstraint: NSLayoutConstraint, heightConstraint: NSLayoutConstraint) {
        let widthConstraint = constrain(.Width, to: .Width, of: view)
        let heightConstraint = constrain(.Height, to: .Height, of: view)
        
        return (widthConstraint, heightConstraint)
    }
    
}
