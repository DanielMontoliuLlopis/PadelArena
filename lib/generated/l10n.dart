// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Title 01`
  String get titleOnboarding01 {
    return Intl.message(
      'Title 01',
      name: 'titleOnboarding01',
      desc: '',
      args: [],
    );
  }

  /// `Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.`
  String get textOnboarding01 {
    return Intl.message(
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      name: 'textOnboarding01',
      desc: '',
      args: [],
    );
  }

  /// `Title 02`
  String get titleOnboarding02 {
    return Intl.message(
      'Title 02',
      name: 'titleOnboarding02',
      desc: '',
      args: [],
    );
  }

  /// `Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.`
  String get textOnboarding02 {
    return Intl.message(
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      name: 'textOnboarding02',
      desc: '',
      args: [],
    );
  }

  /// `Title 03`
  String get titleOnboarding03 {
    return Intl.message(
      'Title 03',
      name: 'titleOnboarding03',
      desc: '',
      args: [],
    );
  }

  /// `Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.`
  String get textOnboarding03 {
    return Intl.message(
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      name: 'textOnboarding03',
      desc: '',
      args: [],
    );
  }

  /// `Title 04`
  String get titleOnboarding04 {
    return Intl.message(
      'Title 04',
      name: 'titleOnboarding04',
      desc: '',
      args: [],
    );
  }

  /// `Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.`
  String get textOnboarding04 {
    return Intl.message(
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      name: 'textOnboarding04',
      desc: '',
      args: [],
    );
  }

  /// `Log in / Registration`
  String get loginButton {
    return Intl.message(
      'Log in / Registration',
      name: 'loginButton',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get skipButton {
    return Intl.message(
      'Skip',
      name: 'skipButton',
      desc: '',
      args: [],
    );
  }

  /// `Log in Page`
  String get titleLogin {
    return Intl.message(
      'Log in Page',
      name: 'titleLogin',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Invalid email`
  String get emailError {
    return Intl.message(
      'Invalid email',
      name: 'emailError',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Invalid password`
  String get passwordError {
    return Intl.message(
      'Invalid password',
      name: 'passwordError',
      desc: '',
      args: [],
    );
  }

  /// `Log in`
  String get login {
    return Intl.message(
      'Log in',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Sing Up`
  String get singUp {
    return Intl.message(
      'Sing Up',
      name: 'singUp',
      desc: '',
      args: [],
    );
  }

  /// `Repeat your password`
  String get repeatPassword {
    return Intl.message(
      'Repeat your password',
      name: 'repeatPassword',
      desc: '',
      args: [],
    );
  }

  /// `Diferent password`
  String get diferentPassword {
    return Intl.message(
      'Diferent password',
      name: 'diferentPassword',
      desc: '',
      args: [],
    );
  }

  /// `You have account? Log In`
  String get haveAccount {
    return Intl.message(
      'You have account? Log In',
      name: 'haveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Extra User Data`
  String get extraUserDataTitle {
    return Intl.message(
      'Extra User Data',
      name: 'extraUserDataTitle',
      desc: '',
      args: [],
    );
  }

  /// `UserName`
  String get userName {
    return Intl.message(
      'UserName',
      name: 'userName',
      desc: '',
      args: [],
    );
  }

  /// `First name`
  String get firtsName {
    return Intl.message(
      'First name',
      name: 'firtsName',
      desc: '',
      args: [],
    );
  }

  /// `Can not be empty`
  String get emptyError {
    return Intl.message(
      'Can not be empty',
      name: 'emptyError',
      desc: '',
      args: [],
    );
  }

  /// `Last name`
  String get lastName {
    return Intl.message(
      'Last name',
      name: 'lastName',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to publish tournaments?`
  String get publishTournaments {
    return Intl.message(
      'Do you want to publish tournaments?',
      name: 'publishTournaments',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get continuee {
    return Intl.message(
      'Continue',
      name: 'continuee',
      desc: '',
      args: [],
    );
  }

  /// `Padel Arena`
  String get title {
    return Intl.message(
      'Padel Arena',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `Tournaments`
  String get tournaments {
    return Intl.message(
      'Tournaments',
      name: 'tournaments',
      desc: '',
      args: [],
    );
  }

  /// `My Tournaments`
  String get myTournaments {
    return Intl.message(
      'My Tournaments',
      name: 'myTournaments',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `From`
  String get from {
    return Intl.message(
      'From',
      name: 'from',
      desc: '',
      args: [],
    );
  }

  /// `to`
  String get to {
    return Intl.message(
      'to',
      name: 'to',
      desc: '',
      args: [],
    );
  }

  /// `Location`
  String get location {
    return Intl.message(
      'Location',
      name: 'location',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get description {
    return Intl.message(
      'Description',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  /// `Tournament Registration`
  String get titleTournamentRegistration {
    return Intl.message(
      'Tournament Registration',
      name: 'titleTournamentRegistration',
      desc: '',
      args: [],
    );
  }

  /// `Category`
  String get category {
    return Intl.message(
      'Category',
      name: 'category',
      desc: '',
      args: [],
    );
  }

  /// `Category con not be empty`
  String get emptyCategory {
    return Intl.message(
      'Category con not be empty',
      name: 'emptyCategory',
      desc: '',
      args: [],
    );
  }

  /// `Player 2`
  String get player2 {
    return Intl.message(
      'Player 2',
      name: 'player2',
      desc: '',
      args: [],
    );
  }

  /// `Email of player 2`
  String get emailPlayer2 {
    return Intl.message(
      'Email of player 2',
      name: 'emailPlayer2',
      desc: '',
      args: [],
    );
  }

  /// `New Tournament`
  String get newTournament {
    return Intl.message(
      'New Tournament',
      name: 'newTournament',
      desc: '',
      args: [],
    );
  }

  /// `Tournament name`
  String get tournamentName {
    return Intl.message(
      'Tournament name',
      name: 'tournamentName',
      desc: '',
      args: [],
    );
  }

  /// `Start date`
  String get startDate {
    return Intl.message(
      'Start date',
      name: 'startDate',
      desc: '',
      args: [],
    );
  }

  /// `Final date`
  String get finalDate {
    return Intl.message(
      'Final date',
      name: 'finalDate',
      desc: '',
      args: [],
    );
  }

  /// `The start date can not be before start date`
  String get dateError {
    return Intl.message(
      'The start date can not be before start date',
      name: 'dateError',
      desc: '',
      args: [],
    );
  }

  /// `First Category`
  String get firtsCategory {
    return Intl.message(
      'First Category',
      name: 'firtsCategory',
      desc: '',
      args: [],
    );
  }

  /// `Second Category`
  String get secondCategory {
    return Intl.message(
      'Second Category',
      name: 'secondCategory',
      desc: '',
      args: [],
    );
  }

  /// `Third Category`
  String get thirdCategory {
    return Intl.message(
      'Third Category',
      name: 'thirdCategory',
      desc: '',
      args: [],
    );
  }

  /// `Create Tournament`
  String get createTournament {
    return Intl.message(
      'Create Tournament',
      name: 'createTournament',
      desc: '',
      args: [],
    );
  }

  /// `You are not registered for any tournament`
  String get nonTournaments {
    return Intl.message(
      'You are not registered for any tournament',
      name: 'nonTournaments',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Log Out`
  String get logOut {
    return Intl.message(
      'Log Out',
      name: 'logOut',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'es'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
