import 'package:flutter/material.dart';

class ContentWidget extends StatelessWidget {
  final String content;

  const ContentWidget({Key? key, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      style: const TextStyle(
        fontSize: 16,
          color: Colors.black // Text color
      ),
    );
  }
}
