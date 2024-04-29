import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';
import 'package:flutter_internship_2024_app/keys.dart';
import 'package:flutter_internship_2024_app/main.dart' as app;

void main() {

  patrolTest('Presentation Patrol test', ($) async {

    //NATIVE
    await $.native.disableDarkMode();

    //APP INITIALIZATION
    app.main();
    await $.pumpAndSettle();

    //ONBOARDING SLIDES
    await $('Skip').waitUntilVisible(timeout: const Duration(seconds: 15));
    await $('Skip').tap();

    await $('Sign up').waitUntilVisible(timeout: const Duration(seconds: 15));
    await $('Sign up').tap();

    //LOGIN FLOW
    await $(K.loginBtn).waitUntilVisible(timeout: const Duration(seconds: 5));

    expect($(K.loginBtn).visible, equals(true), reason: 'Login button is not found before accessing Sign up form');

    await $(K.emailField).enterText('milos@gmail.com');
    await $(K.passwordField).enterText('testing');

    expect($(K.loginBtn).visible, equals(true), reason: 'Login button is not found before accessing Sign up form');
    await $(K.loginBtn).tap();

    await $('NPM').waitUntilVisible(timeout: const Duration(seconds: 30));
    expect($('NPM').visible, equals(true), reason: 'NPM are not visible before sign up/login');

    //SCROLL AND TAP ON PLATFORM
    await $.scrollUntilVisible(finder: $('CPAN'));
    await $('CPAN').tap();

    //LIST OF LIBRARIES, LIBRARY DETAILS, WEB VIEW, ADD TO FAVORITES
    expect($(K.mpl).visible, equals(true), reason: 'MPL is not visible');
    expect($(K.nwl).visible, equals(true), reason: 'NWL is not visible');

    await $('perl').waitUntilVisible(timeout: const Duration(seconds: 30));
    expect($('perl').visible, equals(true), reason: 'sentry is not visible');
    await $('perl').tap();
    expect($('Library details').visible, equals(true), reason: 'Library details is not visible');

    await $(K.favorite).tap();
    await $('Package added to favorites.').waitUntilVisible(timeout: const Duration(seconds: 30));
    expect($('Package added to favorites.').visible, equals(true), reason: 'Package is not visible');

    await Future.delayed(const Duration(seconds: 3));
    await $(K.webView).tap();
    
    await $('Perl').waitUntilVisible(timeout: const Duration(seconds: 30));
    expect($('Perl').visible, equals(true), reason: 'Perl is not visible');

    //await $(K.webView).tap();
  });

}