import 'package:get_it/get_it.dart';

import '../data/cart_repository_impl.dart';
import '../domain/repository/cart_repository.dart';
import '../main.dart';

Future<void> configureDependencies() async {

  getIt.registerLazySingleton<CartRepository>(
        () => CartRepositoryImpl(),
  );
final getIt = GetIt.instance;

Future<void> configureDependencies() async {
  getIt.registerLazySingleton<MealsLocalDataSource>(
    () => MealsLocalDataSource(),
  );

  getIt.registerLazySingleton<MealsRepository>(
    () => MealsRepositoryImpl(getIt<MealsLocalDataSource>()),
  );

  getIt.registerFactory<HomeScreenCubit>(
    () => HomeScreenCubit(getIt<MealsRepository>()),
  );
}