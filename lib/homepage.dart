import 'package:flutter/material.dart';
import 'package:lookout/content_card.dart';
import 'package:lookout/contents_saver.dart';
import 'package:lookout/default_homepage_body.dart';
import 'package:lookout/homepage_floatingactionbut.dart';
import 'package:lookout/main_app_bar.dart';
import 'package:provider/provider.dart';

///Initial page of the app.
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: MainAppBar(),
        body: Consumer<ContentsSaver>(
          builder: (context, contentSaver, child) {
            return (contentSaver.hasContent() == false)
                ? const DefaultHomepageBody()
                : ListView.builder(
                    itemCount: contentSaver.numberOfContents,
                    itemBuilder: (context, index) {
                      return ContentCard(
                          socialMediaIcons:
                              contentSaver.content.elementAt(index).logo,
                          socialMediaName: contentSaver.content
                              .elementAt(index)
                              .contentName, );
                    },
                  );
          },
        ),
        floatingActionButton: const HomePageFloatingActionBut(),
        drawer: const Drawer(),
      ),
    );
  }
}
