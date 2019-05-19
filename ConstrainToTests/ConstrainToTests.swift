//
//  ConstrainToTests.swift
//  ConstrainToTests
//
//  Created by Spencer MacDonald on 30/05/2016.
//  Copyright © 2016 Square Bracket Software. All rights reserved.
//

import XCTest
@testable import ConstrainTo

class ConstrainToTests: XCTestCase {
    
    func testConstrainToAttributeOfView() {
        let rootView = UIView(frame: CGRect.zero)
        let firstView = UIView(frame: CGRect.zero)
        rootView.addSubview(firstView)
        
        let constraint = firstView.constrain(to: .leading, of: rootView)
        XCTAssertTrue(constraint.isActive)
        XCTAssertEqual(constraint.firstItem as? UIView, firstView)
        XCTAssertEqual(constraint.firstAttribute, NSLayoutConstraint.Attribute.leading)
        XCTAssertEqual(constraint.relation, NSLayoutConstraint.Relation.equal)
        XCTAssertEqual(constraint.secondItem as? UIView, rootView)
        XCTAssertEqual(constraint.secondAttribute, NSLayoutConstraint.Attribute .leading)
        XCTAssertEqual(constraint.multiplier, 1)
        XCTAssertEqual(constraint.constant, 0)
        XCTAssertEqual(constraint.priority, UILayoutPriority.required)
    }
    
    func testConstrainWidth() {
        let width: CGFloat = 25
        
        let rootView = UIView(frame: CGRect.zero)
        let firstView = UIView(frame: CGRect.zero)
        rootView.addSubview(firstView)
        
        let constraint = firstView.constrain(.width, to: width)
        
        XCTAssertTrue(constraint.isActive)
        XCTAssertEqual(constraint.firstItem as? UIView, firstView)
        XCTAssertEqual(constraint.firstAttribute, NSLayoutConstraint.Attribute .width)
        XCTAssertEqual(constraint.relation, NSLayoutConstraint.Relation.equal)
        XCTAssertNil(constraint.secondItem)
        XCTAssertEqual(constraint.secondAttribute, NSLayoutConstraint.Attribute .notAnAttribute)
        XCTAssertEqual(constraint.multiplier, 1)
        XCTAssertEqual(constraint.constant, width)
        XCTAssertEqual(constraint.priority, UILayoutPriority.required)
    }
    
    func testConstrainWidthWithHighPriority() {
        let width: CGFloat = 25
        let priority: UILayoutPriority = UILayoutPriority.defaultHigh
        
        let rootView = UIView(frame: CGRect.zero)
        let firstView = UIView(frame: CGRect.zero)
        rootView.addSubview(firstView)
        
        let constraint = firstView.constrain(.width, to: width, priority: priority)
        
        XCTAssertTrue(constraint.isActive)
        XCTAssertEqual(constraint.firstItem as? UIView, firstView)
        XCTAssertEqual(constraint.firstAttribute, NSLayoutConstraint.Attribute .width)
        XCTAssertEqual(constraint.relation, NSLayoutConstraint.Relation.equal)
        XCTAssertNil(constraint.secondItem)
        XCTAssertEqual(constraint.secondAttribute, NSLayoutConstraint.Attribute .notAnAttribute)
        XCTAssertEqual(constraint.multiplier, 1)
        XCTAssertEqual(constraint.constant, width)
        XCTAssertEqual(constraint.priority, priority)
    }
  
