import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lookout/contents_saver.dart';
import 'package:provider/provider.dart';

class TextBox extends StatefulWidget {
  final int index;
  const TextBox({super.key, required this.index});

  @override
  State<TextBox> createState() => _TextBoxState(index);
}

class _TextBoxState extends State<TextBox> {
  final int index;
  final _caption = TextEditingController();

  _TextBoxState(this.index);

  @override
  void dispose() {
    _caption.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      height: 150,
      width: double.infinity,
      color: Colors.grey.shade600,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextField(
            controller: _caption,
            decoration: InputDecoration(
                hoverColor: Colors.black,
                hintText: 'Enter your Caption',
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                    onPressed: () {
                      _caption.clear();
                    },
                    icon: const Icon(Icons.clear))),
          ),
          SizedBox(
            width: 100,
            child: ElevatedButton(
              onPressed: () {
                Provider.of<ContentsSaver>(context, listen: false)
                    .saveCaption(InstagramID.values[index], _caption.text);
                Navigator.pop(context);
                Navigator.pop(context);
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
              ),
              child: const Text('DONE'),
            ),
          ),
        ],
      ),
    );
  }
}
