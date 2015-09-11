OneSky Over-The-Air Plugin for iOS
======================================

Over-the-air translation update for your iOS apps with OneSky.

Installation
------------

#### Download OneSkyOTAPlugin.framework
1. [`OneSkyOTAPlugin.zip`](https://github.com/onesky/plugin-ios-ota/releases/download/0.9.2/OneSkyOTAPlugin.zip) from the release tab and drag the folder into the **Frameworks** section of your **Project Navigator**.
2. Under **Build Settings** of the target, add ```-ObjC``` to **Other Linker Flags** setting.

#### CocoaPods
``` 
pod 'OneSkyOTAPlugin', '~> 0.9.2' 
```

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


Security
---------------

For security reason you might not want to embed the API secret in the source code of your application, in this case you can skip the API secret by setting the string output API privacy to public, go to "Project settings > Privacy > String out API" on OneSky platform for more detail.

``` objective-c
[OneSkyOTAPlugin provideAPIKey:ONESKY_API_KEY
                     APISecret:nil
                     projectID:ONESKY_PROJECT_ID];
```

Usage
----------------

Simply replace ```NSLocalizedString``` with ```OSLocalizedString```, the plugin will fallback to local .strings files if no translation of the string is found on OneSky.

``` objective-c
OSLocalizedString(key, comment)
OSLocalizedStringFromTable(key, tbl, comment)
```

Language
----------------

The default language the plugin uses is `-[[NSLocale preferredLanguages] firstObject]`. If your app implements custom language logic, you set the language with the new API:

``` objective-c
[OneSkyOTAPlugin setLanguage:@"pt-PT"];
```

Interface Builder Support
-------------------------

The plugin also supports OTA translation for **Interface Builder** files (`.xib` and `.storyboard`), translations will be set at ```-[UIView awakeFromNib]``` automatically. To enable **Interface Builder** support, add a `Run Script Build Phase` to your app target in `Project Editor`, copy and paste the following script into the script area:

#### OneSkyOTAPlugin.framework
```
./OneSkyOTAPlugin.framework/ibsupport
```

#### CocoaPods
```
./Pods/OneSkyOTAPlugin/OneSkyOTAPlugin/ibsupport
```

Support
-------
http://support.oneskyapp.com/
