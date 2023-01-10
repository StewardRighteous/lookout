import 'package:flutter/material.dart';
import 'package:apptheme/apptheme.dart';
import 'package:provider/provider.dart';

///The appbar for the homepage
class MainAppBar extends AppBar {
  MainAppBar({super.key})
      : super(title: const Text('LOOKOUT'), actions: [
          Consumer<ThemeManager>(builder: ((context, theme, child) {
            return Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: IconButton(
                onPressed: (() => theme.changeTheme()),
                icon: (theme.isDark == true)
                    ? const Icon(Icons.light_mode)
                    : const Icon(Icons.dark_mode),
              ),
            );
          })),
        ]);
}
