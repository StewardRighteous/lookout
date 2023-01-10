import 'package:flutter/material.dart';
import 'package:lookout/content_tiles.dart';

class SelectionPage extends StatelessWidget {
  const SelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('CONTENTS'),
        ),
        body: const ContentTiles(),
      ),
    );
  }
}