    func testConstrainToSize() {
        let width: CGFloat = 25
        let height: CGFloat = 25

        let rootView = UIView(frame: CGRect.zero)
        let firstView = UIView(frame: CGRect.zero)
        rootView.addSubview(firstView)
        
        let (widthConstraint, heightConstraint) = firstView.constrain(to: CGSize(width: width, height: height))
        
        XCTAssertTrue(widthConstraint.isActive)
        XCTAssertEqual(widthConstraint.firstItem as? UIView, firstView)
        XCTAssertEqual(widthConstraint.firstAttribute, NSLayoutConstraint.Attribute .width)
        XCTAssertEqual(widthConstraint.relation, NSLayoutConstraint.Relation.equal)
        XCTAssertNil(widthConstraint.secondItem)
        XCTAssertEqual(widthConstraint.secondAttribute, NSLayoutConstraint.Attribute .notAnAttribute)
        XCTAssertEqual(widthConstraint.multiplier, 1)
        XCTAssertEqual(widthConstraint.constant, width)
        XCTAssertEqual(widthConstraint.priority, UILayoutPriority.required)
        
        XCTAssertTrue(heightConstraint.isActive)
        XCTAssertEqual(heightConstraint.firstItem as? UIView, firstView)
        XCTAssertEqual(heightConstraint.firstAttribute, NSLayoutConstraint.Attribute .height)
        XCTAssertEqual(heightConstraint.relation, NSLayoutConstraint.Relation.equal)
        XCTAssertNil(heightConstraint.secondItem)
        XCTAssertEqual(heightConstraint.secondAttribute, NSLayoutConstraint.Attribute .notAnAttribute)
        XCTAssertEqual(heightConstraint.multiplier, 1)
        XCTAssertEqual(heightConstraint.constant, height)
        XCTAssertEqual(heightConstraint.priority, UILayoutPriority.required)
    }
    
    func testConstrainToView() {
        let rootView = UIView(frame: CGRect.zero)
        let firstView = UIView(frame: CGRect.zero)
        rootView.addSubview(firstView)
        
        let (topConstraint, leftConstraint, bottomConstraint, rightConstraint) = firstView.constrain(to: rootView)
        
        XCTAssertTrue(topConstraint.isActive)
        XCTAssertEqual(topConstraint.firstItem as? UIView, firstView)
        XCTAssertEqual(topConstraint.firstAttribute, NSLayoutConstraint.Attribute .top)
        XCTAssertEqual(topConstraint.relation, NSLayoutConstraint.Relation.equal)
        XCTAssertEqual(topConstraint.secondItem as? UIView, rootView)
        XCTAssertEqual(topConstraint.secondAttribute, NSLayoutConstraint.Attribute .top)
        XCTAssertEqual(topConstraint.multiplier, 1)
        XCTAssertEqual(topConstraint.constant, 0)
        XCTAssertEqual(topConstraint.priority, UILayoutPriority.required)
        
        XCTAssertTrue(leftConstraint.isActive)
        XCTAssertEqual(leftConstraint.firstItem as? UIView, firstView)
        XCTAssertEqual(leftConstraint.firstAttribute, NSLayoutConstraint.Attribute .left)
        XCTAssertEqual(leftConstraint.relation, NSLayoutConstraint.Relation.equal)
        XCTAssertEqual(leftConstraint.secondItem as? UIView, rootView)
        XCTAssertEqual(leftConstraint.secondAttribute, NSLayoutConstraint.Attribute .left)
        XCTAssertEqual(leftConstraint.multiplier, 1)
        XCTAssertEqual(leftConstraint.constant, 0)
        XCTAssertEqual(leftConstraint.priority, UILayoutPriority.required)
        
        XCTAssertTrue(bottomConstraint.isActive)
        XCTAssertEqual(bottomConstraint.firstItem as? UIView, firstView)
        XCTAssertEqual(bottomConstraint.firstAttribute, NSLayoutConstraint.Attribute .bottom)
        XCTAssertEqual(bottomConstraint.relation, NSLayoutConstraint.Relation.equal)
        XCTAssertEqual(bottomConstraint.secondItem as? UIView, rootView)
        XCTAssertEqual(bottomConstraint.secondAttribute, NSLayoutConstraint.Attribute .bottom)
        XCTAssertEqual(bottomConstraint.multiplier, 1)
        XCTAssertEqual(bottomConstraint.constant, 0)
        XCTAssertEqual(bottomConstraint.priority, UILayoutPriority.required)
        
        XCTAssertTrue(rightConstraint.isActive)
        XCTAssertEqual(rightConstraint.firstItem as? UIView, firstView)
        XCTAssertEqual(rightConstraint.firstAttribute, NSLayoutConstraint.Attribute .right)
        XCTAssertEqual(rightConstraint.relation, NSLayoutConstraint.Relation.equal)
        XCTAssertEqual(rightConstraint.secondItem as? UIView, rootView)
        XCTAssertEqual(rightConstraint.secondAttribute, NSLayoutConstraint.Attribute .right)
        XCTAssertEqual(rightConstraint.multiplier, 1)
        XCTAssertEqual(rightConstraint.constant, 0)
        XCTAssertEqual(rightConstraint.priority, UILayoutPriority.required)
    }
    
