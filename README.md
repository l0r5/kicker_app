# kicker_app

A new Flutter table soccer application.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our 
[online documentation](https://flutter.dev/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.

### import google-services
import google-services.json which includes the api key for firebase and save it under android/app/ 

### Useful Flutter Commands

See how App performs in release:

    $ flutter run --profile
    

Update packages (dependencies)
    
    $ flutter packages get
 
 
### Mockups

[Dropbox Link](https://www.dropbox.com/s/27a31vgcf1lvjmw/WohnheimApp%20Mockup.pdf?dl=0)

### Release

Create a keystore using

    $ keytool -genkey -v -keystore ~/key.jks -keyalg RSA -keysize 2048 -validity 10000 -alias key
    
Save the file under /android/app and replace the android/key.properties with your own values

 Create a releasable build
    
    $ flutter build appbundle
