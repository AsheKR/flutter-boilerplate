# flutter-boilerplate

원하는 동작을 실행하기 전 TODO 를 해결해주세요.

## Command

### firebase configure

```shell
flutterfire configure \
--platforms="ios,android" \
--out=lib/environment/firebase/firebase_options.development.dart \
--ios-build-config=Debug-development \
--ios-out=ios/Firebase/development/GoogleService-Info.plist \
--android-out=android/app/src/development/google-services.json \
--ios-bundle-id="" \  # TODO: iOS bundle id
--android-package-name="" \  # TODO: Android Package name 
--overwrite-firebase-options
```

```shell
flutterfire configure \
--platforms="ios,android" \
--out=lib/environment/firebase/firebase_options.production.dart \
--ios-build-config=Debug-production \
--ios-out=ios/Firebase/production/GoogleService-Info.plist \
--android-out=android/app/src/production/google-services.json \
--ios-bundle-id="" \  # TODO: iOS bundle id
--android-package-name="" \  # TODO: Android Package name
--overwrite-firebase-options
```

### fastlane

#### 공통 환경 변수

```dotenv
SENTRY_DSN=
```

#### Android

android 폴더 하위에서 실행해주세요.

##### firebase

```dotenv
GOOGLE_APPLICATION_CREDENTIALS=
```

```shell
fastlane firebase_development
```

##### play store

```dotenv
PLAY_STORE_PACKAGE_NAME=
PLAY_STORE_JSON_KEY_PATH=
```

```shell
fastlane play_store_production
```

#### iOS

iOS 폴더 하위에서 실행해주세요.

##### firebase

```dotenv
IPA_FILE_NAME=
CERTIFICATES_REPOSITORY=
APP_DISTRIBUTION_DEVELOPMENT_APP_ID=
GOOGLE_APPLICATION_CREDENTIALS=
```

```shell
fastlane firebase_development
```

##### test flight

```dotenv
IPA_FILE_NAME=
CERTIFICATES_REPOSITORY=
APP_STORE_API_ISSUER_ID=
APP_STORE_API_KEY=
APP_STORE_API_KEY_ID=
```

```shell
fastlane test_flight
```

## Github Action 설정

### Secret

```dotenv
# Common
IPA_FILE_NAME=
GOOGLE_APPLICATION_CREDENTIALS_BASE64=
APP_DISTRIBUTION_DEVELOPMENT_APP_ID=

# Android
PLAY_STORE_PACKAGE_NAME=
ANDROID_KEYSTORE_BASE64=
ANDROID_KEY_PROPERTIES=
PLAY_STORE_GOOGLE_SERVICE_BASE64=

# iOS
APP_STORE_API_ISSUER_ID=
APP_STORE_API_KEY=
APP_STORE_API_KEY_ID=
CERTIFICATES_REPOSITORY=
```
