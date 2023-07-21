import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/user.dart';

class ProfileProvider extends ChangeNotifier {
  bool _didSelectUser = false;
  bool _tapOnLink = false;
  bool _darkMode = false;
  bool _loggedIn = false;
  bool get loggedIn => _loggedIn;
  bool get tapOnProfile => _didSelectUser;
  bool get tapOnLink => _tapOnLink;
  bool get dartMode => _darkMode;
  String _token = '';
  String get token => _token;

  User _user = User.empty();
  User get user => _user;

  set user(User user) {
    _user = user;
    notifyListeners();
  }

  void updateProfile({
    required String firstName,
    required String lastName,
    required String phone,
    required String email,
  }) {
    _user = _user.copyWith(
      firstName: firstName,
      lastName: lastName,
      phone: phone,
      email: email,
    );
    notifyListeners();
  }

  set loggedIn(bool value) {
    _loggedIn = value;
    notifyListeners();
  }

  set dartMode(bool darkMode) {
    _darkMode = darkMode;
    notifyListeners();
  }

  set tapOnLink(bool value) {
    _tapOnLink = value;
    notifyListeners();
  }

  set tapOnProfile(bool selected) {
    _didSelectUser = selected;
    notifyListeners();
  }

  set token(String token) {
    _token = token;
    notifyListeners();
  }

  void logout() {
    loggedIn = false;
    token = '';
    user = const User(id: '', email: '');
    notifyListeners();
  }

  static ProfileProvider of(BuildContext context, {bool listen = false}) {
    return Provider.of<ProfileProvider>(context, listen: listen);
  }
}

class ProfileConsumer extends StatelessWidget {
  final Widget Function(ProfileProvider provider) builder;

  const ProfileConsumer({super.key, required this.builder});

  @override
  Widget build(BuildContext context) => Consumer<ProfileProvider>(
        builder: (_, provider, __) => builder(provider),
      );
}
