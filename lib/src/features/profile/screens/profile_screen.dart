import 'package:flutter/material.dart';

import '../../../ui/widgets/app_page.dart';
import '../data/profile_service.dart';

class ProfileScreen extends StatelessWidget {
  final ProfileService service;

  const ProfileScreen({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    return AppPage(
      title: 'Profile',
      simpleAppBar: false,
      child: Text(ProfileService.remote.me(token: '').toString()),
    );
  }
}
