import 'package:food_store_flutter/data/datasources/meals_local_datasource.dart';
import 'package:food_store_flutter/data/repositories/meals_repository_impl.dart';
import 'package:food_store_flutter/domain/repository/meals_repository.dart';
import 'package:food_store_flutter/presentation/cubits/app_meals_cubit.dart';
import 'package:get_it/get_it.dart';

import '../presentation/cubits/app_meals_cubit.dart';

final getIt = GetIt.instance;

Future<void> configureDependencies() async {
  getIt.registerLazySingleton<MealsLocalDataSource>(
    () => MealsLocalDataSource(),
  );

  getIt.registerLazySingleton<MealsRepository>(
    () => MealsRepositoryImpl(getIt<MealsLocalDataSource>()),
  );

  getIt.registerLazySingleton<AppMealsCubit>(
    () => AppMealsCubit(getIt<MealsRepository>()),
  );
}
