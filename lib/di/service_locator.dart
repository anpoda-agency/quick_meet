import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:quick_meet/data/network/api/activation_code_api.dart';
import 'package:quick_meet/data/network/api/auth_api.dart';
import 'package:quick_meet/data/network/api/user_api.dart';
import 'package:quick_meet/data/network/dio_client.dart';
import 'package:quick_meet/domain/repository/activation_code_repository.dart';
import 'package:quick_meet/domain/repository/auth_repository.dart';
import 'package:quick_meet/domain/repository/home_repository.dart';
import 'package:quick_meet/domain/repository/user_repository.dart';
import 'package:quick_meet/features/auth/auth_start/start_page.dart';
import 'package:quick_meet/features/home/home_page.dart';
import 'package:quick_meet/features/profile/profile_editor/ui/profile_edit_page.dart';
import 'package:quick_meet/features/profile/profile_page/ui/profile_page.dart';

final getIt = GetIt.instance;

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorMeetsKey = GlobalKey<NavigatorState>(debugLabel: 'Meets');
final _shellNavigatorMapKey = GlobalKey<NavigatorState>(debugLabel: 'Map');
final _shellNavigatorProfileKey = GlobalKey<NavigatorState>(debugLabel: 'Profile');
final _shellNavigatorBusinessKey = GlobalKey<NavigatorState>(debugLabel: 'Business');

final goRouter = GoRouter(
  initialLocation: '/start',
  navigatorKey: _rootNavigatorKey,
  routes: [
    GoRoute(
      path: '/start',
      pageBuilder: (context, state) => const NoTransitionPage(
        child: StartPage(),
      ),
      routes: [
        // child route
        GoRoute(
          path: 'details',
          builder: (context, state) => const ProfileEditPage(),
        ),
      ],
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return ScaffoldNavBar(navigationShell: navigationShell);
      },
      branches: [
        // first branch (A)
        StatefulShellBranch(
          navigatorKey: _shellNavigatorMeetsKey,
          routes: [
            // top route inside branch
            GoRoute(
              path: '/',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: ProfilePage(),
              ),
              routes: [
                // child route
                GoRoute(
                  path: 'details',
                  builder: (context, state) => const ProfileEditPage(),
                ),
              ],
            ),
          ],
        ),
        // second branch (B)
        StatefulShellBranch(
          navigatorKey: _shellNavigatorMapKey,
          routes: [
            // top route inside branch
            GoRoute(
              path: '/b',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: ProfilePage(),
              ),
              routes: [
                // child route
                GoRoute(
                  path: 'details',
                  builder: (context, state) => const ProfileEditPage(),
                ),
              ],
            ),
          ],
        ),
        // first branch (A)
        StatefulShellBranch(
          navigatorKey: _shellNavigatorProfileKey,
          routes: [
            // top route inside branch
            GoRoute(
              path: '/a',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: ProfilePage(),
              ),
              routes: [
                // child route
                GoRoute(
                  path: 'details',
                  builder: (context, state) => const ProfileEditPage(),
                ),
              ],
            ),
          ],
        ),
        // second branch (B)
        StatefulShellBranch(
          navigatorKey: _shellNavigatorBusinessKey,
          routes: [
            // top route inside branch
            GoRoute(
              path: '/c',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: ProfilePage(),
              ),
              routes: [
                // child route
                GoRoute(
                  path: 'details',
                  builder: (context, state) => const ProfileEditPage(),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  ],
);

Future<bool> setup() async {
  getIt.registerSingleton<Dio>(Dio()
    ..interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90)));
  getIt.registerSingleton<DioClient>(DioClient(getIt<Dio>()));

  getIt.registerSingleton(ActivationCodeApi(dioClient: getIt<DioClient>()));
  getIt.registerSingleton(ActivationCodeRepository(activationCodeApi: getIt.get<ActivationCodeApi>()));

  getIt.registerSingleton(AuthApi(dioClient: getIt<DioClient>()));
  var authRep = getIt.registerSingleton(AuthRepository(authApi: getIt.get<AuthApi>()));

  getIt.registerSingleton(UserApi(dioClient: getIt<DioClient>()));
  getIt.registerSingleton(UserRepository(userApi: getIt.get<UserApi>()));

  getIt.registerSingleton(HomeRepository());

  print('Quick Meet is your future!');

  return authRep.isAuth;
}
