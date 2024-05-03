# Libry - Package Manager App

Libry is a package manager application designed to streamline package discovery and management for developers.

## Launch Guide

### Prerequisites

- **Flutter**
- **Dart** 
- **Xcode**
- **Android Studio** 
- You can use **Visual Studio Code** with the Flutter and Dart plugins.
- Simulators: both Android and iOS development.

### Install the Local Emulator Suite

Before installing the Emulator Suite you will need:

1. *Node.js* version 16.0 or higher. [Download here](https://nodejs.org/en/download)
2. *Java JDK* version 11 or higher. [Download here](https://jdk.java.net/)

To install the Emulator Suite:
1. Install the Firebase CLI.
2. You will need CLI version 8.14.0 or higher to use the Emulator Suite. [Installation guide](https://firebase.google.com/docs/cli)

### Install and setup Patrol testing framework

1. To install Patrol testing framework follow installation guide below.
[Installation guide](https://patrol.leancode.co/getting-started)

## Steps to Launch the Application 

1. Clone this repository to your local machine:

   ```bash
   git clone https://github.com/anna02272/Libry-Package-Manager-App.git
   ```

2. Create an API key at [libraries.io/api](https://libraries.io/api).

3. Add the API key to a `.env` file in the root directory of the project:

   ```plaintext
   API_KEY=YOUR_API_KEY_HERE
   ```

4. Run the following command to fetch the project dependencies:

   ```bash
   flutter pub get
   ```

5.  If you're using emulators for testing in debug mode, before running the project:
    - uncomment the following lines in main.dart:

    ```bash
      // import 'package:cloud_firestore/cloud_firestore.dart';
    
      if (kDebugMode) {
        // await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
        // FirebaseFirestore.instance.useFirestoreEmulator('localhost', 8080);
      }
    ```
    
     - start emulators with the following command:
   
      ```bash
      firebase emulators:start
       ```
   
6. Build and run the Flutter project on your device or emulator:

   ```bash
   flutter run
   ```

## Steps to Launch Patrol tests

1. Repeat steps five and six from above first

2. Run following command to start Patrol tests:

   ```bash
   patrol test -t integration_test/example_test.dart
   ```

## Project Features

Libry app offers the following functionalities:

### General Features

1. **Icon and Splash Screen:**
   - Customized icon and splash screen for branding and visual identity.

2. **Onboarding Slides:**
   - Onboarding slides to introduce users to the app's features and functionality.

### User Authentication and Registration

3. **User Registration:**
   - User registration process with validation and integration with Firebase Authentication for secure authentication.
  
4. **Login and Reset Password:**
    - User authentication with error handling for wrong credentials, with options for resetting the password via email link.

### Library and Platform Management

5. **List of Platforms Screen:**
   - Home screen displaying platforms of libraries.
   - Platforms data retrieved from the API, including color, title, project count, and default language.
   - Implementation of retry mechanism to handle network errors gracefully.

6. **List of Libraries Screen:**
   - Tabbed interface for displaying latest and popular libraries.
   - Features pagination with tabs not reloading for enhanced user experience.
   - Display of platform color, name, version, and keywords.
   - Implementation of retry mechanism to handle network errors gracefully.
     
7. **Search Result Screen:**
   - Pagination feature for browsing search results efficiently.
   - Implementation of retry mechanism to handle network errors gracefully.

8. **Library Details Screen:**
   - Detailed view of individual libraries accessible from various parts of the app, including libraries, search, and favorites screens.
   - Integration of a web view component for displaying library details, with support for retry mechanism in case of network issues.

9. **My Favorites Screen:**
   - Ability to add or remove libraries from favorites list.
   - Accessible from libraries, search, and favorites screens.
   - Includes functionality to view details of libraries and handles scenarios of empty list or no internet connection using Cloud Firestore.

### Account Management

10. **My Account Screen:**
   - User profile screen for managing account settings.
   - Localization support for Serbian and English languages, with the default language determined by the operating system.
   - Dark mode feature offering options for dark, light, or system theme settings.
   - Logout functionality for securely signing out of the app.

11. **Delete Account:**
    - Confirmation dialog for deleting the user account, with reauthentication required for additional security.
      
## Images of project (light and dark mode + English and Serbian)
### Splash screen: 
 <img src="https://github.com/anna02272/Libry-Package-Manager-App/assets/96575598/fea12092-95b1-4c1d-ae0b-5671ef252597" width="20%">
 <img src="https://github.com/anna02272/Libry-Package-Manager-App/assets/96575598/b13defe9-0d23-440f-8aff-c6142adcf249" width="20%">
 
### Onboarding Slides:
<img src="https://github.com/anna02272/Libry-Package-Manager-App/assets/96575598/5a0835e7-ca78-48e7-9dbd-c9e82db40db2" width="20%">
<img src="https://github.com/anna02272/Libry-Package-Manager-App/assets/96575598/7a878a20-e984-4578-a8e7-df914f8ae9af" width="20%">
<img src="https://github.com/anna02272/Libry-Package-Manager-App/assets/96575598/357a3c26-f83a-44a1-b492-21c7e6007720" width="20%">
<img src="https://github.com/anna02272/Libry-Package-Manager-App/assets/96575598/7494a094-26fb-4723-95a1-52a1ad8858fe" width="20%">
<img src="https://github.com/anna02272/Libry-Package-Manager-App/assets/96575598/e66969d9-e2ee-40f7-ac9c-319578a7af82" width="20%">
<img src="https://github.com/anna02272/Libry-Package-Manager-App/assets/96575598/cb326115-d428-4c94-8dbd-c4817620a4a8" width="20%">
<img src="https://github.com/anna02272/Libry-Package-Manager-App/assets/96575598/d8ac536b-0830-4b8a-8500-af79da95e878" width="20%">
<img src="https://github.com/anna02272/Libry-Package-Manager-App/assets/96575598/51604689-a4b1-406b-a223-abb9e21adb82" width="20%">

### Login:
<img src="https://github.com/anna02272/Libry-Package-Manager-App/assets/96575598/be267c80-7f9d-410d-831e-184d8bd86ba7" width="20%">
<img src="https://github.com/anna02272/Libry-Package-Manager-App/assets/96575598/0781b2d7-2d6c-4759-8901-9e4643d4c2a1" width="20%">
<img src="https://github.com/anna02272/Libry-Package-Manager-App/assets/96575598/55f89473-a368-4f87-899b-d5ac25a16d1f" width="20%">

### Registration:
<img src="https://github.com/anna02272/Libry-Package-Manager-App/assets/96575598/961ad97f-b7e1-416e-8ea1-8e4516351876" width="20%">
<img src="https://github.com/anna02272/Libry-Package-Manager-App/assets/96575598/61394395-7879-4fd0-807c-59136240d51c" width="20%"> 
<img src="https://github.com/anna02272/Libry-Package-Manager-App/assets/96575598/6eb9c75f-da5d-47bd-a21c-3878c7159d6b" width="20%">

### Reset Password:
<img src="https://github.com/anna02272/Libry-Package-Manager-App/assets/96575598/61ff3255-26d4-49d9-b778-a7642d73090f" width="20%">
<img src="https://github.com/anna02272/Libry-Package-Manager-App/assets/96575598/9337b438-2114-412a-91e8-094a2d3ce7b0" width="20%">
<img src="https://github.com/anna02272/Libry-Package-Manager-App/assets/96575598/c147e282-ff48-4e7e-b053-b7034ea8fd63" width="20%">
<img src="https://github.com/anna02272/Libry-Package-Manager-App/assets/96575598/e977f2d4-741e-455f-ba06-f896ab27abd1" width="20%">

### List of Platforms Screen:
<img src="https://github.com/anna02272/Libry-Package-Manager-App/assets/96575598/f5840917-ac78-40d3-8363-508d58104d68" width="20%">
<img src="https://github.com/anna02272/Libry-Package-Manager-App/assets/96575598/cd8b7710-4a4f-4489-a9c8-70fecc292218" width="20%">

### List of Libraries Screen:
<img src="https://github.com/anna02272/Libry-Package-Manager-App/assets/96575598/6580eea0-07aa-4677-a660-8621ac31eb7d" width="20%">
<img src="https://github.com/anna02272/Libry-Package-Manager-App/assets/96575598/3b4b9506-3c46-4100-a650-57273abff1af" width="20%">
<img src="https://github.com/anna02272/Libry-Package-Manager-App/assets/96575598/29d856e0-e62b-4eb5-8ae2-d28aa52ee2c2" width="20%">
<img src="https://github.com/anna02272/Libry-Package-Manager-App/assets/96575598/cd36d9bf-b142-46ca-9158-be22f6cbf8e9" width="20%">

### Search Result Screen:
<img src="https://github.com/anna02272/Libry-Package-Manager-App/assets/96575598/44bdbf1f-8cc4-40f1-908a-4c3fc8f4a20e" width="20%">
<img src="https://github.com/anna02272/Libry-Package-Manager-App/assets/96575598/86d43611-f182-427c-9f4a-fe30b9adfb82" width="20%">
<img src="https://github.com/anna02272/Libry-Package-Manager-App/assets/96575598/78e787c9-cdfb-4c66-92a5-e404a5ffb0c0" width="20%">
<img src="https://github.com/anna02272/Libry-Package-Manager-App/assets/96575598/f2d5caa5-4832-47f3-abd3-5ffa59310906" width="20%">

### Library Details Screen and Web View:
<img src="https://github.com/anna02272/Libry-Package-Manager-App/assets/96575598/5e62254e-4ea2-4cb5-b83c-1a36f5820132" width="20%">
<img src="https://github.com/anna02272/Libry-Package-Manager-App/assets/96575598/c19b11ec-548f-441e-a6b5-18612ac3fab4" width="20%">
<img src="https://github.com/anna02272/Libry-Package-Manager-App/assets/96575598/8ac29471-3e17-47aa-a1b8-9e629c0d6f18" width="20%">
<img src="https://github.com/anna02272/Libry-Package-Manager-App/assets/96575598/7554de11-4966-4efa-8ec1-c9227d371f3c" width="20%">

### My Favorites Screen:
<img src="https://github.com/anna02272/Libry-Package-Manager-App/assets/96575598/6d9bd702-5873-4b01-9bf3-a221dc40f589" width="20%">
<img src="https://github.com/anna02272/Libry-Package-Manager-App/assets/96575598/f54bcf57-1720-4a9f-9fc1-047f3d24615a" width="20%">
<img src="https://github.com/anna02272/Libry-Package-Manager-App/assets/96575598/4fb16503-13b0-4b27-af5c-0a148378f64a" width="20%">
<img src="https://github.com/anna02272/Libry-Package-Manager-App/assets/96575598/06411cf1-cb46-4a38-afc0-f225b1948b50" width="20%">

### My Account Screen:
<img src="https://github.com/anna02272/Libry-Package-Manager-App/assets/96575598/010233d4-b4b2-4133-86e0-d935f35e05ac" width="20%">
<img src="https://github.com/anna02272/Libry-Package-Manager-App/assets/96575598/cb89a830-68c8-4f1c-8ce1-ed8a9c712ed3" width="20%">

### Change theme:
<img src="https://github.com/anna02272/Libry-Package-Manager-App/assets/96575598/efb7b15c-bf16-4a86-9140-e4786369dd27" width="20%">
<img src="https://github.com/anna02272/Libry-Package-Manager-App/assets/96575598/228ab0fa-0ccd-4f06-9fb6-4ba5c4b97c76" width="20%">

### Change language:
<img src="https://github.com/anna02272/Libry-Package-Manager-App/assets/96575598/926d1186-f58a-4f32-88ee-929124551ffe" width="20%">
<img src="https://github.com/anna02272/Libry-Package-Manager-App/assets/96575598/a8f17c4d-0efe-40dc-8a05-bb0545de046d" width="20%">

### Delete Account:
<img src="https://github.com/anna02272/Libry-Package-Manager-App/assets/96575598/fb6146d2-d87e-46f0-841c-1ec26757d2f7" width="20%">
<img src="https://github.com/anna02272/Libry-Package-Manager-App/assets/96575598/26e8ff69-ede0-4830-9354-c0ce5ec7de7d" width="20%">
<img src="https://github.com/anna02272/Libry-Package-Manager-App/assets/96575598/49937b59-a358-4e95-a4cb-1a598048a795" width="20%">
<img src="https://github.com/anna02272/Libry-Package-Manager-App/assets/96575598/7cc44319-3590-4de5-bb74-cf7a3a75522b" width="20%">





