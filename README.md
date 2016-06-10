# ConstrainTo

[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

**ConstrainTo** is a simple and tiny extension to `UIView`, that aims to simplify the common usecases of _AutoLayout_ without trying to introduce new paradigms.

**ConstrainTo** removes a lot of boiler plate code by automatically:

- Setting `translatesAutoresizingMaskIntoConstraints` to `false` on the view being constrained
- Activating created constraints by setting `active` to `true`
- Returning all constraints that have been created in case you need access to them in the future

**ConstrainTo** has 2 main methods:

```swift
public func constrain(attribute: NSLayoutAttribute, being relation: NSLayoutRelation = .Equal, to viewAttribute: NSLayoutAttribute, of view: UIView, multipliedBy multiplier: CGFloat = 1.0, offsetBy offset: CGFloat = 0.0) -> NSLayoutConstraint

public func constrain(attribute: NSLayoutAttribute, to constant: CGFloat) -> NSLayoutConstraint
```

In addition to 3 convinience methods:

```swift
public func constrain(to size: CGSize) -> (width: NSLayoutConstraint, height: NSLayoutConstraint)

public func constrain(to view: UIView, insetBy insets: UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)) -> (top: NSLayoutConstraint, left: NSLayoutConstraint, bottom: NSLayoutConstraint, right: NSLayoutConstraint)

public func constrain(toMarginsOf view: UIView, insetBy insets: UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)) -> (topMargin: NSLayoutConstraint, leadingMargin: NSLayoutConstraint, bottomMargin: NSLayoutConstraint, trailingMargin: NSLayoutConstraint)  {

public func constrain(toCenterOf view: UIView) -> (horizontal: NSLayoutConstraint, vertical: NSLayoutConstraint)
```

## Examples

## Constrain an attibute to the attribute of another view

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
redView.constrain(.Width, to: 20)
```

### Constrain size

If you want to constrain the size of `redView` to 20 x 20 pts you would need to write:

```swift
redView.constrain(to: CGSize(x: 20, y: 20))
```

### Constrain to another view's frame

If you want to constrain the frame of `redView` to that of `blueView` you would need to write:

```swift
redView.constrain(to: blueView, insetBy: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
```
But because of default parameters you just need to write:

```swift
redView.constrain(to: blueView)
```

If you want to constrain the frame of `redView` to be inset 10 pts to all edges of `blueView` you would need to write:

```swift
redView.constrain(to: blueView, insetBy: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))

### Constrain to another view's margins

If you want to constrain the margin's of `redView` to that of `blueView` you would need to write:

```swift
redView.constrain(toMarginsOf: blueView, insetBy: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
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
redView.constrain(toCenterOf: blueView)
```

