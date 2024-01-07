import 'package:dhbw_se2_quote_app/core/usecases/usecase.dart';
import 'package:dhbw_se2_quote_app/domain/entities/quote.dart';
import 'package:dhbw_se2_quote_app/domain/repositories/quote_repository.dart';

class GetSavedQuoteUseCase implements UseCase<List<QuoteEntity>, void> {
  final QuoteRepository _quoteRepository;

  GetSavedQuoteUseCase(this._quoteRepository);

  @override
  Future<List<QuoteEntity>> call({void params}) {
    return _quoteRepository.getSavedQuote();
  }
}
