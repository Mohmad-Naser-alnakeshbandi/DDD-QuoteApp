import 'dart:io';

import 'package:dhbw_se2_quote_app/core/resources/data_state.dart';
import 'package:dhbw_se2_quote_app/data/data_source/local/app_database.dart';
import 'package:dhbw_se2_quote_app/data/data_source/remote/quote_api_service.dart';
import 'package:dhbw_se2_quote_app/data/model/quote.dart';
import 'package:dhbw_se2_quote_app/domain/entities/quote.dart';
import 'package:dhbw_se2_quote_app/domain/repositories/quote_repository.dart';
import 'package:dio/dio.dart';

class QuoteRepositoryImp implements QuoteRepository {
  final QuoteApiService _quoteApiService;
  final AppDatabase _appDatabase;

  QuoteRepositoryImp(this._quoteApiService, this._appDatabase);

  @override
  Future<DataState<QuoteModel>> getAQuote() async {
    try {
      final httpResponse = await _quoteApiService.getAQuote();

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(
          DioError(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioErrorType.badResponse,
            requestOptions: httpResponse.response.requestOptions,
          ),
        );
      }
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<List<QuoteModel>> getSavedQuote() async {
    return _appDatabase.quoteDAO.getQuots();
  }

  @override
  Future<void> removeQuote(QuoteEntity entity) {
    return _appDatabase.quoteDAO.deleteQoute(QuoteModel.fromEntity(entity));
  }

  @override
  Future<void> saveQuote(QuoteEntity entity) {
    return _appDatabase.quoteDAO.insertQoute(QuoteModel.fromEntity(entity));
  }
}
