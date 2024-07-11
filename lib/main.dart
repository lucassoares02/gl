import 'package:flutter/material.dart';
import 'package:gl/src/route/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppRouter? appRouter = AppRouter();

    return MaterialApp.router(
      title: 'Jobify',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routeInformationParser: appRouter!.defaultRouteParser(),
      routerDelegate: appRouter.delegate(),
    );
  }
}
