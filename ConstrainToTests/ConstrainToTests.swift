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
        
        let constraint = firstView.constrain(.Width, to: width)
        
        XCTAssertTrue(constraint.active)
        XCTAssertEqual(constraint.firstItem as? UIView, firstView)
        XCTAssertEqual(constraint.firstAttribute, NSLayoutAttribute.Width)
        XCTAssertEqual(constraint.relation, NSLayoutRelation.Equal)
        XCTAssertNil(constraint.secondItem)
        XCTAssertEqual(constraint.secondAttribute, NSLayoutAttribute.NotAnAttribute)
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
        
        let constraint = firstView.constrain(.Width, to: width, priority: priority)
        
        XCTAssertTrue(constraint.active)
        XCTAssertEqual(constraint.firstItem as? UIView, firstView)
        XCTAssertEqual(constraint.firstAttribute, NSLayoutAttribute.Width)
        XCTAssertEqual(constraint.relation, NSLayoutRelation.Equal)
        XCTAssertNil(constraint.secondItem)
        XCTAssertEqual(constraint.secondAttribute, NSLayoutAttribute.NotAnAttribute)
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
        
        XCTAssertTrue(widthConstraint.active)
        XCTAssertEqual(widthConstraint.firstItem as? UIView, firstView)
        XCTAssertEqual(widthConstraint.firstAttribute, NSLayoutAttribute.Width)
        XCTAssertEqual(widthConstraint.relation, NSLayoutRelation.Equal)
        XCTAssertNil(widthConstraint.secondItem)
        XCTAssertEqual(widthConstraint.secondAttribute, NSLayoutAttribute.NotAnAttribute)
        XCTAssertEqual(widthConstraint.multiplier, 1)
        XCTAssertEqual(widthConstraint.constant, width)
        XCTAssertEqual(widthConstraint.priority, UILayoutPriorityRequired)
        
        XCTAssertTrue(heightConstraint.active)
        XCTAssertEqual(heightConstraint.firstItem as? UIView, firstView)
        XCTAssertEqual(heightConstraint.firstAttribute, NSLayoutAttribute.Height)
        XCTAssertEqual(heightConstraint.relation, NSLayoutRelation.Equal)
        XCTAssertNil(heightConstraint.secondItem)
        XCTAssertEqual(heightConstraint.secondAttribute, NSLayoutAttribute.NotAnAttribute)
        XCTAssertEqual(heightConstraint.multiplier, 1)
        XCTAssertEqual(heightConstraint.constant, height)
        XCTAssertEqual(heightConstraint.priority, UILayoutPriorityRequired)
    }
    
    func testConstrainToView() {
        let rootView = UIView(frame: CGRect.zero)
        let firstView = UIView(frame: CGRect.zero)
        rootView.addSubview(firstView)
        
        let (topConstraint, leftConstraint, bottomConstraint, rightConstraint) = firstView.constrain(to: rootView)
        
        XCTAssertTrue(topConstraint.active)
        XCTAssertEqual(topConstraint.firstItem as? UIView, firstView)
        XCTAssertEqual(topConstraint.firstAttribute, NSLayoutAttribute.Top)
        XCTAssertEqual(topConstraint.relation, NSLayoutRelation.Equal)
        XCTAssertEqual(topConstraint.secondItem as? UIView, rootView)
        XCTAssertEqual(topConstraint.secondAttribute, NSLayoutAttribute.Top)
        XCTAssertEqual(topConstraint.multiplier, 1)
        XCTAssertEqual(topConstraint.constant, 0)
        XCTAssertEqual(topConstraint.priority, UILayoutPriorityRequired)
        
        XCTAssertTrue(leftConstraint.active)
        XCTAssertEqual(leftConstraint.firstItem as? UIView, firstView)
        XCTAssertEqual(leftConstraint.firstAttribute, NSLayoutAttribute.Left)
        XCTAssertEqual(leftConstraint.relation, NSLayoutRelation.Equal)
        XCTAssertEqual(leftConstraint.secondItem as? UIView, rootView)
        XCTAssertEqual(leftConstraint.secondAttribute, NSLayoutAttribute.Left)
        XCTAssertEqual(leftConstraint.multiplier, 1)
        XCTAssertEqual(leftConstraint.constant, 0)
        XCTAssertEqual(leftConstraint.priority, UILayoutPriorityRequired)
        
        XCTAssertTrue(bottomConstraint.active)
        XCTAssertEqual(bottomConstraint.firstItem as? UIView, firstView)
        XCTAssertEqual(bottomConstraint.firstAttribute, NSLayoutAttribute.Bottom)
        XCTAssertEqual(bottomConstraint.relation, NSLayoutRelation.Equal)
        XCTAssertEqual(bottomConstraint.secondItem as? UIView, rootView)
        XCTAssertEqual(bottomConstraint.secondAttribute, NSLayoutAttribute.Bottom)
        XCTAssertEqual(bottomConstraint.multiplier, 1)
        XCTAssertEqual(bottomConstraint.constant, 0)
        XCTAssertEqual(bottomConstraint.priority, UILayoutPriorityRequired)
        
        XCTAssertTrue(rightConstraint.active)
        XCTAssertEqual(rightConstraint.firstItem as? UIView, firstView)
        XCTAssertEqual(rightConstraint.firstAttribute, NSLayoutAttribute.Right)
        XCTAssertEqual(rightConstraint.relation, NSLayoutRelation.Equal)
        XCTAssertEqual(rightConstraint.secondItem as? UIView, rootView)
        XCTAssertEqual(rightConstraint.secondAttribute, NSLayoutAttribute.Right)
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
        
        XCTAssertTrue(topConstraint.active)
        XCTAssertEqual(topConstraint.firstItem as? UIView, firstView)
        XCTAssertEqual(topConstraint.firstAttribute, NSLayoutAttribute.Top)
        XCTAssertEqual(topConstraint.relation, NSLayoutRelation.Equal)
        XCTAssertEqual(topConstraint.secondItem as? UIView, rootView)
        XCTAssertEqual(topConstraint.secondAttribute, NSLayoutAttribute.Top)
        XCTAssertEqual(topConstraint.multiplier, 1)
        XCTAssertEqual(topConstraint.constant, top)
        XCTAssertEqual(topConstraint.priority, UILayoutPriorityRequired)
        
        XCTAssertTrue(leftConstraint.active)
        XCTAssertEqual(leftConstraint.firstItem as? UIView, firstView)
        XCTAssertEqual(leftConstraint.firstAttribute, NSLayoutAttribute.Left)
        XCTAssertEqual(leftConstraint.relation, NSLayoutRelation.Equal)
        XCTAssertEqual(leftConstraint.secondItem as? UIView, rootView)
        XCTAssertEqual(leftConstraint.secondAttribute, NSLayoutAttribute.Left)
        XCTAssertEqual(leftConstraint.multiplier, 1)
        XCTAssertEqual(leftConstraint.constant, left)
        XCTAssertEqual(leftConstraint.priority, UILayoutPriorityRequired)
        
        XCTAssertTrue(bottomConstraint.active)
        XCTAssertEqual(bottomConstraint.firstItem as? UIView, firstView)
        XCTAssertEqual(bottomConstraint.firstAttribute, NSLayoutAttribute.Bottom)
        XCTAssertEqual(bottomConstraint.relation, NSLayoutRelation.Equal)
        XCTAssertEqual(bottomConstraint.secondItem as? UIView, rootView)
        XCTAssertEqual(bottomConstraint.secondAttribute, NSLayoutAttribute.Bottom)
        XCTAssertEqual(bottomConstraint.multiplier, 1)
        XCTAssertEqual(bottomConstraint.constant, -bottom)
        XCTAssertEqual(bottomConstraint.priority, UILayoutPriorityRequired)
        
        XCTAssertTrue(rightConstraint.active)
        XCTAssertEqual(rightConstraint.firstItem as? UIView, firstView)
        XCTAssertEqual(rightConstraint.firstAttribute, NSLayoutAttribute.Right)
        XCTAssertEqual(rightConstraint.relation, NSLayoutRelation.Equal)
        XCTAssertEqual(rightConstraint.secondItem as? UIView, rootView)
        XCTAssertEqual(rightConstraint.secondAttribute, NSLayoutAttribute.Right)
        XCTAssertEqual(rightConstraint.multiplier, 1)
        XCTAssertEqual(rightConstraint.constant, -right)
        XCTAssertEqual(rightConstraint.priority, UILayoutPriorityRequired)
    }
    
    func testConstrainToEdgesOfView() {
        let rootView = UIView(frame: CGRect.zero)
        let firstView = UIView(frame: CGRect.zero)
        rootView.addSubview(firstView)
        
        let (topConstraint, leadingConstraint, bottomConstraint, trailingConstraint) = firstView.constrain(toEdgesOf: rootView)
        
        XCTAssertTrue(topConstraint.active)
        XCTAssertEqual(topConstraint.firstItem as? UIView, firstView)
        XCTAssertEqual(topConstraint.firstAttribute, NSLayoutAttribute.Top)
        XCTAssertEqual(topConstraint.relation, NSLayoutRelation.Equal)
        XCTAssertEqual(topConstraint.secondItem as? UIView, rootView)
        XCTAssertEqual(topConstraint.secondAttribute, NSLayoutAttribute.Top)
        XCTAssertEqual(topConstraint.multiplier, 1)
        XCTAssertEqual(topConstraint.constant, 0)
        XCTAssertEqual(topConstraint.priority, UILayoutPriorityRequired)
        
        XCTAssertTrue(leadingConstraint.active)
        XCTAssertEqual(leadingConstraint.firstItem as? UIView, firstView)
        XCTAssertEqual(leadingConstraint.firstAttribute, NSLayoutAttribute.Leading)
        XCTAssertEqual(leadingConstraint.relation, NSLayoutRelation.Equal)
        XCTAssertEqual(leadingConstraint.secondItem as? UIView, rootView)
        XCTAssertEqual(leadingConstraint.secondAttribute, NSLayoutAttribute.Leading)
        XCTAssertEqual(leadingConstraint.multiplier, 1)
        XCTAssertEqual(leadingConstraint.constant, 0)
        XCTAssertEqual(leadingConstraint.priority, UILayoutPriorityRequired)
        
        XCTAssertTrue(bottomConstraint.active)
        XCTAssertEqual(bottomConstraint.firstItem as? UIView, firstView)
        XCTAssertEqual(bottomConstraint.firstAttribute, NSLayoutAttribute.Bottom)
        XCTAssertEqual(bottomConstraint.relation, NSLayoutRelation.Equal)
        XCTAssertEqual(bottomConstraint.secondItem as? UIView, rootView)
        XCTAssertEqual(bottomConstraint.secondAttribute, NSLayoutAttribute.Bottom)
        XCTAssertEqual(bottomConstraint.multiplier, 1)
        XCTAssertEqual(bottomConstraint.constant, 0)
        XCTAssertEqual(bottomConstraint.priority, UILayoutPriorityRequired)
        
        XCTAssertTrue(trailingConstraint.active)
        XCTAssertEqual(trailingConstraint.firstItem as? UIView, firstView)
        XCTAssertEqual(trailingConstraint.firstAttribute, NSLayoutAttribute.Trailing)
        XCTAssertEqual(trailingConstraint.relation, NSLayoutRelation.Equal)
        XCTAssertEqual(trailingConstraint.secondItem as? UIView, rootView)
        XCTAssertEqual(trailingConstraint.secondAttribute, NSLayoutAttribute.Trailing)
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
        
        XCTAssertTrue(topConstraint.active)
        XCTAssertEqual(topConstraint.firstItem as? UIView, firstView)
        XCTAssertEqual(topConstraint.firstAttribute, NSLayoutAttribute.Top)
        XCTAssertEqual(topConstraint.relation, NSLayoutRelation.Equal)
        XCTAssertEqual(topConstraint.secondItem as? UIView, rootView)
        XCTAssertEqual(topConstraint.secondAttribute, NSLayoutAttribute.Top)
        XCTAssertEqual(topConstraint.multiplier, 1)
        XCTAssertEqual(topConstraint.constant, top)
        XCTAssertEqual(topConstraint.priority, UILayoutPriorityRequired)
        
        XCTAssertTrue(leadingConstraint.active)
        XCTAssertEqual(leadingConstraint.firstItem as? UIView, firstView)
        XCTAssertEqual(leadingConstraint.firstAttribute, NSLayoutAttribute.Leading)
        XCTAssertEqual(leadingConstraint.relation, NSLayoutRelation.Equal)
        XCTAssertEqual(leadingConstraint.secondItem as? UIView, rootView)
        XCTAssertEqual(leadingConstraint.secondAttribute, NSLayoutAttribute.Leading)
        XCTAssertEqual(leadingConstraint.multiplier, 1)
        XCTAssertEqual(leadingConstraint.constant, leading)
        XCTAssertEqual(leadingConstraint.priority, UILayoutPriorityRequired)
        
        XCTAssertTrue(bottomConstraint.active)
        XCTAssertEqual(bottomConstraint.firstItem as? UIView, firstView)
        XCTAssertEqual(bottomConstraint.firstAttribute, NSLayoutAttribute.Bottom)
        XCTAssertEqual(bottomConstraint.relation, NSLayoutRelation.Equal)
        XCTAssertEqual(bottomConstraint.secondItem as? UIView, rootView)
        XCTAssertEqual(bottomConstraint.secondAttribute, NSLayoutAttribute.Bottom)
        XCTAssertEqual(bottomConstraint.multiplier, 1)
        XCTAssertEqual(bottomConstraint.constant, -bottom)
        XCTAssertEqual(bottomConstraint.priority, UILayoutPriorityRequired)
        
        XCTAssertTrue(trailingConstraint.active)
        XCTAssertEqual(trailingConstraint.firstItem as? UIView, firstView)
        XCTAssertEqual(trailingConstraint.firstAttribute, NSLayoutAttribute.Trailing)
        XCTAssertEqual(trailingConstraint.relation, NSLayoutRelation.Equal)
        XCTAssertEqual(trailingConstraint.secondItem as? UIView, rootView)
        XCTAssertEqual(trailingConstraint.secondAttribute, NSLayoutAttribute.Trailing)
        XCTAssertEqual(trailingConstraint.multiplier, 1)
        XCTAssertEqual(trailingConstraint.constant, -trailing)
        XCTAssertEqual(trailingConstraint.priority, UILayoutPriorityRequired)
    }
    
    func testConstrainToMarginsOfView() {
        let rootView = UIView(frame: CGRect.zero)
        let firstView = UIView(frame: CGRect.zero)
        rootView.addSubview(firstView)
        
        let (topMarginConstraint, leadingMarginConstraint, bottomMarginConstraint, trailingMarginConstraint) = firstView.constrain(toMarginsOf: rootView)
        
        XCTAssertTrue(topMarginConstraint.active)
        XCTAssertEqual(topMarginConstraint.firstItem as? UIView, firstView)
        XCTAssertEqual(topMarginConstraint.firstAttribute, NSLayoutAttribute.TopMargin)
        XCTAssertEqual(topMarginConstraint.relation, NSLayoutRelation.Equal)
        XCTAssertEqual(topMarginConstraint.secondItem as? UIView, rootView)
        XCTAssertEqual(topMarginConstraint.secondAttribute, NSLayoutAttribute.TopMargin)
        XCTAssertEqual(topMarginConstraint.multiplier, 1)
        XCTAssertEqual(topMarginConstraint.constant, 0)
        XCTAssertEqual(topMarginConstraint.priority, UILayoutPriorityRequired)
        
        XCTAssertTrue(leadingMarginConstraint.active)
        XCTAssertEqual(leadingMarginConstraint.firstItem as? UIView, firstView)
        XCTAssertEqual(leadingMarginConstraint.firstAttribute, NSLayoutAttribute.LeadingMargin)
        XCTAssertEqual(leadingMarginConstraint.relation, NSLayoutRelation.Equal)
        XCTAssertEqual(leadingMarginConstraint.secondItem as? UIView, rootView)
        XCTAssertEqual(leadingMarginConstraint.secondAttribute, NSLayoutAttribute.LeadingMargin)
        XCTAssertEqual(leadingMarginConstraint.multiplier, 1)
        XCTAssertEqual(leadingMarginConstraint.constant, 0)
        XCTAssertEqual(leadingMarginConstraint.priority, UILayoutPriorityRequired)
        
        XCTAssertTrue(bottomMarginConstraint.active)
        XCTAssertEqual(bottomMarginConstraint.firstItem as? UIView, firstView)
        XCTAssertEqual(bottomMarginConstraint.firstAttribute, NSLayoutAttribute.BottomMargin)
        XCTAssertEqual(bottomMarginConstraint.relation, NSLayoutRelation.Equal)
        XCTAssertEqual(bottomMarginConstraint.secondItem as? UIView, rootView)
        XCTAssertEqual(bottomMarginConstraint.secondAttribute, NSLayoutAttribute.BottomMargin)
        XCTAssertEqual(bottomMarginConstraint.multiplier, 1)
        XCTAssertEqual(bottomMarginConstraint.constant, 0)
        XCTAssertEqual(bottomMarginConstraint.priority, UILayoutPriorityRequired)
        
        XCTAssertTrue(trailingMarginConstraint.active)
        XCTAssertEqual(trailingMarginConstraint.firstItem as? UIView, firstView)
        XCTAssertEqual(trailingMarginConstraint.firstAttribute, NSLayoutAttribute.TrailingMargin)
        XCTAssertEqual(trailingMarginConstraint.relation, NSLayoutRelation.Equal)
        XCTAssertEqual(trailingMarginConstraint.secondItem as? UIView, rootView)
        XCTAssertEqual(trailingMarginConstraint.secondAttribute, NSLayoutAttribute.TrailingMargin)
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
        
        XCTAssertTrue(topMarginConstraint.active)
        XCTAssertEqual(topMarginConstraint.firstItem as? UIView, firstView)
        XCTAssertEqual(topMarginConstraint.firstAttribute, NSLayoutAttribute.TopMargin)
        XCTAssertEqual(topMarginConstraint.relation, NSLayoutRelation.Equal)
        XCTAssertEqual(topMarginConstraint.secondItem as? UIView, rootView)
        XCTAssertEqual(topMarginConstraint.secondAttribute, NSLayoutAttribute.TopMargin)
        XCTAssertEqual(topMarginConstraint.multiplier, 1)
        XCTAssertEqual(topMarginConstraint.constant, topMargin)
        XCTAssertEqual(topMarginConstraint.priority, UILayoutPriorityRequired)
        
        XCTAssertTrue(leadingMarginConstraint.active)
        XCTAssertEqual(leadingMarginConstraint.firstItem as? UIView, firstView)
        XCTAssertEqual(leadingMarginConstraint.firstAttribute, NSLayoutAttribute.LeadingMargin)
        XCTAssertEqual(leadingMarginConstraint.relation, NSLayoutRelation.Equal)
        XCTAssertEqual(leadingMarginConstraint.secondItem as? UIView, rootView)
        XCTAssertEqual(leadingMarginConstraint.secondAttribute, NSLayoutAttribute.LeadingMargin)
        XCTAssertEqual(leadingMarginConstraint.multiplier, 1)
        XCTAssertEqual(leadingMarginConstraint.constant, leadingMargin)
        XCTAssertEqual(leadingMarginConstraint.priority, UILayoutPriorityRequired)
        
        XCTAssertTrue(bottomMarginConstraint.active)
        XCTAssertEqual(bottomMarginConstraint.firstItem as? UIView, firstView)
        XCTAssertEqual(bottomMarginConstraint.firstAttribute, NSLayoutAttribute.BottomMargin)
        XCTAssertEqual(bottomMarginConstraint.relation, NSLayoutRelation.Equal)
        XCTAssertEqual(bottomMarginConstraint.secondItem as? UIView, rootView)
        XCTAssertEqual(bottomMarginConstraint.secondAttribute, NSLayoutAttribute.BottomMargin)
        XCTAssertEqual(bottomMarginConstraint.multiplier, 1)
        XCTAssertEqual(bottomMarginConstraint.constant, -bottomMargin)
        XCTAssertEqual(bottomMarginConstraint.priority, UILayoutPriorityRequired)
        
        XCTAssertTrue(trailingMarginConstraint.active)
        XCTAssertEqual(trailingMarginConstraint.firstItem as? UIView, firstView)
        XCTAssertEqual(trailingMarginConstraint.firstAttribute, NSLayoutAttribute.TrailingMargin)
        XCTAssertEqual(trailingMarginConstraint.relation, NSLayoutRelation.Equal)
        XCTAssertEqual(trailingMarginConstraint.secondItem as? UIView, rootView)
        XCTAssertEqual(trailingMarginConstraint.secondAttribute, NSLayoutAttribute.TrailingMargin)
        XCTAssertEqual(trailingMarginConstraint.multiplier, 1)
        XCTAssertEqual(trailingMarginConstraint.constant, -trailingMargin)
        XCTAssertEqual(trailingMarginConstraint.priority, UILayoutPriorityRequired)
    }
    
    func testConstrainToCenterOfView() {
        let rootView = UIView(frame: CGRect.zero)
        let firstView = UIView(frame: CGRect.zero)
        rootView.addSubview(firstView)
        
        let (xConstraint, yConstraint) = firstView.constrain(toCenterOf: rootView)
        
        XCTAssertTrue(xConstraint.active)
        XCTAssertEqual(xConstraint.firstItem as? UIView, firstView)
        XCTAssertEqual(xConstraint.firstAttribute, NSLayoutAttribute.CenterX)
        XCTAssertEqual(xConstraint.relation, NSLayoutRelation.Equal)
        XCTAssertEqual(xConstraint.secondItem as? UIView, rootView)
        XCTAssertEqual(xConstraint.secondAttribute, NSLayoutAttribute.CenterX)
        XCTAssertEqual(xConstraint.multiplier, 1)
        XCTAssertEqual(xConstraint.constant, 0)
        XCTAssertEqual(xConstraint.priority, UILayoutPriorityRequired)
        
        XCTAssertTrue(yConstraint.active)
        XCTAssertEqual(yConstraint.firstItem as? UIView, firstView)
        XCTAssertEqual(yConstraint.firstAttribute, NSLayoutAttribute.CenterY)
        XCTAssertEqual(yConstraint.relation, NSLayoutRelation.Equal)
        XCTAssertEqual(yConstraint.secondItem as? UIView, rootView)
        XCTAssertEqual(yConstraint.secondAttribute, NSLayoutAttribute.CenterY)
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
        
        XCTAssertTrue(xConstraint.active)
        XCTAssertEqual(xConstraint.firstItem as? UIView, firstView)
        XCTAssertEqual(xConstraint.firstAttribute, NSLayoutAttribute.CenterX)
        XCTAssertEqual(xConstraint.relation, NSLayoutRelation.Equal)
        XCTAssertEqual(xConstraint.secondItem as? UIView, rootView)
        XCTAssertEqual(xConstraint.secondAttribute, NSLayoutAttribute.CenterX)
        XCTAssertEqual(xConstraint.multiplier, 1)
        XCTAssertEqual(xConstraint.constant, xOffset)
        XCTAssertEqual(xConstraint.priority, UILayoutPriorityRequired)
        
        XCTAssertTrue(yConstraint.active)
        XCTAssertEqual(yConstraint.firstItem as? UIView, firstView)
        XCTAssertEqual(yConstraint.firstAttribute, NSLayoutAttribute.CenterY)
        XCTAssertEqual(yConstraint.relation, NSLayoutRelation.Equal)
        XCTAssertEqual(yConstraint.secondItem as? UIView, rootView)
        XCTAssertEqual(yConstraint.secondAttribute, NSLayoutAttribute.CenterY)
        XCTAssertEqual(yConstraint.multiplier, 1)
        XCTAssertEqual(yConstraint.constant, yOffset)
        XCTAssertEqual(yConstraint.priority, UILayoutPriorityRequired)
    }
    
    func testConstrainToSizeOfView() {
        let rootView = UIView(frame: CGRect.zero)
        let firstView = UIView(frame: CGRect.zero)
        rootView.addSubview(firstView)
        
        let (widthConstraint, heightConstraint) = firstView.constrain(toSizeOf: rootView)
        
        XCTAssertTrue(widthConstraint.active)
        XCTAssertEqual(widthConstraint.firstItem as? UIView, firstView)
        XCTAssertEqual(widthConstraint.firstAttribute, NSLayoutAttribute.Width)
        XCTAssertEqual(widthConstraint.relation, NSLayoutRelation.Equal)
        XCTAssertEqual(widthConstraint.secondItem as? UIView, rootView)
        XCTAssertEqual(widthConstraint.secondAttribute, NSLayoutAttribute.Width)
        XCTAssertEqual(widthConstraint.multiplier, 1)
        XCTAssertEqual(widthConstraint.constant, 0)
        XCTAssertEqual(widthConstraint.priority, UILayoutPriorityRequired)
        
        XCTAssertTrue(heightConstraint.active)
        XCTAssertEqual(heightConstraint.firstItem as? UIView, firstView)
        XCTAssertEqual(heightConstraint.firstAttribute, NSLayoutAttribute.Height)
        XCTAssertEqual(heightConstraint.relation, NSLayoutRelation.Equal)
        XCTAssertEqual(heightConstraint.secondItem as? UIView, rootView)
        XCTAssertEqual(heightConstraint.secondAttribute, NSLayoutAttribute.Height)
        XCTAssertEqual(heightConstraint.multiplier, 1)
        XCTAssertEqual(heightConstraint.constant, 0)
        XCTAssertEqual(heightConstraint.priority, UILayoutPriorityRequired)
    }
}
