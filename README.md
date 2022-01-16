# Adult Physical Fitness Program App
This is a developing application created for members of the Adult Physical Fitness Program at Ball State University. Members will be able to view announcements sent by administrators of the APFP, access at-home exercise videos, and log activity that can be shared with administrators, all in one easy-to-use application. 

At this time, functionality is limited to application navigation, account creation and log-in for approved APFP members, exercise videos dynamically pulled from YouTube, and pulling previous announcements from a database. Users that are signed into the app may also receive push notifications from administrators regarding important information sent out by the APFP.


## How to Run
This application is in development and may be prone to bugs/issues/crashes. Run application at own risk.
1. Install Flutter SDK and an emulator of your choice (or offload to a physical device. Some features are not yet available on iOS emulators or devices).
2. In your code editor, attach a running emulator or a physical device to the project.
3. Find the root of the project in `lib/welcome/welcome_widget.dart`. Run the main() method, which will run the application on your emulator or device.

Instructions for how to install Flutter SDK can be found [here](https://docs.flutter.dev/get-started/install). Implemented testing thus far can be found in `test` and `integration_test` directories. If you have trouble running the Flutter application, try running the following command in your terminal to download packages: `flutter pub get`. If you run into trouble with your Flutter installation, try running `flutter doctor` to verify that your Flutter SDK is properly installed.

If you have trouble running on an iOS device or emulator, ensure that you have the CocoaPods manager installed, which manages dependencies for Xcode projects. Instructions for how to install can be found [here](https://guides.cocoapods.org/using/getting-started.html). Once CocoaPods is installed, you can install the pods for this project by setting the directory to `ios` and running `pod install`. Other CocoaPods commands can be used for troubleshooting, such as `pod outdated` and `pod update`, but only when the directory is set to `ios`. Ensure that your version of the app has been signed with an Apple account, which can be done through Xcode. A Developer account is not required to run the app, but an account must be used to sign the app.

A Firebase project must be configured within this application. For iOS, add a valid **GoogleServices-Info.plist** file to the iOS Runner through Xcode. This must be done through Xcode or it will not be registered. For Android, add the **google-services.json** file to the `android/app` directory. The Firebase configuration files must come from the official APFP application Firebase project, only accessible to developers.

*Most warnings generated by the application are thrown by packages that are used by external dependencies. Most of these warnings appear in Xcode when running on iOS, but this code is maintained by the publishers of the package and is updated whenever the packages are retrieved. Do not modify.*

## API and SDK Documentation
As a hybrid application, this project uses multiple SDKs and external APIs. Versions and attributions are listed below.

  ### [Flutter](https://flutter.dev/)
  - Flutter is an open source framework by Google for building beautiful, natively compiled, multi-platform applications from a single codebase.
  - Application tested using Flutter SDK version `2.5.3` at time of writing.
  - Flutter is powered by **Dart**, which provides the language and runtimes that power Flutter apps. Application tested using Dart version `2.5.3` at time of writing.

  ### [Firebase](https://firebase.google.com/) and [Firestore](https://firebase.google.com/docs/firestore)
  - Firebase is a Google platform to assist with developing mobile and web applications. It can help to serve as a back end for applications without the requirement of managing servers.
  - Cloud Firestore is a database feature within Firebase. It allows for storage of data in collections for easy retrieval by clients.
  - Versions for all used dependencies:
    - Firebase Core: `1.7.0`
    - Firebase Auth: `3.1.3`
    - Firebase Messaging: `10.0.0`
    - Firebase Analytics: `8.0.2`
    - Cloud Firestore: `2.5.3`

  ### [YouTube Explode Dart](https://pub.dev/packages/youtube_explode_dart)
  - YouTube Explode is an API used to collect data from YouTube and display YouTube players within the application. This Dart package allows us to implement YouTube Explode methods within our application.
  - At the time of its implementation, the YouTube Explode Dart version is `1.10.8`.
  - Information regarding the licensing of this package can be found in the `licenses` directory.


