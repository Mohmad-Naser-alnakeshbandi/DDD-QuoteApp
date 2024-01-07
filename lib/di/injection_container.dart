import 'package:dhbw_se2_quote_app/data/data_source/local/app_database.dart';
import 'package:dhbw_se2_quote_app/data/data_source/remote/quote_api_service.dart';
import 'package:dhbw_se2_quote_app/data/repositories/quote_repository_imp.dart';
import 'package:dhbw_se2_quote_app/domain/repositories/quote_repository.dart';
import 'package:dhbw_se2_quote_app/domain/use_cases/get_quote.dart';
import 'package:dhbw_se2_quote_app/domain/use_cases/get_saved_quots.dart';
import 'package:dhbw_se2_quote_app/domain/use_cases/remove_quote.dart';
import 'package:dhbw_se2_quote_app/domain/use_cases/save_quote.dart';
import 'package:dhbw_se2_quote_app/presentation/bloc/quote/local/local_quote_bloc.dart';
import 'package:dhbw_se2_quote_app/presentation/bloc/quote/remote/remote_quote_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  final database =
      await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  sl.registerSingleton<AppDatabase>(database);

  sl.registerSingleton<Dio>(Dio());

  //Dependencies
  sl.registerSingleton<QuoteApiService>(QuoteApiService(sl()));

  sl.registerSingleton<QuoteRepository>(
    QuoteRepositoryImp(sl(), sl()),
  );

  //UseCases
  sl.registerSingleton<GetAQuoteUseCase>(
    GetAQuoteUseCase(sl()),
  );

  sl.registerSingleton<GetSavedQuoteUseCase>(
    GetSavedQuoteUseCase(sl()),
  );

  sl.registerSingleton<SaveQuoteUseCase>(
    SaveQuoteUseCase(sl()),
  );

  sl.registerSingleton<RemoveQuoteUseCase>(
    RemoveQuoteUseCase(sl()),
  );

  //Blocs
  sl.registerFactory<RemoteQuotesBloc>(() => RemoteQuotesBloc(sl()));

  sl.registerFactory<LocalQuotsBloc>(() => LocalQuotsBloc(sl(), sl(), sl()));
}
