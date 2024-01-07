import 'package:dhbw_se2_quote_app/di/injection_container.dart';
import 'package:dhbw_se2_quote_app/domain/entities/quote.dart';
import 'package:dhbw_se2_quote_app/presentation/bloc/quote/local/local_quote_bloc.dart';
import 'package:dhbw_se2_quote_app/presentation/bloc/quote/local/local_quote_event.dart';
import 'package:dhbw_se2_quote_app/presentation/widgets/Home_widget.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class QuoteDetailsView extends HookWidget {
  final QuoteEntity? quote;

  const QuoteDetailsView({Key? key, this.quote}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<LocalQuotsBloc>(),
      child: Scaffold(
        appBar: _buildAppBar(),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "${quote?.authorName ?? 'Unknown'} sagt:",
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        quote?.content ?? 'No content available',
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        "Das Thema dieses Zitats sind: ${quote?.tags ?? 'No tags available'}",
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Über den Autor:",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        quote?.description ?? 'No description available',
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        "Um mehr darüber zu erfahren, besuche diese Website:",
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Clipboard.setData(
                              ClipboardData(text: quote?.url ?? ''));
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('URL copied to clipboard'),
                            ),
                          );
                        },
                        child: Text(
                          quote?.url ?? 'No URL available',
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.read<LocalQuotsBloc>().add(SaveQuots(quote!));
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                backgroundColor: Colors.black,
                content: Text('Quote saved successfully.'),
              ),
            );
          },
          backgroundColor: Colors.white,
          child: const Icon(Icons.book, color: Colors.black),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text(
        'The Quote Information',
        style: TextStyle(color: Colors.black),
      ),
      actions: const [
        Row(
          children: [HomeWidget()],
        ),
      ],
    );
  }
}
