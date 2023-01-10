import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'contents_saver.dart';

class SelectionBox extends StatelessWidget {
  final int index;
  const SelectionBox({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: double.infinity,
      color: Colors.grey.shade600,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 250,
              height: 40,
              child: ElevatedButton(
                onPressed: () {
                  Provider.of<ContentsSaver>(context, listen: false)
                      .selectImageFromCamera(InstagramID.values[index]);
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.black),
                ),
                child: const Text('CAMERA'),
              ),
            ),
            SizedBox(
              width: 250,
              height: 40,
              child: ElevatedButton(
                onPressed: () {
                  Provider.of<ContentsSaver>(context, listen: false)
                      .selectImageFromGallery(InstagramID.values[index]);
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.black),
                ),
                child: const Text('GALLERY'),
              ),
            ),
          ]),
    );
  }
}