    func testConstrainToViewWithInsets() {
        let top: CGFloat = 10
        let left: CGFloat = 10
        let bottom: CGFloat = 10
        let right: CGFloat = 10
        
        let insets = UIEdgeInsets(top: top, left: left, bottom: bottom, right: right)
        
        let rootView = UIView(frame: CGRect.zero)
        let firstView = UIView(frame: CGRect.zero)
        rootView.addSubview(firstView)
        
        let (topConstraint, leftConstraint, bottomConstraint, rightConstraint) = firstView.constrain(to: rootView, insetBy: insets)
        
        XCTAssertTrue(topConstraint.isActive)
        XCTAssertEqual(topConstraint.firstItem as? UIView, firstView)
        XCTAssertEqual(topConstraint.firstAttribute, NSLayoutConstraint.Attribute .top)
        XCTAssertEqual(topConstraint.relation, NSLayoutConstraint.Relation.equal)
        XCTAssertEqual(topConstraint.secondItem as? UIView, rootView)
        XCTAssertEqual(topConstraint.secondAttribute, NSLayoutConstraint.Attribute .top)
        XCTAssertEqual(topConstraint.multiplier, 1)
        XCTAssertEqual(topConstraint.constant, top)
        XCTAssertEqual(topConstraint.priority, UILayoutPriority.required)
        
        XCTAssertTrue(leftConstraint.isActive)
        XCTAssertEqual(leftConstraint.firstItem as? UIView, firstView)
        XCTAssertEqual(leftConstraint.firstAttribute, NSLayoutConstraint.Attribute .left)
        XCTAssertEqual(leftConstraint.relation, NSLayoutConstraint.Relation.equal)
        XCTAssertEqual(leftConstraint.secondItem as? UIView, rootView)
        XCTAssertEqual(leftConstraint.secondAttribute, NSLayoutConstraint.Attribute .left)
        XCTAssertEqual(leftConstraint.multiplier, 1)
        XCTAssertEqual(leftConstraint.constant, left)
        XCTAssertEqual(leftConstraint.priority, UILayoutPriority.required)
        
        XCTAssertTrue(bottomConstraint.isActive)
        XCTAssertEqual(bottomConstraint.firstItem as? UIView, firstView)
        XCTAssertEqual(bottomConstraint.firstAttribute, NSLayoutConstraint.Attribute .bottom)
        XCTAssertEqual(bottomConstraint.relation, NSLayoutConstraint.Relation.equal)
        XCTAssertEqual(bottomConstraint.secondItem as? UIView, rootView)
        XCTAssertEqual(bottomConstraint.secondAttribute, NSLayoutConstraint.Attribute .bottom)
        XCTAssertEqual(bottomConstraint.multiplier, 1)
        XCTAssertEqual(bottomConstraint.constant, -bottom)
        XCTAssertEqual(bottomConstraint.priority, UILayoutPriority.required)
        
        XCTAssertTrue(rightConstraint.isActive)
        XCTAssertEqual(rightConstraint.firstItem as? UIView, firstView)
        XCTAssertEqual(rightConstraint.firstAttribute, NSLayoutConstraint.Attribute .right)
        XCTAssertEqual(rightConstraint.relation, NSLayoutConstraint.Relation.equal)
        XCTAssertEqual(rightConstraint.secondItem as? UIView, rootView)
        XCTAssertEqual(rightConstraint.secondAttribute, NSLayoutConstraint.Attribute .right)
        XCTAssertEqual(rightConstraint.multiplier, 1)
        XCTAssertEqual(rightConstraint.constant, -right)
        XCTAssertEqual(rightConstraint.priority, UILayoutPriority.required)
    }
    
