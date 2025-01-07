import 'package:get_it/get_it.dart';
import 'package:to_do_apps/src/features/auth/login/presentation/pages/login_page.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerSingleton<LoginPage>(const LoginPage());
}
