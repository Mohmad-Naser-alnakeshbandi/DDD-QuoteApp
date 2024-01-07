import 'package:dhbw_se2_quote_app/config/routes/routes.dart';
import 'package:dhbw_se2_quote_app/presentation/bloc/quote/local/local_quote_bloc.dart';
import 'package:dhbw_se2_quote_app/presentation/bloc/quote/remote/remote_quote_bloc.dart';
import 'package:dhbw_se2_quote_app/presentation/pages/home/random_quote.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'config/theme/app_theme.dart';
import 'di/injection_container.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => sl<RemoteQuotesBloc>(),
        ),
        BlocProvider(
          create: (_) => sl<LocalQuotsBloc>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme(),
        onGenerateRoute: AppRoutes.onGenerateRoutes,
        home: const RandomQuote(),
      ),
    );
  }
}