    func testConstrainToEdgesOfView() {
        let rootView = UIView(frame: CGRect.zero)
        let firstView = UIView(frame: CGRect.zero)
        rootView.addSubview(firstView)
        
        let (topConstraint, leadingConstraint, bottomConstraint, trailingConstraint) = firstView.constrain(toEdgesOf: rootView)
        
        XCTAssertTrue(topConstraint.isActive)
        XCTAssertEqual(topConstraint.firstItem as? UIView, firstView)
        XCTAssertEqual(topConstraint.firstAttribute, NSLayoutConstraint.Attribute .top)
        XCTAssertEqual(topConstraint.relation, NSLayoutConstraint.Relation.equal)
        XCTAssertEqual(topConstraint.secondItem as? UIView, rootView)
        XCTAssertEqual(topConstraint.secondAttribute, NSLayoutConstraint.Attribute .top)
        XCTAssertEqual(topConstraint.multiplier, 1)
        XCTAssertEqual(topConstraint.constant, 0)
        XCTAssertEqual(topConstraint.priority, UILayoutPriority.required)
        
        XCTAssertTrue(leadingConstraint.isActive)
        XCTAssertEqual(leadingConstraint.firstItem as? UIView, firstView)
        XCTAssertEqual(leadingConstraint.firstAttribute, NSLayoutConstraint.Attribute .leading)
        XCTAssertEqual(leadingConstraint.relation, NSLayoutConstraint.Relation.equal)
        XCTAssertEqual(leadingConstraint.secondItem as? UIView, rootView)
        XCTAssertEqual(leadingConstraint.secondAttribute, NSLayoutConstraint.Attribute .leading)
        XCTAssertEqual(leadingConstraint.multiplier, 1)
        XCTAssertEqual(leadingConstraint.constant, 0)
        XCTAssertEqual(leadingConstraint.priority, UILayoutPriority.required)
        
        XCTAssertTrue(bottomConstraint.isActive)
        XCTAssertEqual(bottomConstraint.firstItem as? UIView, firstView)
        XCTAssertEqual(bottomConstraint.firstAttribute, NSLayoutConstraint.Attribute .bottom)
        XCTAssertEqual(bottomConstraint.relation, NSLayoutConstraint.Relation.equal)
        XCTAssertEqual(bottomConstraint.secondItem as? UIView, rootView)
        XCTAssertEqual(bottomConstraint.secondAttribute, NSLayoutConstraint.Attribute .bottom)
        XCTAssertEqual(bottomConstraint.multiplier, 1)
        XCTAssertEqual(bottomConstraint.constant, 0)
        XCTAssertEqual(bottomConstraint.priority, UILayoutPriority.required)
        
        XCTAssertTrue(trailingConstraint.isActive)
        XCTAssertEqual(trailingConstraint.firstItem as? UIView, firstView)
        XCTAssertEqual(trailingConstraint.firstAttribute, NSLayoutConstraint.Attribute .trailing)
        XCTAssertEqual(trailingConstraint.relation, NSLayoutConstraint.Relation.equal)
        XCTAssertEqual(trailingConstraint.secondItem as? UIView, rootView)
        XCTAssertEqual(trailingConstraint.secondAttribute, NSLayoutConstraint.Attribute .trailing)
        XCTAssertEqual(trailingConstraint.multiplier, 1)
        XCTAssertEqual(trailingConstraint.constant, 0)
        XCTAssertEqual(trailingConstraint.priority, UILayoutPriority.required)
    }
    
