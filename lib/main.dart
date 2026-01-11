import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_store_flutter/presentation/screens/home/home_screen.dart';

import 'di/dependency_provider.dart';

final getIt = GetIt.instance;
final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const CartScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: '/cart',
          builder: (BuildContext context, GoRouterState state) {
            return const CartScreen();
          },
        ),
        GoRoute(
          path: '/order_completed',
          builder: (BuildContext context, GoRouterState state) {
            return const OrderCompletedScreen();
          },
        ) ,
        GoRoute(
          path: '/delivery_status_completed',
          builder: (BuildContext context, GoRouterState state) {
            return const DeliveryStateScreen();
          },
        ),
      ],
    ),
  ],
);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureDependencies();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
