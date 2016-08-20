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
    func testConstrainWidth() {
        let width: CGFloat = 25
        
        let rootView = UIView(frame: CGRect.zero)
        let firstView = UIView(frame: CGRect.zero)
        rootView.addSubview(firstView)
        
        let constraint = firstView.constrain(.width, to: width)
        
        XCTAssertTrue(constraint.isActive)
        XCTAssertEqual(constraint.firstItem as? UIView, firstView)
        XCTAssertEqual(constraint.firstAttribute, NSLayoutAttribute.width)
        XCTAssertEqual(constraint.relation, NSLayoutRelation.equal)
        XCTAssertNil(constraint.secondItem)
        XCTAssertEqual(constraint.secondAttribute, NSLayoutAttribute.notAnAttribute)
        XCTAssertEqual(constraint.multiplier, 1)
        XCTAssertEqual(constraint.constant, width)
        XCTAssertEqual(constraint.priority, UILayoutPriorityRequired)
    }
    
    func testConstrainWidthWithHighPriority() {
        let width: CGFloat = 25
        let priority: Float = UILayoutPriorityDefaultHigh
        
        let rootView = UIView(frame: CGRect.zero)
        let firstView = UIView(frame: CGRect.zero)
        rootView.addSubview(firstView)
        
        let constraint = firstView.constrain(.width, to: width, priority: priority)
        
        XCTAssertTrue(constraint.isActive)
        XCTAssertEqual(constraint.firstItem as? UIView, firstView)
        XCTAssertEqual(constraint.firstAttribute, NSLayoutAttribute.width)
        XCTAssertEqual(constraint.relation, NSLayoutRelation.equal)
        XCTAssertNil(constraint.secondItem)
        XCTAssertEqual(constraint.secondAttribute, NSLayoutAttribute.notAnAttribute)
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
        XCTAssertEqual(widthConstraint.firstAttribute, NSLayoutAttribute.width)
        XCTAssertEqual(widthConstraint.relation, NSLayoutRelation.equal)
        XCTAssertNil(widthConstraint.secondItem)
        XCTAssertEqual(widthConstraint.secondAttribute, NSLayoutAttribute.notAnAttribute)
        XCTAssertEqual(widthConstraint.multiplier, 1)
        XCTAssertEqual(widthConstraint.constant, width)
        XCTAssertEqual(widthConstraint.priority, UILayoutPriorityRequired)
        
        XCTAssertTrue(heightConstraint.isActive)
        XCTAssertEqual(heightConstraint.firstItem as? UIView, firstView)
        XCTAssertEqual(heightConstraint.firstAttribute, NSLayoutAttribute.height)
        XCTAssertEqual(heightConstraint.relation, NSLayoutRelation.equal)
        XCTAssertNil(heightConstraint.secondItem)
        XCTAssertEqual(heightConstraint.secondAttribute, NSLayoutAttribute.notAnAttribute)
        XCTAssertEqual(heightConstraint.multiplier, 1)
        XCTAssertEqual(heightConstraint.constant, height)
        XCTAssertEqual(heightConstraint.priority, UILayoutPriorityRequired)
    }
    
    func testConstrainToView() {
        let rootView = UIView(frame: CGRect.zero)
        let firstView = UIView(frame: CGRect.zero)
        rootView.addSubview(firstView)
        
        let (topConstraint, leftConstraint, bottomConstraint, rightConstraint) = firstView.constrain(to: rootView)
        
        XCTAssertTrue(topConstraint.isActive)
        XCTAssertEqual(topConstraint.firstItem as? UIView, firstView)
        XCTAssertEqual(topConstraint.firstAttribute, NSLayoutAttribute.top)
        XCTAssertEqual(topConstraint.relation, NSLayoutRelation.equal)
        XCTAssertEqual(topConstraint.secondItem as? UIView, rootView)
        XCTAssertEqual(topConstraint.secondAttribute, NSLayoutAttribute.top)
        XCTAssertEqual(topConstraint.multiplier, 1)
        XCTAssertEqual(topConstraint.constant, 0)
        XCTAssertEqual(topConstraint.priority, UILayoutPriorityRequired)
        
        XCTAssertTrue(leftConstraint.isActive)
        XCTAssertEqual(leftConstraint.firstItem as? UIView, firstView)
        XCTAssertEqual(leftConstraint.firstAttribute, NSLayoutAttribute.left)
        XCTAssertEqual(leftConstraint.relation, NSLayoutRelation.equal)
        XCTAssertEqual(leftConstraint.secondItem as? UIView, rootView)
        XCTAssertEqual(leftConstraint.secondAttribute, NSLayoutAttribute.left)
        XCTAssertEqual(leftConstraint.multiplier, 1)
        XCTAssertEqual(leftConstraint.constant, 0)
        XCTAssertEqual(leftConstraint.priority, UILayoutPriorityRequired)
        
        XCTAssertTrue(bottomConstraint.isActive)
        XCTAssertEqual(bottomConstraint.firstItem as? UIView, firstView)
        XCTAssertEqual(bottomConstraint.firstAttribute, NSLayoutAttribute.bottom)
        XCTAssertEqual(bottomConstraint.relation, NSLayoutRelation.equal)
        XCTAssertEqual(bottomConstraint.secondItem as? UIView, rootView)
        XCTAssertEqual(bottomConstraint.secondAttribute, NSLayoutAttribute.bottom)
        XCTAssertEqual(bottomConstraint.multiplier, 1)
        XCTAssertEqual(bottomConstraint.constant, 0)
        XCTAssertEqual(bottomConstraint.priority, UILayoutPriorityRequired)
        
        XCTAssertTrue(rightConstraint.isActive)
        XCTAssertEqual(rightConstraint.firstItem as? UIView, firstView)
        XCTAssertEqual(rightConstraint.firstAttribute, NSLayoutAttribute.right)
        XCTAssertEqual(rightConstraint.relation, NSLayoutRelation.equal)
        XCTAssertEqual(rightConstraint.secondItem as? UIView, rootView)
        XCTAssertEqual(rightConstraint.secondAttribute, NSLayoutAttribute.right)
        XCTAssertEqual(rightConstraint.multiplier, 1)
        XCTAssertEqual(rightConstraint.constant, 0)
        XCTAssertEqual(rightConstraint.priority, UILayoutPriorityRequired)
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
        XCTAssertEqual(topConstraint.firstAttribute, NSLayoutAttribute.top)
        XCTAssertEqual(topConstraint.relation, NSLayoutRelation.equal)
        XCTAssertEqual(topConstraint.secondItem as? UIView, rootView)
        XCTAssertEqual(topConstraint.secondAttribute, NSLayoutAttribute.top)
        XCTAssertEqual(topConstraint.multiplier, 1)
        XCTAssertEqual(topConstraint.constant, top)
        XCTAssertEqual(topConstraint.priority, UILayoutPriorityRequired)
        
        XCTAssertTrue(leftConstraint.isActive)
        XCTAssertEqual(leftConstraint.firstItem as? UIView, firstView)
        XCTAssertEqual(leftConstraint.firstAttribute, NSLayoutAttribute.left)
        XCTAssertEqual(leftConstraint.relation, NSLayoutRelation.equal)
        XCTAssertEqual(leftConstraint.secondItem as? UIView, rootView)
        XCTAssertEqual(leftConstraint.secondAttribute, NSLayoutAttribute.left)
        XCTAssertEqual(leftConstraint.multiplier, 1)
        XCTAssertEqual(leftConstraint.constant, left)
        XCTAssertEqual(leftConstraint.priority, UILayoutPriorityRequired)
        
        XCTAssertTrue(bottomConstraint.isActive)
        XCTAssertEqual(bottomConstraint.firstItem as? UIView, firstView)
        XCTAssertEqual(bottomConstraint.firstAttribute, NSLayoutAttribute.bottom)
        XCTAssertEqual(bottomConstraint.relation, NSLayoutRelation.equal)
        XCTAssertEqual(bottomConstraint.secondItem as? UIView, rootView)
        XCTAssertEqual(bottomConstraint.secondAttribute, NSLayoutAttribute.bottom)
        XCTAssertEqual(bottomConstraint.multiplier, 1)
        XCTAssertEqual(bottomConstraint.constant, -bottom)
        XCTAssertEqual(bottomConstraint.priority, UILayoutPriorityRequired)
        
        XCTAssertTrue(rightConstraint.isActive)
        XCTAssertEqual(rightConstraint.firstItem as? UIView, firstView)
        XCTAssertEqual(rightConstraint.firstAttribute, NSLayoutAttribute.right)
        XCTAssertEqual(rightConstraint.relation, NSLayoutRelation.equal)
        XCTAssertEqual(rightConstraint.secondItem as? UIView, rootView)
        XCTAssertEqual(rightConstraint.secondAttribute, NSLayoutAttribute.right)
        XCTAssertEqual(rightConstraint.multiplier, 1)
        XCTAssertEqual(rightConstraint.constant, -right)
        XCTAssertEqual(rightConstraint.priority, UILayoutPriorityRequired)
    }
    
    func testConstrainToEdgesOfView() {
        let rootView = UIView(frame: CGRect.zero)
        let firstView = UIView(frame: CGRect.zero)
        rootView.addSubview(firstView)
        
        let (topConstraint, leadingConstraint, bottomConstraint, trailingConstraint) = firstView.constrain(toEdgesOf: rootView)
        
        XCTAssertTrue(topConstraint.isActive)
        XCTAssertEqual(topConstraint.firstItem as? UIView, firstView)
        XCTAssertEqual(topConstraint.firstAttribute, NSLayoutAttribute.top)
        XCTAssertEqual(topConstraint.relation, NSLayoutRelation.equal)
        XCTAssertEqual(topConstraint.secondItem as? UIView, rootView)
        XCTAssertEqual(topConstraint.secondAttribute, NSLayoutAttribute.top)
        XCTAssertEqual(topConstraint.multiplier, 1)
        XCTAssertEqual(topConstraint.constant, 0)
        XCTAssertEqual(topConstraint.priority, UILayoutPriorityRequired)
        
        XCTAssertTrue(leadingConstraint.isActive)
        XCTAssertEqual(leadingConstraint.firstItem as? UIView, firstView)
        XCTAssertEqual(leadingConstraint.firstAttribute, NSLayoutAttribute.leading)
        XCTAssertEqual(leadingConstraint.relation, NSLayoutRelation.equal)
        XCTAssertEqual(leadingConstraint.secondItem as? UIView, rootView)
        XCTAssertEqual(leadingConstraint.secondAttribute, NSLayoutAttribute.leading)
        XCTAssertEqual(leadingConstraint.multiplier, 1)
        XCTAssertEqual(leadingConstraint.constant, 0)
        XCTAssertEqual(leadingConstraint.priority, UILayoutPriorityRequired)
        
        XCTAssertTrue(bottomConstraint.isActive)
        XCTAssertEqual(bottomConstraint.firstItem as? UIView, firstView)
        XCTAssertEqual(bottomConstraint.firstAttribute, NSLayoutAttribute.bottom)
        XCTAssertEqual(bottomConstraint.relation, NSLayoutRelation.equal)
        XCTAssertEqual(bottomConstraint.secondItem as? UIView, rootView)
        XCTAssertEqual(bottomConstraint.secondAttribute, NSLayoutAttribute.bottom)
        XCTAssertEqual(bottomConstraint.multiplier, 1)
        XCTAssertEqual(bottomConstraint.constant, 0)
        XCTAssertEqual(bottomConstraint.priority, UILayoutPriorityRequired)
        
        XCTAssertTrue(trailingConstraint.isActive)
        XCTAssertEqual(trailingConstraint.firstItem as? UIView, firstView)
        XCTAssertEqual(trailingConstraint.firstAttribute, NSLayoutAttribute.trailing)
        XCTAssertEqual(trailingConstraint.relation, NSLayoutRelation.equal)
        XCTAssertEqual(trailingConstraint.secondItem as? UIView, rootView)
        XCTAssertEqual(trailingConstraint.secondAttribute, NSLayoutAttribute.trailing)
        XCTAssertEqual(trailingConstraint.multiplier, 1)
        XCTAssertEqual(trailingConstraint.constant, 0)
        XCTAssertEqual(trailingConstraint.priority, UILayoutPriorityRequired)
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
        XCTAssertEqual(topConstraint.firstAttribute, NSLayoutAttribute.top)
        XCTAssertEqual(topConstraint.relation, NSLayoutRelation.equal)
        XCTAssertEqual(topConstraint.secondItem as? UIView, rootView)
        XCTAssertEqual(topConstraint.secondAttribute, NSLayoutAttribute.top)
        XCTAssertEqual(topConstraint.multiplier, 1)
        XCTAssertEqual(topConstraint.constant, top)
        XCTAssertEqual(topConstraint.priority, UILayoutPriorityRequired)
        
        XCTAssertTrue(leadingConstraint.isActive)
        XCTAssertEqual(leadingConstraint.firstItem as? UIView, firstView)
        XCTAssertEqual(leadingConstraint.firstAttribute, NSLayoutAttribute.leading)
        XCTAssertEqual(leadingConstraint.relation, NSLayoutRelation.equal)
        XCTAssertEqual(leadingConstraint.secondItem as? UIView, rootView)
        XCTAssertEqual(leadingConstraint.secondAttribute, NSLayoutAttribute.leading)
        XCTAssertEqual(leadingConstraint.multiplier, 1)
        XCTAssertEqual(leadingConstraint.constant, leading)
        XCTAssertEqual(leadingConstraint.priority, UILayoutPriorityRequired)
        
        XCTAssertTrue(bottomConstraint.isActive)
        XCTAssertEqual(bottomConstraint.firstItem as? UIView, firstView)
        XCTAssertEqual(bottomConstraint.firstAttribute, NSLayoutAttribute.bottom)
        XCTAssertEqual(bottomConstraint.relation, NSLayoutRelation.equal)
        XCTAssertEqual(bottomConstraint.secondItem as? UIView, rootView)
        XCTAssertEqual(bottomConstraint.secondAttribute, NSLayoutAttribute.bottom)
        XCTAssertEqual(bottomConstraint.multiplier, 1)
        XCTAssertEqual(bottomConstraint.constant, -bottom)
        XCTAssertEqual(bottomConstraint.priority, UILayoutPriorityRequired)
        
        XCTAssertTrue(trailingConstraint.isActive)
        XCTAssertEqual(trailingConstraint.firstItem as? UIView, firstView)
        XCTAssertEqual(trailingConstraint.firstAttribute, NSLayoutAttribute.trailing)
        XCTAssertEqual(trailingConstraint.relation, NSLayoutRelation.equal)
        XCTAssertEqual(trailingConstraint.secondItem as? UIView, rootView)
        XCTAssertEqual(trailingConstraint.secondAttribute, NSLayoutAttribute.trailing)
        XCTAssertEqual(trailingConstraint.multiplier, 1)
        XCTAssertEqual(trailingConstraint.constant, -trailing)
        XCTAssertEqual(trailingConstraint.priority, UILayoutPriorityRequired)
    }
    
    func testConstrainToMarginsOfView() {
        let rootView = UIView(frame: CGRect.zero)
        let firstView = UIView(frame: CGRect.zero)
        rootView.addSubview(firstView)
        
        let (topMarginConstraint, leadingMarginConstraint, bottomMarginConstraint, trailingMarginConstraint) = firstView.constrain(toMarginsOf: rootView)
        
        XCTAssertTrue(topMarginConstraint.isActive)
        XCTAssertEqual(topMarginConstraint.firstItem as? UIView, firstView)
        XCTAssertEqual(topMarginConstraint.firstAttribute, NSLayoutAttribute.topMargin)
        XCTAssertEqual(topMarginConstraint.relation, NSLayoutRelation.equal)
        XCTAssertEqual(topMarginConstraint.secondItem as? UIView, rootView)
        XCTAssertEqual(topMarginConstraint.secondAttribute, NSLayoutAttribute.topMargin)
        XCTAssertEqual(topMarginConstraint.multiplier, 1)
        XCTAssertEqual(topMarginConstraint.constant, 0)
        XCTAssertEqual(topMarginConstraint.priority, UILayoutPriorityRequired)
        
        XCTAssertTrue(leadingMarginConstraint.isActive)
        XCTAssertEqual(leadingMarginConstraint.firstItem as? UIView, firstView)
        XCTAssertEqual(leadingMarginConstraint.firstAttribute, NSLayoutAttribute.leadingMargin)
        XCTAssertEqual(leadingMarginConstraint.relation, NSLayoutRelation.equal)
        XCTAssertEqual(leadingMarginConstraint.secondItem as? UIView, rootView)
        XCTAssertEqual(leadingMarginConstraint.secondAttribute, NSLayoutAttribute.leadingMargin)
        XCTAssertEqual(leadingMarginConstraint.multiplier, 1)
        XCTAssertEqual(leadingMarginConstraint.constant, 0)
        XCTAssertEqual(leadingMarginConstraint.priority, UILayoutPriorityRequired)
        
        XCTAssertTrue(bottomMarginConstraint.isActive)
        XCTAssertEqual(bottomMarginConstraint.firstItem as? UIView, firstView)
        XCTAssertEqual(bottomMarginConstraint.firstAttribute, NSLayoutAttribute.bottomMargin)
        XCTAssertEqual(bottomMarginConstraint.relation, NSLayoutRelation.equal)
        XCTAssertEqual(bottomMarginConstraint.secondItem as? UIView, rootView)
        XCTAssertEqual(bottomMarginConstraint.secondAttribute, NSLayoutAttribute.bottomMargin)
        XCTAssertEqual(bottomMarginConstraint.multiplier, 1)
        XCTAssertEqual(bottomMarginConstraint.constant, 0)
        XCTAssertEqual(bottomMarginConstraint.priority, UILayoutPriorityRequired)
        
        XCTAssertTrue(trailingMarginConstraint.isActive)
        XCTAssertEqual(trailingMarginConstraint.firstItem as? UIView, firstView)
        XCTAssertEqual(trailingMarginConstraint.firstAttribute, NSLayoutAttribute.trailingMargin)
        XCTAssertEqual(trailingMarginConstraint.relation, NSLayoutRelation.equal)
        XCTAssertEqual(trailingMarginConstraint.secondItem as? UIView, rootView)
        XCTAssertEqual(trailingMarginConstraint.secondAttribute, NSLayoutAttribute.trailingMargin)
        XCTAssertEqual(trailingMarginConstraint.multiplier, 1)
        XCTAssertEqual(trailingMarginConstraint.constant, 0)
        XCTAssertEqual(trailingMarginConstraint.priority, UILayoutPriorityRequired)
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
        XCTAssertEqual(topMarginConstraint.firstAttribute, NSLayoutAttribute.topMargin)
        XCTAssertEqual(topMarginConstraint.relation, NSLayoutRelation.equal)
        XCTAssertEqual(topMarginConstraint.secondItem as? UIView, rootView)
        XCTAssertEqual(topMarginConstraint.secondAttribute, NSLayoutAttribute.topMargin)
        XCTAssertEqual(topMarginConstraint.multiplier, 1)
        XCTAssertEqual(topMarginConstraint.constant, topMargin)
        XCTAssertEqual(topMarginConstraint.priority, UILayoutPriorityRequired)
        
        XCTAssertTrue(leadingMarginConstraint.isActive)
        XCTAssertEqual(leadingMarginConstraint.firstItem as? UIView, firstView)
        XCTAssertEqual(leadingMarginConstraint.firstAttribute, NSLayoutAttribute.leadingMargin)
        XCTAssertEqual(leadingMarginConstraint.relation, NSLayoutRelation.equal)
        XCTAssertEqual(leadingMarginConstraint.secondItem as? UIView, rootView)
        XCTAssertEqual(leadingMarginConstraint.secondAttribute, NSLayoutAttribute.leadingMargin)
        XCTAssertEqual(leadingMarginConstraint.multiplier, 1)
        XCTAssertEqual(leadingMarginConstraint.constant, leadingMargin)
        XCTAssertEqual(leadingMarginConstraint.priority, UILayoutPriorityRequired)
        
        XCTAssertTrue(bottomMarginConstraint.isActive)
        XCTAssertEqual(bottomMarginConstraint.firstItem as? UIView, firstView)
        XCTAssertEqual(bottomMarginConstraint.firstAttribute, NSLayoutAttribute.bottomMargin)
        XCTAssertEqual(bottomMarginConstraint.relation, NSLayoutRelation.equal)
        XCTAssertEqual(bottomMarginConstraint.secondItem as? UIView, rootView)
        XCTAssertEqual(bottomMarginConstraint.secondAttribute, NSLayoutAttribute.bottomMargin)
        XCTAssertEqual(bottomMarginConstraint.multiplier, 1)
        XCTAssertEqual(bottomMarginConstraint.constant, -bottomMargin)
        XCTAssertEqual(bottomMarginConstraint.priority, UILayoutPriorityRequired)
        
        XCTAssertTrue(trailingMarginConstraint.isActive)
        XCTAssertEqual(trailingMarginConstraint.firstItem as? UIView, firstView)
        XCTAssertEqual(trailingMarginConstraint.firstAttribute, NSLayoutAttribute.trailingMargin)
        XCTAssertEqual(trailingMarginConstraint.relation, NSLayoutRelation.equal)
        XCTAssertEqual(trailingMarginConstraint.secondItem as? UIView, rootView)
        XCTAssertEqual(trailingMarginConstraint.secondAttribute, NSLayoutAttribute.trailingMargin)
        XCTAssertEqual(trailingMarginConstraint.multiplier, 1)
        XCTAssertEqual(trailingMarginConstraint.constant, -trailingMargin)
        XCTAssertEqual(trailingMarginConstraint.priority, UILayoutPriorityRequired)
    }
    
    func testConstrainToCenterOfView() {
        let rootView = UIView(frame: CGRect.zero)
        let firstView = UIView(frame: CGRect.zero)
        rootView.addSubview(firstView)
        
        let (xConstraint, yConstraint) = firstView.constrain(toCenterOf: rootView)
        
        XCTAssertTrue(xConstraint.isActive)
        XCTAssertEqual(xConstraint.firstItem as? UIView, firstView)
        XCTAssertEqual(xConstraint.firstAttribute, NSLayoutAttribute.centerX)
        XCTAssertEqual(xConstraint.relation, NSLayoutRelation.equal)
        XCTAssertEqual(xConstraint.secondItem as? UIView, rootView)
        XCTAssertEqual(xConstraint.secondAttribute, NSLayoutAttribute.centerX)
        XCTAssertEqual(xConstraint.multiplier, 1)
        XCTAssertEqual(xConstraint.constant, 0)
        XCTAssertEqual(xConstraint.priority, UILayoutPriorityRequired)
        
        XCTAssertTrue(yConstraint.isActive)
        XCTAssertEqual(yConstraint.firstItem as? UIView, firstView)
        XCTAssertEqual(yConstraint.firstAttribute, NSLayoutAttribute.centerY)
        XCTAssertEqual(yConstraint.relation, NSLayoutRelation.equal)
        XCTAssertEqual(yConstraint.secondItem as? UIView, rootView)
        XCTAssertEqual(yConstraint.secondAttribute, NSLayoutAttribute.centerY)
        XCTAssertEqual(yConstraint.multiplier, 1)
        XCTAssertEqual(yConstraint.constant, 0)
        XCTAssertEqual(yConstraint.priority, UILayoutPriorityRequired)
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
        XCTAssertEqual(xConstraint.firstAttribute, NSLayoutAttribute.centerX)
        XCTAssertEqual(xConstraint.relation, NSLayoutRelation.equal)
        XCTAssertEqual(xConstraint.secondItem as? UIView, rootView)
        XCTAssertEqual(xConstraint.secondAttribute, NSLayoutAttribute.centerX)
        XCTAssertEqual(xConstraint.multiplier, 1)
        XCTAssertEqual(xConstraint.constant, xOffset)
        XCTAssertEqual(xConstraint.priority, UILayoutPriorityRequired)
        
        XCTAssertTrue(yConstraint.isActive)
        XCTAssertEqual(yConstraint.firstItem as? UIView, firstView)
        XCTAssertEqual(yConstraint.firstAttribute, NSLayoutAttribute.centerY)
        XCTAssertEqual(yConstraint.relation, NSLayoutRelation.equal)
        XCTAssertEqual(yConstraint.secondItem as? UIView, rootView)
        XCTAssertEqual(yConstraint.secondAttribute, NSLayoutAttribute.centerY)
        XCTAssertEqual(yConstraint.multiplier, 1)
        XCTAssertEqual(yConstraint.constant, yOffset)
        XCTAssertEqual(yConstraint.priority, UILayoutPriorityRequired)
    }
    
    func testConstrainToSizeOfView() {
        let rootView = UIView(frame: CGRect.zero)
        let firstView = UIView(frame: CGRect.zero)
        rootView.addSubview(firstView)
        
        let (widthConstraint, heightConstraint) = firstView.constrain(toSizeOf: rootView)
        
        XCTAssertTrue(widthConstraint.isActive)
        XCTAssertEqual(widthConstraint.firstItem as? UIView, firstView)
        XCTAssertEqual(widthConstraint.firstAttribute, NSLayoutAttribute.width)
        XCTAssertEqual(widthConstraint.relation, NSLayoutRelation.equal)
        XCTAssertEqual(widthConstraint.secondItem as? UIView, rootView)
        XCTAssertEqual(widthConstraint.secondAttribute, NSLayoutAttribute.width)
        XCTAssertEqual(widthConstraint.multiplier, 1)
        XCTAssertEqual(widthConstraint.constant, 0)
        XCTAssertEqual(widthConstraint.priority, UILayoutPriorityRequired)
        
        XCTAssertTrue(heightConstraint.isActive)
        XCTAssertEqual(heightConstraint.firstItem as? UIView, firstView)
        XCTAssertEqual(heightConstraint.firstAttribute, NSLayoutAttribute.height)
        XCTAssertEqual(heightConstraint.relation, NSLayoutRelation.equal)
        XCTAssertEqual(heightConstraint.secondItem as? UIView, rootView)
        XCTAssertEqual(heightConstraint.secondAttribute, NSLayoutAttribute.height)
        XCTAssertEqual(heightConstraint.multiplier, 1)
        XCTAssertEqual(heightConstraint.constant, 0)
        XCTAssertEqual(heightConstraint.priority, UILayoutPriorityRequired)
    }
}