    func testConstrainToEdgesOfViewWithInsets() {
        let top: CGFloat = 10
        let leading: CGFloat = 10
        let bottom: CGFloat = 10
        let trailing: CGFloat = 10
        
        let insets = UIEdgeInsets(top: top, left: leading, bottom: bottom, right: trailing)
        
        let rootView = UIView(frame: CGRect.zero)
        let firstView = UIView(frame: CGRect.zero)
        rootView.addSubview(firstView)
        
        let (topConstraint, leadingConstraint, bottomConstraint, trailingConstraint) = firstView.constrain(toEdgesOf: rootView, insetBy: insets)
        
        XCTAssertTrue(topConstraint.isActive)
        XCTAssertEqual(topConstraint.firstItem as? UIView, firstView)
        XCTAssertEqual(topConstraint.firstAttribute, NSLayoutConstraint.Attribute .top)
        XCTAssertEqual(topConstraint.relation, NSLayoutConstraint.Relation.equal)
        XCTAssertEqual(topConstraint.secondItem as? UIView, rootView)
        XCTAssertEqual(topConstraint.secondAttribute, NSLayoutConstraint.Attribute .top)
        XCTAssertEqual(topConstraint.multiplier, 1)
        XCTAssertEqual(topConstraint.constant, top)
        XCTAssertEqual(topConstraint.priority, UILayoutPriority.required)
        
        XCTAssertTrue(leadingConstraint.isActive)
        XCTAssertEqual(leadingConstraint.firstItem as? UIView, firstView)
        XCTAssertEqual(leadingConstraint.firstAttribute, NSLayoutConstraint.Attribute .leading)
        XCTAssertEqual(leadingConstraint.relation, NSLayoutConstraint.Relation.equal)
        XCTAssertEqual(leadingConstraint.secondItem as? UIView, rootView)
        XCTAssertEqual(leadingConstraint.secondAttribute, NSLayoutConstraint.Attribute .leading)
        XCTAssertEqual(leadingConstraint.multiplier, 1)
        XCTAssertEqual(leadingConstraint.constant, leading)
        XCTAssertEqual(leadingConstraint.priority, UILayoutPriority.required)
        
        XCTAssertTrue(bottomConstraint.isActive)
        XCTAssertEqual(bottomConstraint.firstItem as? UIView, firstView)
        XCTAssertEqual(bottomConstraint.firstAttribute, NSLayoutConstraint.Attribute .bottom)
        XCTAssertEqual(bottomConstraint.relation, NSLayoutConstraint.Relation.equal)
        XCTAssertEqual(bottomConstraint.secondItem as? UIView, rootView)
        XCTAssertEqual(bottomConstraint.secondAttribute, NSLayoutConstraint.Attribute .bottom)
        XCTAssertEqual(bottomConstraint.multiplier, 1)
        XCTAssertEqual(bottomConstraint.constant, -bottom)
        XCTAssertEqual(bottomConstraint.priority, UILayoutPriority.required)
        
        XCTAssertTrue(trailingConstraint.isActive)
        XCTAssertEqual(trailingConstraint.firstItem as? UIView, firstView)
        XCTAssertEqual(trailingConstraint.firstAttribute, NSLayoutConstraint.Attribute .trailing)
        XCTAssertEqual(trailingConstraint.relation, NSLayoutConstraint.Relation.equal)
        XCTAssertEqual(trailingConstraint.secondItem as? UIView, rootView)
        XCTAssertEqual(trailingConstraint.secondAttribute, NSLayoutConstraint.Attribute .trailing)
        XCTAssertEqual(trailingConstraint.multiplier, 1)
        XCTAssertEqual(trailingConstraint.constant, -trailing)
        XCTAssertEqual(trailingConstraint.priority, UILayoutPriority.required)
    }
    
