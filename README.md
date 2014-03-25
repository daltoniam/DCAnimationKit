DCAnimationKit
==============

A collection of animations for iOS. Simple, just add water animations. DCAnimationKit is a category on UIView to make animations easy to preform.

## Examples ##

All our examples will use this as a base.
```objc
self.moveLabel = [[UILabel alloc] initWithFrame:CGRectMake(80, 85, 200, 100)];
self.moveLabel.backgroundColor = [UIColor clearColor];
self.moveLabel.text = NSLocalizedString(@"Animate!", nil);
self.moveLabel.font = [UIFont systemFontOfSize:36];
[self.moveLabel sizeToFit];
[self.view addSubview:self.moveLabel];

self.moveView = [[UIView alloc] initWithFrame:CGRectMake(40, 165, 200, 100)];
self.moveView.backgroundColor = [UIColor orangeColor];
[self.view addSubview:self.moveView];
```

## Intros

## Attention getters

## Tada
![alt tag](https://raw.github.com/daltoniam/DCAnimationKit/master/gifs/tada.gif)

our method to run tada.
```objc
[self.moveView tada:NULL];
[self.moveLabel tada:NULL];
```
## outros


## Install ##

The recommended approach for installing DCAnimationKit is via the CocoaPods package manager, as it provides flexible dependency management and dead simple installation.

via CocoaPods

Install CocoaPods if not already available:

	$ [sudo] gem install cocoapods
	$ pod setup
Change to the directory of your Xcode project, and Create and Edit your Podfile and add DCAnimationKit:

	$ cd /path/to/MyProject
	$ touch Podfile
	$ edit Podfile
	platform :ios, '7.0'
	pod 'DCAnimationKit'

Install into your project:

	$ pod install

Open your project in Xcode from the .xcworkspace file (not the usual project file)

## Requirements ##

DCAnimationKit requires at least iOS 7 or above.


## License ##

DCAnimationKit is license under the Apache License.

## Contact ##

### Dalton Cherry ###
* https://github.com/daltoniam
* http://twitter.com/daltoniam
