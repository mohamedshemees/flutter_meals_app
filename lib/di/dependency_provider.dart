import 'package:get_it/get_it.dart';

import '../data/cart_repository_impl.dart';
import '../domain/repository/cart_repository.dart';
import '../main.dart';

Future<void> configureDependencies() async {

  getIt.registerLazySingleton<CartRepository>(
        () => CartRepositoryImpl(),
  );
}