    func testConstrainToMarginsOfView() {
        let rootView = UIView(frame: CGRect.zero)
        let firstView = UIView(frame: CGRect.zero)
        rootView.addSubview(firstView)
        
        let (topMarginConstraint, leadingMarginConstraint, bottomMarginConstraint, trailingMarginConstraint) = firstView.constrain(toMarginsOf: rootView)
        
        XCTAssertTrue(topMarginConstraint.isActive)
        XCTAssertEqual(topMarginConstraint.firstItem as? UIView, firstView)
        XCTAssertEqual(topMarginConstraint.firstAttribute, NSLayoutConstraint.Attribute .topMargin)
        XCTAssertEqual(topMarginConstraint.relation, NSLayoutConstraint.Relation.equal)
        XCTAssertEqual(topMarginConstraint.secondItem as? UIView, rootView)
        XCTAssertEqual(topMarginConstraint.secondAttribute, NSLayoutConstraint.Attribute .topMargin)
        XCTAssertEqual(topMarginConstraint.multiplier, 1)
        XCTAssertEqual(topMarginConstraint.constant, 0)
        XCTAssertEqual(topMarginConstraint.priority, UILayoutPriority.required)
        
        XCTAssertTrue(leadingMarginConstraint.isActive)
        XCTAssertEqual(leadingMarginConstraint.firstItem as? UIView, firstView)
        XCTAssertEqual(leadingMarginConstraint.firstAttribute, NSLayoutConstraint.Attribute .leadingMargin)
        XCTAssertEqual(leadingMarginConstraint.relation, NSLayoutConstraint.Relation.equal)
        XCTAssertEqual(leadingMarginConstraint.secondItem as? UIView, rootView)
        XCTAssertEqual(leadingMarginConstraint.secondAttribute, NSLayoutConstraint.Attribute .leadingMargin)
        XCTAssertEqual(leadingMarginConstraint.multiplier, 1)
        XCTAssertEqual(leadingMarginConstraint.constant, 0)
        XCTAssertEqual(leadingMarginConstraint.priority, UILayoutPriority.required)
        
        XCTAssertTrue(bottomMarginConstraint.isActive)
        XCTAssertEqual(bottomMarginConstraint.firstItem as? UIView, firstView)
        XCTAssertEqual(bottomMarginConstraint.firstAttribute, NSLayoutConstraint.Attribute .bottomMargin)
        XCTAssertEqual(bottomMarginConstraint.relation, NSLayoutConstraint.Relation.equal)
        XCTAssertEqual(bottomMarginConstraint.secondItem as? UIView, rootView)
        XCTAssertEqual(bottomMarginConstraint.secondAttribute, NSLayoutConstraint.Attribute .bottomMargin)
        XCTAssertEqual(bottomMarginConstraint.multiplier, 1)
        XCTAssertEqual(bottomMarginConstraint.constant, 0)
        XCTAssertEqual(bottomMarginConstraint.priority, UILayoutPriority.required)
        
        XCTAssertTrue(trailingMarginConstraint.isActive)
        XCTAssertEqual(trailingMarginConstraint.firstItem as? UIView, firstView)
        XCTAssertEqual(trailingMarginConstraint.firstAttribute, NSLayoutConstraint.Attribute .trailingMargin)
        XCTAssertEqual(trailingMarginConstraint.relation, NSLayoutConstraint.Relation.equal)
        XCTAssertEqual(trailingMarginConstraint.secondItem as? UIView, rootView)
        XCTAssertEqual(trailingMarginConstraint.secondAttribute, NSLayoutConstraint.Attribute .trailingMargin)
        XCTAssertEqual(trailingMarginConstraint.multiplier, 1)
        XCTAssertEqual(trailingMarginConstraint.constant, 0)
        XCTAssertEqual(trailingMarginConstraint.priority, UILayoutPriority.required)
    }
    
