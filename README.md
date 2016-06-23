# ConstrainTo

[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Cocoapods Compatible](https://cocoapod-badges.herokuapp.com/v/ConstrainTo/badge.png)](https://cocoapods.org)

**ConstrainTo** is a simple and tiny extension to `UIView`, that aims to simplify the common use cases of _AutoLayout_ without trying to introduce new paradigms.

**ConstrainTo** removes a lot of boiler plate code by automatically:

- Setting `translatesAutoresizingMaskIntoConstraints` to `false` on the view being constrained
- Activating created constraints by setting `active` to `true`
- Returning all constraints that have been created in case you need access to them in the future

**ConstrainTo** has 2 main methods:

```swift
public func constrain(attribute: NSLayoutAttribute, being relation: NSLayoutRelation = .Equal, to viewAttribute: NSLayoutAttribute, of view: UIView, multipliedBy multiplier: CGFloat = 1.0, offsetBy offset: CGFloat = 0.0) -> NSLayoutConstraint

public func constrain(attribute: NSLayoutAttribute, being relation: NSLayoutRelation = .Equal, to constant: CGFloat) -> NSLayoutConstraint
```

In addition to 6 convenience methods:

```swift
public func constrain(to size: CGSize) -> (width: NSLayoutConstraintConstraint, heightConstraint: NSLayoutConstraint)

public func constrain(to view: UIView, insetBy insets: UIEdgeInsets = UIEdgeInsetsZero) -> (topConstraint: NSLayoutConstraint, leftConstraint: NSLayoutConstraint, bottomConstraint: NSLayoutConstraint, rightConstraint: NSLayoutConstraint)

public func constrain(toEdgesOf view: UIView, insetBy insets: UIEdgeInsets = UIEdgeInsetsZero) -> (topConstraint: NSLayoutConstraint, leadingConstraint: NSLayoutConstraint, bottomConstraint: NSLayoutConstraint, trailingConstraint: NSLayoutConstraint)

public func constrain(toMarginsOf view: UIView, insetBy insets: UIEdgeInsets = UIEdgeInsetsZero) -> (topMarginConstraint: NSLayoutConstraint, leadingMarginConstraint: NSLayoutConstraint, bottomMarginConstraint: NSLayoutConstraint, trailingMarginConstraint: NSLayoutConstraint)

public func constrain(toCenterOf view: UIView, offsetBy offsets: CGPoint = CGPoint.zero) -> (xConstraint: NSLayoutConstraint, yConstraint: NSLayoutConstraint)

public func constrain(toSizeOf view: UIView) -> (widthConstraint: NSLayoutConstraint, heightConstraint: NSLayoutConstraint)

```

## Examples

## Constrain an attribute to the attribute of another view

If you wanted the left of `redView` to be to the right of `blueView` you would need to write:

```swift
redView.constrain(.Left, being: .Equal, to: .Right, of: blueView, multipliedBy: 1, offsetBy: 0)
```

But because of default parameters you just need to write:

```swift
redView.constrain(.Left, to: .Right, of: blueView)
```

If you wanted the left of `redView` to be 10 pts to the right of `blueView` you would need to write:

```swift
redView.constrain(.Left, to: .Right, of: blueView, offsetBy: 10)
```
### Constrain an attribute

If you want to constrain the width of `redView` to 20 pts you would need to write:

```swift
redView.constrain(.Width, being: .Equal, to: 20)
```

But because of default parameters you just need to write:

```swift
redView.constrain(.Width, to: 20)
```

### Constrain size

If you want to constrain the size of `redView` to 20 x 20 pts you would need to write:

```swift
redView.constrain(to: CGSize(width: 20, height: 20))
```

### Constrain to another view's frame

If you want to constrain the frame (top, left, bottom and right) of `redView` to that of `blueView` you would need to write:

```swift
redView.constrain(to: blueView, insetBy: UIEdgeInsetsZero)
```
But because of default parameters you just need to write:

```swift
redView.constrain(to: blueView)
```

If you want to constrain the frame of `redView` to be inset 10 pts to all edges of `blueView` you would need to write:

```swift
redView.constrain(to: blueView, insetBy: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
```
### Constrain to another view's edges

If you want to constrain the edges (top, leading, bottom and trailing) of `redView` to that of `blueView` you would need to write:

```swift
redView.constrain(toEdgesOf: blueView, insetBy: UIEdgeInsetsZero)
```
But because of default parameters you just need to write:

```swift
redView.constrain(toEdgesOf: blueView)
```

If you want to constrain the edges of `redView` to be inset 10 pts to all edges of `blueView` you would need to write:

```swift
redView.constrain(toEdgesOf: blueView, insetBy: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
```

### Constrain to another view's margins

If you want to constrain the margins (top margin, leading margin, bottom margin and trailing margin) of `redView` to that of `blueView` you would need to write:

```swift
redView.constrain(toMarginsOf: blueView, insetBy: UIEdgeInsetsZero)
```
But because of default parameters you just need to write:

```swift
redView.constrain(toMarginsOf: blueView)
```

If you want to constrain the margin's of `redView` to be inset 10 pts to all edges of `blueView` you would need to write:

```swift
redView.constrain(toMarginsOf: blueView, insetBy: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
```
### Constrain to the center of another view

If you want to constrain `redView` to be centered in `blueView` you would need to write:

```swift
redView.constrain(toCenterOf: blueView, offsetBy: CGPoint.zero)
```

But because of default parameters you just need to write:

```swift
redView.constrain(toCenterOf: blueView)
```

If you want to constrain the center of `redView` to be 10 pts to below the center `blueView` you would need to write:

```swift
redView.constrain(toCenterOf: blueView, offsetBy: CGPoint(x: 0, y: 10))
```

### Constrain to another view's size

If you want to constrain the size of `redView` to the size of `blueView` you would need to write:

```swift
redView.constrain(toSizeOf: blueView)
```
