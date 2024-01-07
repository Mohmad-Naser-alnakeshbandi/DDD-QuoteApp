import 'package:flutter/material.dart';

class TagsWidget extends StatelessWidget {
  final String tags;

  const TagsWidget({Key? key, required this.tags}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tagList = tags.split(', '); // Split the comma-separated string into a list of tags
    return Wrap(
      children: tagList
          .map(
            (tag) => Padding(
          padding: const EdgeInsets.only(right: 8.0), // Add spacing between tags
          child: Text(
            '#$tag ',
            style: const TextStyle(
              fontSize: 14,
                color: Colors.black // Tag text color
            ),
          ),
        ),
      )
          .toList(),
    );
  }
}