    func testConstrainToMarginsOfViewWithInsets() {
        let topMargin: CGFloat = 10
        let leadingMargin: CGFloat = 10
        let bottomMargin: CGFloat = 10
        let trailingMargin: CGFloat = 10
        
        let insets = UIEdgeInsets(top: topMargin, left: leadingMargin, bottom: bottomMargin, right: trailingMargin)
        
        let rootView = UIView(frame: CGRect.zero)
        let firstView = UIView(frame: CGRect.zero)
        rootView.addSubview(firstView)
        
        let (topMarginConstraint, leadingMarginConstraint, bottomMarginConstraint, trailingMarginConstraint) = firstView.constrain(toMarginsOf: rootView, insetBy: insets)
        
        XCTAssertTrue(topMarginConstraint.isActive)
        XCTAssertEqual(topMarginConstraint.firstItem as? UIView, firstView)
        XCTAssertEqual(topMarginConstraint.firstAttribute, NSLayoutConstraint.Attribute .topMargin)
        XCTAssertEqual(topMarginConstraint.relation, NSLayoutConstraint.Relation.equal)
        XCTAssertEqual(topMarginConstraint.secondItem as? UIView, rootView)
        XCTAssertEqual(topMarginConstraint.secondAttribute, NSLayoutConstraint.Attribute .topMargin)
        XCTAssertEqual(topMarginConstraint.multiplier, 1)
        XCTAssertEqual(topMarginConstraint.constant, topMargin)
        XCTAssertEqual(topMarginConstraint.priority, UILayoutPriority.required)
        
        XCTAssertTrue(leadingMarginConstraint.isActive)
        XCTAssertEqual(leadingMarginConstraint.firstItem as? UIView, firstView)
        XCTAssertEqual(leadingMarginConstraint.firstAttribute, NSLayoutConstraint.Attribute .leadingMargin)
        XCTAssertEqual(leadingMarginConstraint.relation, NSLayoutConstraint.Relation.equal)
        XCTAssertEqual(leadingMarginConstraint.secondItem as? UIView, rootView)
        XCTAssertEqual(leadingMarginConstraint.secondAttribute, NSLayoutConstraint.Attribute .leadingMargin)
        XCTAssertEqual(leadingMarginConstraint.multiplier, 1)
        XCTAssertEqual(leadingMarginConstraint.constant, leadingMargin)
        XCTAssertEqual(leadingMarginConstraint.priority, UILayoutPriority.required)
        
        XCTAssertTrue(bottomMarginConstraint.isActive)
        XCTAssertEqual(bottomMarginConstraint.firstItem as? UIView, firstView)
        XCTAssertEqual(bottomMarginConstraint.firstAttribute, NSLayoutConstraint.Attribute .bottomMargin)
        XCTAssertEqual(bottomMarginConstraint.relation, NSLayoutConstraint.Relation.equal)
        XCTAssertEqual(bottomMarginConstraint.secondItem as? UIView, rootView)
        XCTAssertEqual(bottomMarginConstraint.secondAttribute, NSLayoutConstraint.Attribute .bottomMargin)
        XCTAssertEqual(bottomMarginConstraint.multiplier, 1)
        XCTAssertEqual(bottomMarginConstraint.constant, -bottomMargin)
        XCTAssertEqual(bottomMarginConstraint.priority, UILayoutPriority.required)
        
        XCTAssertTrue(trailingMarginConstraint.isActive)
        XCTAssertEqual(trailingMarginConstraint.firstItem as? UIView, firstView)
        XCTAssertEqual(trailingMarginConstraint.firstAttribute, NSLayoutConstraint.Attribute .trailingMargin)
        XCTAssertEqual(trailingMarginConstraint.relation, NSLayoutConstraint.Relation.equal)
        XCTAssertEqual(trailingMarginConstraint.secondItem as? UIView, rootView)
        XCTAssertEqual(trailingMarginConstraint.secondAttribute, NSLayoutConstraint.Attribute .trailingMargin)
        XCTAssertEqual(trailingMarginConstraint.multiplier, 1)
        XCTAssertEqual(trailingMarginConstraint.constant, -trailingMargin)
        XCTAssertEqual(trailingMarginConstraint.priority, UILayoutPriority.required)
    }
    
