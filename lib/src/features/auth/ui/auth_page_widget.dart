import 'package:flutter/material.dart';
import 'package:flutter_template/src/theme/app_sizes.dart';

class AuthPageWidget extends StatelessWidget {
  final List<Widget> children;
  final bool center;
  final bool simple;
  final EdgeInsetsGeometry padding;

  const AuthPageWidget({
    super.key,
    required this.children,
    this.center = false,
    this.simple = false,
    this.padding = const EdgeInsets.symmetric(
      horizontal: AppSizes.md,
      vertical: AppSizes.xxxl + AppSizes.md, // 48
    ),
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: simple
            ? Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSizes.md,
                  vertical: AppSizes.xxxl + AppSizes.md, // 48
                ),
                child: Column(
                  mainAxisAlignment: center
                      ? MainAxisAlignment.center
                      : MainAxisAlignment.start,
                  children: children,
                ),
              )
            : SingleChildScrollView(
                child: Padding(
                  padding: padding,
                  child: Column(
                    children: children,
                  ),
                ),
              ),
      ),
    );
  }
}
