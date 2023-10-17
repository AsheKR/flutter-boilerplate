# base

Base project

## firebase configure

```shell
flutterfire configure \
--platforms="ios,android" \
--out=lib/environment/firebase/firebase_options.development.dart \
--ios-build-config=Debug-development \
--ios-out=ios/Firebase/development/GoogleService-Info.plist \
--android-out=android/app/src/development/google-services.json \
--ios-bundle-id="" \
--android-package-name="" \
--overwrite-firebase-options
```

```shell
flutterfire configure \
--platforms="ios,android" \
--out=lib/environment/firebase/firebase_options.production.dart \
--ios-build-config=Debug-production \
--ios-out=ios/Firebase/production/GoogleService-Info.plist \
--android-out=android/app/src/production/google-services.json \
--ios-bundle-id="" \
--android-package-name="" \
--overwrite-firebase-options
```
