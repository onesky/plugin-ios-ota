OneSky Over-The-Air Plugin for iOS
======================================

Over-the-air translation update for your iOS apps with OneSky.

Installation
------------

1. Download [`OneSkyOTAPlugin.zip`](https://github.com/onesky/plugin-ios-ota/releases/download/0.5.0/OneSkyOTAPlugin.zip) from the release tab and drag the folder into the **Frameworks** section of your **Project Navigator**.
2. Under **Build Settings** of the target, add ```-ObjC``` to **Other Linker Flags** setting.

Integration
-----------

Import the library header

``` objective-c
#import <OneSkyOTAPlugin/OneSkyOTAPlugin.h>
```

Add the following code in under ```-application:didFinishLaunchingWithOptions:``` in your app delegate:

``` objective-c
[OneSkyOTAPlugin provideAPIKey:ONESKY_API_KEY
                     APISecret:ONESKY_API_SECRET
                     projectID:ONESKY_PROJECT_ID];
[OneSkyOTAPlugin checkForUpdate];
```

Optionally add  ```[OneSkyOTAPlugin checkForUpdate]``` in 
```- (void)applicationDidBecomeActive:(UIApplication*)application```

```ONESKY_API_KEY```, ```ONESKY_API_SECRET``` can be found in **Site Settings** under **API Keys & Usage** on **OneSky Web Admin**. 
```ONESKY_PROJECT_ID``` can be found under **All Projects** page.

**NOTE:** The above parameters must be set before calling ```-checkForUpdate```.

Usage
----------------

Simply replace ```NSLocalizedString``` with ```OSLocalizedString```, the plugin will fallback to local .strings files if no translation of the string is found on OneSky.

``` objective-c
OSLocalizedString(key, comment)
OSLocalizedStringFromTable(key, tbl, comment)
```

Support
-------
http://support.oneskyapp.com/
