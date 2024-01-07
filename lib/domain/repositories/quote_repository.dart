import 'package:dhbw_se2_quote_app/domain/entities/quote.dart';
import '../../core/resources/data_state.dart';

abstract class QuoteRepository {
// API methods
  Future<DataState<QuoteEntity>> getAQuote();

//Datbase methods

  Future<List<QuoteEntity>> getSavedQuote();

  Future<void> saveQuote(QuoteEntity entity);

  Future<void> removeQuote(QuoteEntity entity);
}
