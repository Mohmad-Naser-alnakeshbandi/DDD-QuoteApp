import 'package:dhbw_se2_quote_app/data/model/quote.dart';
import 'package:floor/floor.dart';

@dao
abstract class QuoteDao {
  @Insert()
  Future<void> insertQoute(QuoteModel quoteModel);

  @delete
  Future<void> deleteQoute(QuoteModel quoteModel);

  @Query('SELECT * FROM quote')
  Future<List<QuoteModel>> getQuots();
}
