import 'package:flutter/material.dart';

class AuthorWidget extends StatelessWidget {
  final String authorName;

  const AuthorWidget({super.key, required this.authorName});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "- ",
            style: TextStyle(
              fontSize: 16,
              color: Colors.black, // Hyphen text color
            ),
          ),
          Text(
            authorName,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black, // Author text color
            ),
          ),
          const Text(
            " -",
            style: TextStyle(
              fontSize: 16,
              color: Colors.black, // Hyphen text color
            ),
          ),
        ],
      ),
    );
  }
}
