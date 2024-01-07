import 'package:dhbw_se2_quote_app/domain/entities/quote.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

abstract class RemoteQuoteState extends Equatable {
  final QuoteEntity? quote;
  final DioError? error;

  const RemoteQuoteState({this.quote, this.error});

  @override
  List<Object?> get props => [quote, error];
}


class RemoteQuoteLoading extends RemoteQuoteState {
  const RemoteQuoteLoading();
}

class RemoteQuoteDone extends RemoteQuoteState {
  const RemoteQuoteDone(QuoteEntity quote) : super(quote: quote);
}

class RemoteQuoteError extends RemoteQuoteState {
  const RemoteQuoteError(DioError error) : super(error: error);
}