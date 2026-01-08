import 'package:get_it/get_it.dart';

import '../domain/repository/cart_repository.dart';

final getIt = GetIt.instance;
Future<void> configureDependencies() async {
  //e.g how to provide an object with di
  // getIt.registerLazySingleton<CartRepository>(
  //       () => CartRepositoryImpl(),
  // );
}