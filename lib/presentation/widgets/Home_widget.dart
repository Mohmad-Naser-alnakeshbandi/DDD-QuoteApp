import 'package:flutter/material.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: IconButton(
        icon: const Icon(
          Icons.home,
          color: Colors.black,
          size: 24.0,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
