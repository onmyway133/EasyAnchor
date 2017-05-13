# Anchors

[![CI Status](http://img.shields.io/travis/onmyway133/Anchors.svg?style=flat)](https://travis-ci.org/onmyway133/Anchors)
[![Version](https://img.shields.io/cocoapods/v/Anchors.svg?style=flat)](http://cocoadocs.org/docsets/Anchors)
[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![License](https://img.shields.io/cocoapods/l/Anchors.svg?style=flat)](http://cocoadocs.org/docsets/Anchors)
[![Platform](https://img.shields.io/cocoapods/p/Anchors.svg?style=flat)](http://cocoadocs.org/docsets/Anchors)
![Swift](https://img.shields.io/badge/%20in-swift%203.0-orange.svg)

![](Screenshots/Artboard.png)

## Story

I like to build view in code, so Auto Layout is my definite choice. The syntax has improved over the years, but I always want to do it with minimum effort. More repetitive code makes you tend to do copy paste and produce more bugs.

### Auto Layout APIs history

How new APIs were introduced over the years, so you know to set your deployment target

- `NSLayoutConstraint` since iOS 6, macOS 10.7
- `isActive` since iOS 8, macOS 10.10
- `NSLayoutAnchor`, `UI|NSLayoutGuide` since iOS 9, macOS 10.11

### Do you need a another Auto Layout framework?

All the Auto Layout frameworks you see are just convenient ways to build `NSLayoutConstraint`, in fact these are what you normally need

- Call `addSubview` so that view is in hierarchy
- Set `translatesAutoresizingMaskIntoConstraints = false`
- Set `isActive = true` to enable constraints

**Anchors** can do much more for you

## Features

- [x] Fluent builder syntax
- [x] Easy to customize with protocol based
- [x] Support iOS 9+, macOS 10.11+
- [x] Update and reset constraints
- [x] Find existing constraints
- [ ] Debug constraints
- [ ] Visualize constraints

## Basic with Anchor

## Animation

## Update constraints with Group

## Find existing constraints

## Customize with ConstraintProducer

## Build quickly with Builder 

## Installation

**Anchors** is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'Anchors'
```

**Anchors** is also available through [Carthage](https://github.com/Carthage/Carthage).
To install just write into your Cartfile:

```ruby
github "onmyway133/Anchors"
```

**Anchors** can also be installed manually. Just download and drop `Sources` folders in your project.

## Author

Khoa Pham, onmyway133@gmail.com

## Contributing

We would love you to contribute to **Anchors**, check the [CONTRIBUTING](https://github.com/onmyway133/Anchors/blob/master/CONTRIBUTING.md) file for more info.

## License

**Anchors** is available under the MIT license. See the [LICENSE](https://github.com/onmyway133/Anchors/blob/master/LICENSE.md) file for more info.