    func testConstrainToCenterOfView() {
        let rootView = UIView(frame: CGRect.zero)
        let firstView = UIView(frame: CGRect.zero)
        rootView.addSubview(firstView)
        
        let (xConstraint, yConstraint) = firstView.constrain(toCenterOf: rootView)
        
        XCTAssertTrue(xConstraint.isActive)
        XCTAssertEqual(xConstraint.firstItem as? UIView, firstView)
        XCTAssertEqual(xConstraint.firstAttribute, NSLayoutConstraint.Attribute .centerX)
        XCTAssertEqual(xConstraint.relation, NSLayoutConstraint.Relation.equal)
        XCTAssertEqual(xConstraint.secondItem as? UIView, rootView)
        XCTAssertEqual(xConstraint.secondAttribute, NSLayoutConstraint.Attribute .centerX)
        XCTAssertEqual(xConstraint.multiplier, 1)
        XCTAssertEqual(xConstraint.constant, 0)
        XCTAssertEqual(xConstraint.priority, UILayoutPriority.required)
        
        XCTAssertTrue(yConstraint.isActive)
        XCTAssertEqual(yConstraint.firstItem as? UIView, firstView)
        XCTAssertEqual(yConstraint.firstAttribute, NSLayoutConstraint.Attribute .centerY)
        XCTAssertEqual(yConstraint.relation, NSLayoutConstraint.Relation.equal)
        XCTAssertEqual(yConstraint.secondItem as? UIView, rootView)
        XCTAssertEqual(yConstraint.secondAttribute, NSLayoutConstraint.Attribute .centerY)
        XCTAssertEqual(yConstraint.multiplier, 1)
        XCTAssertEqual(yConstraint.constant, 0)
        XCTAssertEqual(yConstraint.priority, UILayoutPriority.required)
    }
    
    
    func testConstrainToCenterOfViewWithOffsets() {
        let xOffset: CGFloat = 10
        let yOffset: CGFloat = 10
        
        let offsets = CGPoint(x: xOffset, y: yOffset)
        
        let rootView = UIView(frame: CGRect.zero)
        let firstView = UIView(frame: CGRect.zero)
        rootView.addSubview(firstView)
        
        let (xConstraint, yConstraint) = firstView.constrain(toCenterOf: rootView, offsetBy: offsets)
        
        XCTAssertTrue(xConstraint.isActive)
        XCTAssertEqual(xConstraint.firstItem as? UIView, firstView)
        XCTAssertEqual(xConstraint.firstAttribute, NSLayoutConstraint.Attribute .centerX)
        XCTAssertEqual(xConstraint.relation, NSLayoutConstraint.Relation.equal)
        XCTAssertEqual(xConstraint.secondItem as? UIView, rootView)
        XCTAssertEqual(xConstraint.secondAttribute, NSLayoutConstraint.Attribute .centerX)
        XCTAssertEqual(xConstraint.multiplier, 1)
        XCTAssertEqual(xConstraint.constant, xOffset)
        XCTAssertEqual(xConstraint.priority, UILayoutPriority.required)
        
        XCTAssertTrue(yConstraint.isActive)
        XCTAssertEqual(yConstraint.firstItem as? UIView, firstView)
        XCTAssertEqual(yConstraint.firstAttribute, NSLayoutConstraint.Attribute .centerY)
        XCTAssertEqual(yConstraint.relation, NSLayoutConstraint.Relation.equal)
        XCTAssertEqual(yConstraint.secondItem as? UIView, rootView)
        XCTAssertEqual(yConstraint.secondAttribute, NSLayoutConstraint.Attribute .centerY)
        XCTAssertEqual(yConstraint.multiplier, 1)
        XCTAssertEqual(yConstraint.constant, yOffset)
        XCTAssertEqual(yConstraint.priority, UILayoutPriority.required)
    }
    
    func testConstrainToSizeOfView() {
        let rootView = UIView(frame: CGRect.zero)
        let firstView = UIView(frame: CGRect.zero)
        rootView.addSubview(firstView)
        
        let (widthConstraint, heightConstraint) = firstView.constrain(toSizeOf: rootView)
        
        XCTAssertTrue(widthConstraint.isActive)
        XCTAssertEqual(widthConstraint.firstItem as? UIView, firstView)
        XCTAssertEqual(widthConstraint.firstAttribute, NSLayoutConstraint.Attribute .width)
        XCTAssertEqual(widthConstraint.relation, NSLayoutConstraint.Relation.equal)
        XCTAssertEqual(widthConstraint.secondItem as? UIView, rootView)
        XCTAssertEqual(widthConstraint.secondAttribute, NSLayoutConstraint.Attribute .width)
        XCTAssertEqual(widthConstraint.multiplier, 1)
        XCTAssertEqual(widthConstraint.constant, 0)
        XCTAssertEqual(widthConstraint.priority, UILayoutPriority.required)
        
        XCTAssertTrue(heightConstraint.isActive)
        XCTAssertEqual(heightConstraint.firstItem as? UIView, firstView)
        XCTAssertEqual(heightConstraint.firstAttribute, NSLayoutConstraint.Attribute .height)
        XCTAssertEqual(heightConstraint.relation, NSLayoutConstraint.Relation.equal)
        XCTAssertEqual(heightConstraint.secondItem as? UIView, rootView)
        XCTAssertEqual(heightConstraint.secondAttribute, NSLayoutConstraint.Attribute .height)
        XCTAssertEqual(heightConstraint.multiplier, 1)
        XCTAssertEqual(heightConstraint.constant, 0)
        XCTAssertEqual(heightConstraint.priority, UILayoutPriority.required)
    }
}
