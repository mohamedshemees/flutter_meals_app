import 'package:get_it/get_it.dart';

import '../domain/repository/cart_repository.dart';

Future<void> configureDependencies() async {
  final getIt = GetIt.instance;
  //e.g how to provide an object with di
  // getIt.registerLazySingleton<CartRepository>(
  //       () => CartRepositoryImpl(),
  // );
}