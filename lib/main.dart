import 'package:flutter/material.dart';
import 'package:goalnow_app/core/network/api_client.dart';
import 'package:goalnow_app/provider/match_provider.dart';
import 'package:goalnow_app/provider/news_provider.dart';
import 'package:goalnow_app/provider/user_provider.dart';
import 'package:goalnow_app/repository/math_repository.dart';
import 'package:goalnow_app/repository/news_repository.dart';
import 'package:goalnow_app/routes/app_route.dart';
import 'package:goalnow_app/service/match_service.dart';
import 'package:goalnow_app/service/news_service.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        /// Core
        Provider(create: (_) => ApiClient()),

        /// Services
        Provider(create: (c) => NewsService(c.read<ApiClient>())),
        Provider(create: (c) => MatchService(c.read<ApiClient>())),

        /// Repositories
        Provider(create: (c) => NewsRepository(c.read<NewsService>())),
        Provider(create: (c) => MatchRepository(c.read<MatchService>())),

        /// Providers
        ChangeNotifierProvider(
          create: (c) => NewsProvider(c.read<NewsRepository>()),
        ),
        ChangeNotifierProvider(
          create: (c) => MatchProvider(c.read<MatchRepository>()),
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
