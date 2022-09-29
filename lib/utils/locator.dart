import 'package:get_it/get_it.dart';
import 'package:rakshak/utils/global.dart';

GetIt locator = GetIt.instance;

class Locator {
  static final GetIt locator = GetIt.instance;

  static void init() {
    locator.registerLazySingleton(() => GlobalServices());
  }
}
