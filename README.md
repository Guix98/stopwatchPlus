# Stopwatch+

If you are part of the deployment team, you may need ti read this document to make sure your releases will not have any problem.

This document describes the steps required to release a this or any Flutter app for Android, iOS, and web.

## Prerequisites

Before you begin, make sure you have the following:

- A built and tested Flutter project.
- A developer account in Google Play and App Store.
- A web server to host the web app.

## Create JKS keys

1. Open the Flutter project in Android Studio or Visual Studio Code.
2. Open a terminal in the root directory of the project.
3. Run the following command to generate a JKS keystore:

```

keytool -genkey -v -keystore <keystore-name>.jks -keyalg RSA\
-keysize 2048 -validity 10000 -alias <alias-name>
```

Replace `<keystore-name>` with the name you want to give the keystore and `<alias-name>` with the alias you want to use for the app.

1.  Follow the instructions that appear in the terminal to enter the key information.

Once you have created the keystore, you can use it to sign the Flutter apps you want to publish.

## Release for Android

1.  Open the Flutter project in Android Studio or Visual Studio Code.
2.  Click the Build button in the toolbar.
3.  Select Build APK from the dropdown menu.
4.  Select the build configuration you want to use.
5.  Click the Build button.

Once the APK has been generated, you can upload it to Google Play.

## To upload the APK to Google Play, follow these steps:

1.  Sign in to your developer account in Google Play.
2.  Click Apps.
3.  Click the name of your app.
4.  Click Publish.
5.  Select Create release.
6.  Select APK as the release file type.
7.  Click Select file.
8.  Select the APK that you generated earlier.
9.  Click Next.
10. Enter the release information.
11. Click Publish.

## Release for iOS

1.  Open the Flutter project in Xcode.
2.  Click the Product button in the menu bar.
3.  Select Archive.
4.  Select the build configuration you want to use.
5.  Click the Archive button.

Once the IPA file has been generated, you can upload it to App Store Connect.

## To upload the IPA file to App Store Connect, follow these steps:

1.  Sign in to your developer account in App Store Connect.
2.  Click Apps.
3.  Click the name of your app.
4.  Click Releases.
5.  Click Create New Release.
6.  Select Application as the release file type.
7.  Click Choose File.
8.  Select the IPA file that you generated earlier.
9.  Click Next.
10. Enter the release information.
11. Click Submit.

## Release for web

1.  Open the Flutter project in Android Studio or Visual Studio Code.
2.  Click the Build button in the toolbar.
3.  Select Build Web from the dropdown menu.
4.  Select the build configuration you want to use.
5.  Click the Build button.

Once the web app has been generated, you can host it on a web server.

## To host the web app, follow these steps:

1.  Upload the web app files to the web server.
2.  Configure the web server to make the web app available at the URL you want.

Once you have completed these steps, the Flutter app will be available for download and use.
