import 'package:flutter/material.dart';

class OpenQuoteWidget extends StatelessWidget {
  final VoidCallback onPressed;

  const OpenQuoteWidget({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: IconButton(
        icon: const Icon(
          Icons.open_with,
          color: Colors.black,
          size: 24.0,
        ),
        onPressed: onPressed, // Use the onPressed callback here
      ),
    );
  }
}
