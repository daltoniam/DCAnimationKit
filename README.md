DCAnimationKit
==============

A collection of animations for iOS Simply, just add water! DCAnimationKit is a category on UIView to make animations easy to perform.

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

## Attention getters

### Tada
![alt tag](https://raw.github.com/daltoniam/DCAnimationKit/master/gifs/tada.gif)

our method to run tada.
```objc
[self.moveView tada:NULL];
[self.moveLabel tada:NULL];
```

### Bounce
![alt tag](https://raw.github.com/daltoniam/DCAnimationKit/master/gifs/bounce.gif)

our method to run bounce.
```objc
[self.moveView bounce:NULL];
[self.moveLabel bounce:NULL];
```

### Pulse
![alt tag](https://raw.github.com/daltoniam/DCAnimationKit/master/gifs/pulse.gif)

our method to run pulse.
```objc
[self.moveView pulse:NULL];
[self.moveLabel pulse:NULL];
```

### Shake
![alt tag](https://raw.github.com/daltoniam/DCAnimationKit/master/gifs/shake.gif)

our method to run shake.
```objc
[self.moveView shake:NULL];
[self.moveLabel shake:NULL];
```

### Swing
![alt tag](https://raw.github.com/daltoniam/DCAnimationKit/master/gifs/swing.gif)

our method to run swing.
```objc
[self.moveView swing:NULL];
[self.moveLabel swing:NULL];
```

## Intros

Intros have a slight difference from the base code. We simple remove these 2 lines:

```objc
//[self.view addSubview:self.moveLabel];
//[self.view addSubview:self.moveView];
```
This lines will be added to the view once they snap in.

### Snap
![alt tag](https://raw.github.com/daltoniam/DCAnimationKit/master/gifs/snapin.gif)

our method to run the snap in.
```objc
[self.moveLabel snapIntoView:self.view direction:DCAnimationDirectionTop];
[self.moveView snapIntoView:self.view direction:DCAnimationDirectionLeft];
```

### Bounce
![alt tag](https://raw.github.com/daltoniam/DCAnimationKit/master/gifs/bouncein.gif)

our method to run the bounce in.
```objc
[self.moveLabel bounceIntoView:self.view direction:DCAnimationDirectionTop];
[self.moveView bounceIntoView:self.view direction:DCAnimationDirectionLeft];
```

### Expand
![alt tag](https://raw.github.com/daltoniam/DCAnimationKit/master/gifs/expandin.gif)

our method to run the expand.
```objc
[self.moveLabel expandIntoView:self.view finished:NULL];
[self.moveView expandIntoView:self.view finished:NULL];
```

## Outros

### Compress
![alt tag](https://raw.github.com/daltoniam/DCAnimationKit/master/gifs/compressin.gif)

our method to run the compress.
```objc
[self.moveLabel expandIntoView:NULL];
[self.moveView expandIntoView:NULL];
```

### Hinge
![alt tag](https://raw.github.com/daltoniam/DCAnimationKit/master/gifs/hinge.gif)

our method to run the hinge.
```objc
[self.moveLabel hinge:NULL];
[self.moveView hinge:NULL];
```

### Drop
![alt tag](https://raw.github.com/daltoniam/DCAnimationKit/master/gifs/drop.gif)

our method to run the drop.
```objc
[self.moveLabel drop:NULL];
[self.moveView drop:NULL];
```
## General transitions

To round off our fantastic animations, DCAnimationKit also simplifies doing ordinary frame manipulation.

```objc
UIView *baseView = [[UIView alloc] initWithFrame:CGRectMake(40, 85, 50, 50)];
baseView.backgroundColor = [UIColor grayColor];
[self.view addSubview:baseView];

self.moveView = [[UIView alloc] initWithFrame:baseView.frame];
self.moveView.backgroundColor = [UIColor redColor];
[self.view addSubview:self.moveView];
```

### Move
![alt tag](https://raw.github.com/daltoniam/DCAnimationKit/master/gifs/slide.gif)

our code to move around.
```objc
CGFloat distance = 80;
__weak id weakSelf = self.moveView;
[weakSelf moveX:distance finished:^{
    [weakSelf moveY:distance finished:^{
        [weakSelf moveX:-distance finished:^{
            [weakSelf moveY:-distance finished:^{

            }];
        }];
    }];
}];
```
We can also set the view's origin to a specific value as well.
```objc
__weak id weakSelf = self.moveView;
[weakSelf setX:200 finished:^{
    [weakSelf setY:200 finished:^{
        [weakSelf setX:40 finished:^{
            [weakSelf setY:85 finished:^{

            }];
        }];
    }];
}];
```

We can even slide to a specific point (there is a move as well!).

```objc
[self.moveView movePoint:CGPointMake(100, 100) finished:NULL];
```
### Rotation

![alt tag](https://raw.github.com/daltoniam/DCAnimationKit/master/gifs/rotate.gif)

our code to rotate (there is a move rotation as well).
```objc
__weak id weakSelf = self.moveView;
[weakSelf setRotation:45 duration:.35 finished:^{
    [weakSelf setRotation:0 duration:.35 finished:^{

    }];
}];
```


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
