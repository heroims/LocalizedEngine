# LocalizedEngine
## 国际化引擎
使用方法调用
```Objective-C
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //初始化国际化引擎
    [LocalizedEngine startEngine];
    
    return YES;
}

```

## Installation

### via CocoaPods
Install CocoaPods if you do not have it:-
````
$ [sudo] gem install cocoapods
$ pod setup
````
Create Podfile:-
````
$ edit Podfile
platform :ios, '7.0'
pod 'ServerAPI',  '~> 1.0.0'
$ pod install
````
Use the Xcode workspace instead of the project from now on.
