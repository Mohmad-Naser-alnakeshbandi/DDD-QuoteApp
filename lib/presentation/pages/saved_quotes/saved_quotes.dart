import 'package:dhbw_se2_quote_app/presentation/bloc/quote/local/local_quote_state.dart';
import 'package:dhbw_se2_quote_app/presentation/pages/quote_detail/quote_detail.dart';
import 'package:dhbw_se2_quote_app/presentation/widgets/Home_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dhbw_se2_quote_app/di/injection_container.dart';
import 'package:dhbw_se2_quote_app/domain/entities/quote.dart';
import 'package:dhbw_se2_quote_app/presentation/bloc/quote/local/local_quote_bloc.dart';
import 'package:dhbw_se2_quote_app/presentation/bloc/quote/local/local_quote_event.dart';

class SavedQuotes extends StatelessWidget {
  const SavedQuotes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<LocalQuotsBloc>()..add(const GetSavedQuots()),
      child: Scaffold(
        appBar: _buildAppbar(context),
        body: _buildBody(),
      ),
    );
  }

  AppBar _buildAppbar(BuildContext context) {
    return AppBar(
      title: const Text(
        'Saved Quote',
        style: TextStyle(color: Colors.black),
      ),
      actions: const [
        Row(
          children: [HomeWidget()],
        ),
      ],
    );
  }

  Widget _buildBody() {
    return BlocBuilder<LocalQuotsBloc, LocalQuotsState>(
      builder: (context, state) {
        if (state is LocalQuotsLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is LocalQuotsDone) {
          return _buildQuotesList(state.quots!);
        }
        return Container();
      },
    );
  }

  Widget _buildQuotesList(List<QuoteEntity> quotes) {
    if (quotes.isEmpty) {
      return const Center(
        child: Text(
          'NO SAVED QUOTES',
          style: TextStyle(color: Colors.black),
        ),
      );
    }

    return ListView.builder(
      itemCount: quotes.length,
      itemBuilder: (context, index) {
        final quote = quotes[index];
        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => QuoteDetailsView(quote: quote),
              ),
            );
          },
          child: ListTile(
            title: Text(
              quote.authorName!,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              quote.content!,
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () => _onRemoveQuotes(context, quote),
            ),
          ),
        );
      },
    );
  }

  void _onRemoveQuotes(BuildContext context, QuoteEntity quote) {
    BlocProvider.of<LocalQuotsBloc>(context).add(RemoveQuots(quote));
  }
}
