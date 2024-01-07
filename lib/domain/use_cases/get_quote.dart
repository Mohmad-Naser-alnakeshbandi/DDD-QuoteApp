import 'package:dhbw_se2_quote_app/core/resources/data_state.dart';
import 'package:dhbw_se2_quote_app/domain/entities/quote.dart';
import 'package:dhbw_se2_quote_app/domain/repositories/quote_repository.dart';

import '../../core/usecases/usecase.dart';

class GetAQuoteUseCase implements UseCase<DataState<QuoteEntity>,void>{

  final QuoteRepository _quoteRepository;

  GetAQuoteUseCase(this._quoteRepository);

  @override
  Future<DataState<QuoteEntity>> call({void params}) {
    return _quoteRepository.getAQuote();
  }
}