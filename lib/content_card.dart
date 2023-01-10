import 'package:flutter/material.dart';

class ContentCard extends StatelessWidget {
  final Image socialMediaIcons;
  final String socialMediaName;
  const ContentCard(
      {super.key,
      required this.socialMediaIcons,
      required this.socialMediaName});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 250,
      child: Card(
        margin: const EdgeInsets.only(
            bottom: 5.0, right: 12.0, top: 12.0, left: 12.0),
        elevation: 5.0,
        child: Column(children: [
          const SizedBox(
            height: 160,
          ),
          const Divider(),
          ListTile(
            title: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 30,
                    width: 30,
                    child: socialMediaIcons,
                  ),
                ),
                Text(socialMediaName, textScaleFactor: 1.3),
              ],
            ),
            trailing: const Icon(Icons.more_vert),
          ),
        ]),
      ),
    );
  }
}
