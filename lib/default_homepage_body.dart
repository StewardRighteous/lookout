import 'package:flutter/material.dart';

class DefaultHomepageBody extends StatelessWidget {
  const DefaultHomepageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          SizedBox(
            height: 250,
            width: 250,
            child: Image(
              image: AssetImage('assets/HomePage/sc.png'),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text('To add your Post, Dp, Bio and more for preview'),
          Text('Click on the + Button'),
        ],
      ),
    );
  }
}
