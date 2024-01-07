import 'package:dhbw_se2_quote_app/core/usecases/usecase.dart';
import 'package:dhbw_se2_quote_app/domain/entities/quote.dart';
import 'package:dhbw_se2_quote_app/domain/repositories/quote_repository.dart';

class RemoveQuoteUseCase implements UseCase<void, QuoteEntity> {
  final QuoteRepository _quoteRepository;
  RemoveQuoteUseCase(this._quoteRepository);

  @override
  Future<void> call({QuoteEntity? params}) {
    return _quoteRepository.removeQuote(params!);
  }
}
