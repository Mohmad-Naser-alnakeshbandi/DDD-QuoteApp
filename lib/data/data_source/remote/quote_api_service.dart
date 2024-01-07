import 'package:dhbw_se2_quote_app/core/constants/constants.dart';
import 'package:dhbw_se2_quote_app/data/model/quote.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'quote_api_service.g.dart';

@RestApi(baseUrl: Url.url)
abstract class QuoteApiService {
  factory QuoteApiService(Dio dio) = _QuoteApiService;

  @GET('')
  Future<HttpResponse<QuoteModel>> getAQuote({
    @Header('X-RapidAPI-Key') String apiKey = Url.xRapidAPIKey,
    @Header('X-RapidAPI-Host') String apiHost =  Url.xRapidAPIHost,
  });
}

