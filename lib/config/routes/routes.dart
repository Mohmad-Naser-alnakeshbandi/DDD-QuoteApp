import 'package:dhbw_se2_quote_app/domain/entities/quote.dart';
import 'package:dhbw_se2_quote_app/presentation/pages/home/random_quote.dart';
import 'package:dhbw_se2_quote_app/presentation/pages/quote_detail/quote_detail.dart';
import 'package:dhbw_se2_quote_app/presentation/pages/saved_quotes/saved_quotes.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _materialRoute(const RandomQuote());

      case '/QuotesDetails':
        return _materialRoute(
            QuoteDetailsView(quote: settings.arguments as QuoteEntity));

      case '/SavedQuote':
        return _materialRoute(const SavedQuotes());

      default:
        return _materialRoute(const RandomQuote());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
