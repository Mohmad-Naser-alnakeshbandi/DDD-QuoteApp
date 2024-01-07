import 'package:dhbw_se2_quote_app/domain/use_cases/get_saved_quots.dart';
import 'package:dhbw_se2_quote_app/domain/use_cases/remove_quote.dart';
import 'package:dhbw_se2_quote_app/domain/use_cases/save_quote.dart';
import 'package:dhbw_se2_quote_app/presentation/bloc/quote/local/local_quote_event.dart';
import 'package:dhbw_se2_quote_app/presentation/bloc/quote/local/local_quote_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocalQuotsBloc extends Bloc<LocalQuotsEvent, LocalQuotsState> {
  final GetSavedQuoteUseCase _getSavedQuoteUseCase;
  final SaveQuoteUseCase _saveQuoteUseCase;
  final RemoveQuoteUseCase _removeQuoteUseCase;

  LocalQuotsBloc(this._getSavedQuoteUseCase, this._saveQuoteUseCase,
      this._removeQuoteUseCase)
      : super(const LocalQuotsLoading()) {
    on<GetSavedQuots>(onGetSavedQuots);
    on<RemoveQuots>(onRemoveQuots);
    on<SaveQuots>(onSaveQuots);
  }

  void onGetSavedQuots(
      GetSavedQuots event, Emitter<LocalQuotsState> emit) async {
    final quots = await _getSavedQuoteUseCase();
    emit(LocalQuotsDone(quots));
  }

  void onRemoveQuots(
      RemoveQuots removeQuots, Emitter<LocalQuotsState> emit) async {
    await _removeQuoteUseCase(params: removeQuots.quots);
    final quots = await _getSavedQuoteUseCase();
    emit(LocalQuotsDone(quots));
  }

  void onSaveQuots(SaveQuots saveQuots, Emitter<LocalQuotsState> emit) async {
    await _saveQuoteUseCase(params: saveQuots.quots);
    final quots = await _getSavedQuoteUseCase();
    emit(LocalQuotsDone(quots));
  }
}
