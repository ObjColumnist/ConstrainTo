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
     
     @param attribute: NSLayoutAttribute that you want to constrain
     @param relation: NSLayoutRelation of the contraint defaulting to .Equal
     @param viewAttribute: NSLayoutAttribute that you want to constrain to
     @param view: The UIView that you want to constrain to
     @param multiplier: Multiplier of the constraint defaulting to 1.0
     @param offset: Offset of the constraint defaulting to 0.0
     
     @return NSLayoutConstraint: The layout constraint that was created
     */
    public func constrain(attribute: NSLayoutAttribute, being relation: NSLayoutRelation = .Equal, to viewAttribute: NSLayoutAttribute, of view: UIView, multipliedBy multiplier: CGFloat = 1.0, offsetBy offset: CGFloat = 0.0) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        let constraint = NSLayoutConstraint(item: self, attribute: attribute, relatedBy: relation, toItem: view, attribute: viewAttribute, multiplier: multiplier, constant: offset)
        constraint.active = true
        superview!.addConstraint(constraint)
        return constraint
    }
    
    /**
     Constrains an attribute to a constant
     
     @param attribute: NSLayoutAttribute that you want to constrain
     @param constant: The constant to constrain by
     
     @return NSLayoutConstraint: The layout constraint that was created
     */
    public func constrain(attribute: NSLayoutAttribute, to constant: CGFloat) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        let constraint = NSLayoutConstraint(item: self, attribute: attribute, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 0.0, constant: constant)
        constraint.active = true
        addConstraint(constraint)
        return constraint
    }
    
    /**
     Constrains to a size
     
     @param size: The size you want to constrain to
     
     @return (width: NSLayoutConstraint, height: NSLayoutConstraint): Tuple of the width and height layout constraints that were created
     */
    public func constrain(to size: CGSize) -> (width: NSLayoutConstraint, height: NSLayoutConstraint) {
        let width = constrain(.Width, to: size.width)
        let height = constrain(.Height, to: size.height)
        
        return (width, height)
    }
    
    /**
     Constrains frame to another view's frame
     
     @param view: The UIView that you want to constrain to (typically the superview)
     @param insets: UIEdgeInsets defaulting to UIEdgeInsetsZero
     
     @return (top: NSLayoutConstraint, left: NSLayoutConstraint, bottom: NSLayoutConstraint, right: NSLayoutConstraint): Tuple of the top, left, bottom and right layout constraints that were created
     */
    public func constrain(to view: UIView, insetBy insets: UIEdgeInsets = UIEdgeInsetsZero) -> (top: NSLayoutConstraint, left: NSLayoutConstraint, bottom: NSLayoutConstraint, right: NSLayoutConstraint) {
        let top = constrain(.Top, to: .Top, of: view, offsetBy: insets.top)
        let left = constrain(.Left, to: .Left, of: view, offsetBy: insets.left)
        let bottom = constrain(.Bottom, to: .Bottom, of: view, offsetBy: -insets.bottom)
        let right = constrain(.Right, to: .Right, of: view, offsetBy: -insets.right)
        
        return (top, left, bottom, right)
    }
    
    /**
     Constrains frame to another view's margins
     
     @param view: The UIView that you want to constrain to (typically the superview)
     @param insets: UIEdgeInsets defaulting to UIEdgeInsetsZero
     
     @return (topMargin: NSLayoutConstraint, leadingMargin: NSLayoutConstraint, bottomMargin: NSLayoutConstraint, trailingMargin: NSLayoutConstraint): Tuple of the top, left, bottom and right layout constraints that were created
     */
    public func constrain(toMarginsOf view: UIView, insetBy insets: UIEdgeInsets = UIEdgeInsetsZero) -> (topMargin: NSLayoutConstraint, leadingMargin: NSLayoutConstraint, bottomMargin: NSLayoutConstraint, trailingMargin: NSLayoutConstraint) {
        let topMargin = constrain(.TopMargin, to: .TopMargin, of: view, offsetBy: insets.top)
        let leadingMargin = constrain(.LeadingMargin, to: .LeadingMargin, of: view, offsetBy: insets.left)
        let bottomMargin = constrain(.BottomMargin, to: .BottomMargin, of: view, offsetBy: -insets.bottom)
        let trailingMargin = constrain(.TrailingMargin, to: .TrailingMargin, of: view, offsetBy: -insets.right)
        
        return (topMargin, leadingMargin, bottomMargin, trailingMargin)
    }
    
    /**
     Constrains to the center of a view
     
     @param view: The UIView that you want to constrain to (typically the superview)
     @param offsets: CGPoint defaulting to CGPoint.zero
     
     @return (horizontal: NSLayoutConstraint, vertical: NSLayoutConstraint): Tuple of the horizontal and vertical layout constraints that were created
     */
    public func constrain(toCenterOf view: UIView, offsetBy offsets: CGPoint = CGPoint.zero) -> (horizontal: NSLayoutConstraint, vertical: NSLayoutConstraint) {
        let horizontal = constrain(.CenterX, to: .CenterX, of: view, offsetBy: offsets.x)
        let vertical = constrain(.CenterY, to: .CenterY, of: view, offsetBy: offsets.y)
        
        return (horizontal, vertical)
    }
}
