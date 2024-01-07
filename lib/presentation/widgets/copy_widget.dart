import 'package:dhbw_se2_quote_app/domain/entities/quote.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CopyWidget extends StatelessWidget {
  final QuoteEntity quote;

  const CopyWidget({Key? key, required this.quote}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: IconButton(
        icon: const Icon(
          Icons.copy,
          color: Colors.black,
          size: 24.0,
        ),
        onPressed: () {
          Clipboard.setData(ClipboardData(text: '''
              ${quote.authorName} sagt:
              ${quote.content}

              Das Thema dieses Zitats sind: ${quote.tags}

              Über den Autor:
              ${quote.description}

              Um mehr darüber zu erfahren, besuche diese Website:
              ${quote.url}
            '''));
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Quote copied to clipboard'),
            ),
          );
        },
      ),
    );
  }
}
