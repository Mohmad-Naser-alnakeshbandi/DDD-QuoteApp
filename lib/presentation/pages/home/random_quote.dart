import 'package:dhbw_se2_quote_app/presentation/bloc/quote/remote/remote_quote_bloc.dart';
import 'package:dhbw_se2_quote_app/presentation/bloc/quote/remote/remote_quote_event.dart';
import 'package:dhbw_se2_quote_app/presentation/bloc/quote/remote/remote_quote_state.dart';
import 'package:dhbw_se2_quote_app/presentation/widgets/author_widget.dart';
import 'package:dhbw_se2_quote_app/presentation/widgets/copy_widget.dart';
import 'package:dhbw_se2_quote_app/presentation/widgets/open_quote_widget.dart';
import 'package:dhbw_se2_quote_app/presentation/widgets/saved_quote_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../widgets/content_widget.dart';
import '../../widgets/tags_widget.dart';

class RandomQuote extends StatelessWidget {
  const RandomQuote({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(context),
      body: Stack(
        children: [
          BlocBuilder<RemoteQuotesBloc, RemoteQuoteState>(
            builder: (context, state) {
              if (state is RemoteQuoteLoading) {
                return const Center(child: CupertinoActivityIndicator());
              }
              if (state is RemoteQuoteDone) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SingleChildScrollView(
                      child: Container(
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 216, 217,
                              218), // Background color for the quote
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Stack(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ContentWidget(content: state.quote!.content!),
                                const SizedBox(
                                    height:
                                        10), // Add spacing between quote content and tags
                                TagsWidget(tags: state.quote!.tags!),
                                const SizedBox(
                                    height:
                                        10), // Add spacing between tags and author
                                AuthorWidget(
                                    authorName: state.quote!.authorName!),

                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CopyWidget(quote: state.quote!),
                                    const Spacer(),
                                    OpenQuoteWidget(
                                      onPressed: () {
                                        Navigator.pushNamed(
                                            context, '/QuotesDetails',
                                            arguments: state.quote!);
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }
              if (state is RemoteQuoteError) {
                return const Center(child: Icon(Icons.refresh));
              }
              return Container();
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: 400.0, // Set the width to the desired value
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: const Color.fromARGB(255, 216, 217, 218),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                  ),
                  onPressed: () {
                    context.read<RemoteQuotesBloc>().add(const GetAQuote());
                  },
                  child: const Text(
                    'Get a quote',
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

_buildAppbar(BuildContext context) {
  return AppBar(
    title: const Text(
      'A Quote',
      style: TextStyle(color: Colors.black),
    ),
    actions: const [
      Row(
        children: [
           SaveQuoteWidget(),
        ],
      ),
    ],
  );
}
