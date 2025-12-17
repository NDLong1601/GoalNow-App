import 'package:flutter/material.dart';
import 'package:goalnow_app/provider/user_provider.dart';
import 'package:goalnow_app/routes/app_route.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => UserProvider(),
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
