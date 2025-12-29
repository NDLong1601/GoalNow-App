import 'package:flutter/material.dart';
import 'package:goalnow_app/core/network/api_client.dart';
import 'package:goalnow_app/provider/highlight_provider.dart';
import 'package:goalnow_app/provider/match_provider.dart';
import 'package:goalnow_app/provider/news_provider.dart';
import 'package:goalnow_app/provider/transfer_provider.dart';
import 'package:goalnow_app/provider/user_provider.dart';
import 'package:goalnow_app/repository/math_repository.dart';
import 'package:goalnow_app/repository/news_repository.dart';
import 'package:goalnow_app/repository/transfer_repository.dart';
import 'package:goalnow_app/repository/youtube_repository.dart';
import 'package:goalnow_app/routes/app_route.dart';
import 'package:goalnow_app/service/api/match_service.dart';
import 'package:goalnow_app/service/api/news_service.dart';
import 'package:goalnow_app/service/api/transfer_service.dart';
import 'package:goalnow_app/service/api/youtube_service.dart';
import 'package:goalnow_app/service/local/local_service.dart';
import 'package:goalnow_app/model/transfer/transfer_local_model.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/adapters.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Hive Init
  await Hive.initFlutter();
  Hive.registerAdapter(TransferLocalModelAdapter());

  // Local Service Init
  final localService = LocalService();
  await localService.init();

  runApp(
    MultiProvider(
      providers: [
        /// ApiClient
        Provider(create: (_) => ApiClient()),

        /// LocalService PHẢI Ở TRƯỚC Repository
        Provider<LocalService>.value(value: localService),

        /// Services
        Provider(create: (c) => NewsService(c.read<ApiClient>())),
        Provider(create: (c) => MatchService(c.read<ApiClient>())),
        Provider(create: (c) => TransferService(c.read<ApiClient>())),
        Provider(create: (c) => YouTubeService()),

        /// Repositories
        Provider(create: (c) => NewsRepository(c.read<NewsService>())),
        Provider(create: (c) => MatchRepository(c.read<MatchService>())),
        Provider(
          create: (c) => TransferRepository(
            c.read<TransferService>(),
            c.read<LocalService>(),
          ),
        ),
        Provider(
          create: (c) => YouTubeRepository(service: c.read<YouTubeService>()),
        ),

        /// Providers
        ChangeNotifierProvider(
          create: (c) => NewsProvider(c.read<NewsRepository>()),
        ),
        ChangeNotifierProvider(
          create: (c) => MatchProvider(c.read<MatchRepository>()),
        ),
        ChangeNotifierProvider(
          create: (c) => TransferProvider(c.read<TransferRepository>()),
        ),
        ChangeNotifierProvider(
          create: (c) =>
              HighlightProvider(repository: c.read<YouTubeRepository>()),
        ),
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GoalNow',
      darkTheme: ThemeData.dark(),
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      initialRoute: AppRoute.signIn,
      routes: AppRoute().routes,
    );
  }
}
