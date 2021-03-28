import 'package:moneymietest/core/services/auth_service.dart';
import 'package:get_it/get_it.dart';
import 'package:moneymietest/utils/progressBarManager/dialogService.dart';
import 'package:moneymietest/utils/router/navigationService.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => ProgressService());
  locator.registerLazySingleton(() => MovieService());
}
