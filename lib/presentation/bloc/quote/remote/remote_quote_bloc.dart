import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dhbw_se2_quote_app/core/resources/data_state.dart';
import 'package:dhbw_se2_quote_app/domain/use_cases/get_quote.dart';
import 'package:dhbw_se2_quote_app/presentation/bloc/quote/remote/remote_quote_event.dart';
import 'package:dhbw_se2_quote_app/presentation/bloc/quote/remote/remote_quote_state.dart';

class RemoteQuotesBloc extends Bloc<RemoteQuoteEvent, RemoteQuoteState> {
  final GetAQuoteUseCase _getAQuoteUseCase;

  RemoteQuotesBloc(this._getAQuoteUseCase) : super(const RemoteQuoteLoading()) {
    on<GetAQuote>(onGetAQuote);
  }

  void onGetAQuote(GetAQuote event, Emitter<RemoteQuoteState> emit) async {
    final dataState = await _getAQuoteUseCase();

    if (dataState is DataSuccess && dataState.data!= null) {
      emit(RemoteQuoteDone(dataState.data!));
    }

    if (dataState is DataFailed) {
      emit(RemoteQuoteError(dataState.error!));
    }
  }
}
