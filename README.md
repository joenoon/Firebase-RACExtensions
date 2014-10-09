# Firebase-RACExtensions

Adds rac_* signals for Firebase:

- rac_valueSignal
- rac_addedSignal
- rac_movedSignal
- rac_changedSignal
- rac_removedSignal
- rac_authWithCustomTokenSignal:

For example:

```objc
Firebase* postsRef = [[Firebase alloc] initWithUrl: @"https://docs-examples.firebaseio.com/web/saving-data/fireblog/posts"];
[[postsRef rac_valueSignal] subscribeNext:^(FDataSnapshot *snapshot) {
  // latest snapshot
}];
```

## Installation

Firebase-RACExtensions is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

    pod "Firebase-RACExtensions"

## Todo

The example app is currently blank, but should eventually contain a simple demo of these signals.

## Author

Joe Noon, joenoon@gmail.com

## License

Firebase-RACExtensions is available under the MIT license. See the LICENSE file for more info.

