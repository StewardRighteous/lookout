import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:apptheme/apptheme.dart';
import 'package:go_router/go_router.dart';

class HomePageFloatingActionBut extends StatelessWidget {
  const HomePageFloatingActionBut({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: (() => context.go('/selection_page')),
      child: Consumer<ThemeManager>(
        builder: (context, theme, child) {
          return (theme.isDark == true)
              ? const Icon(
                  Icons.add,
                  color: Colors.black,
                )
              : const Icon(
                  Icons.add,
                  color: Colors.white,
                );
        },
      ),
    );
  }
}
