import 'package:dhbw_se2_quote_app/presentation/pages/saved_quotes/saved_quotes.dart';
import 'package:flutter/material.dart';

class SaveQuoteWidget extends StatelessWidget {
  const SaveQuoteWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: IconButton(
        icon: const Icon(
          Icons.favorite_sharp,
          color: Colors.black,
          size: 24.0,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SavedQuotes()),
          );
        },
      ),
    );
  }
}
