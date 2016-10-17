# KABlurTransition
iOS Transitioning with Blur effect

Purpose
-----------

KABlurTransition is a UIViewController and UINavigationController category that replicates the iOS realtime background blur effect, KABlurTransition offer two methods 'ka_pushViewController:animated:' and 'ka_presentViewController:animated:completion:'. Just replace pushViewControler:animated and presentViewController:animated:completion with them when you want to push or present a view controller. If you do not want the transition effect for specific view controller, just simply use 'ingoreClass:' method in KABlurManager;

Supported iOS Versions
-------------------------
iOS 8.0+  

Installation
---------------
KABlurTransition is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

pod "KABlurTransition"

Usage
---------
You need to call the 'pushVC:animated:(BOOL)animated' and 'presentVC:animated:completion:' to push or present a view controller.

What's next
--------------------

Support iOS 7.0  
Support CocoaPods  
Customization of Blur effect

License
---------------

KABlurTransition is available under the MIT license. See the LICENSE file for more info.
