import 'package:flutter/material.dart';
import 'package:lookout/selection_box.dart';
import 'contents_saver.dart';
import 'logos.dart';
import 'text_box.dart';

class ContentTiles extends StatelessWidget {
  const ContentTiles({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: InstagramID.values.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          child: ListTile(
            leading: const SizedBox(
              height: 40,
              width: 40,
              child: Logos.instagram,
            ),
            title: Text(
                InstagramID.values[index]
                    .toString()
                    .replaceAll('InstagramID.instagram', ''),
                textScaleFactor: 1.5),
            contentPadding: const EdgeInsets.only(left: 15.0, bottom: 2.0),
            style: ListTileStyle.drawer,
            onTap: () {
              Scaffold.of(context).showBottomSheet((context) {
                if (InstagramID.values[index] == InstagramID.instagramBio ||
                    InstagramID.values[index] == InstagramID.instagramCaption) {
                  return TextBox(index: index);
                } else if (InstagramID.values[index] ==
                        InstagramID.instagramDp ||
                    InstagramID.values[index] == InstagramID.instagramPost ||
                    InstagramID.values[index] == InstagramID.instagramReels ||
                    InstagramID.values[index] == InstagramID.instagramStory) {
                  return SelectionBox(
                    index: index,
                  );
                } else {
                  return const SizedBox(
                    width: double.infinity,
                    height: 200,
                    child: Text('Error'),
                  );
                }
              });
            },
          ),
        );
      },
    );
  }
}
