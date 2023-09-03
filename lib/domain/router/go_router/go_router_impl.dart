import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:quick_meet/domain/repository/auth_repository.dart';
import 'package:quick_meet/features/home/home_page.dart';

class GoRouterImplt {
  GoRouterImplt({
    required String initPage,
    required GlobalKey<NavigatorState> rootNavigatorKey,
    required GlobalKey<NavigatorState> meetsNavigatorKey,
    required GlobalKey<NavigatorState> mapNavigatorKey,
    required GlobalKey<NavigatorState> profileNavigatorKey,
    required GlobalKey<NavigatorState> businessNavigatorKey,
    required List<RouteBase> auth,
    required List<RouteBase> root,
    required List<RouteBase> meets,
    required List<RouteBase> map,
    required List<RouteBase> profile,
    required List<RouteBase> business,
  }) : router = GoRouter(
          navigatorKey: rootNavigatorKey,
          debugLogDiagnostics: kDebugMode,
          initialLocation: '/$initPage',
          routes: [
            ...auth,
            ...root,
            StatefulShellRoute.indexedStack(
              builder: (BuildContext context, GoRouterState state, StatefulNavigationShell navigationShell) {
                return ScaffoldNavBar(navigationShell: navigationShell);
              },
              branches: [
                if (meets.isNotEmpty)
                  StatefulShellBranch(
                    navigatorKey: meetsNavigatorKey,
                    routes: meets,
                  ),
                if (map.isNotEmpty)
                  StatefulShellBranch(
                    navigatorKey: mapNavigatorKey,
                    routes: map,
                  ),
                if (profile.isNotEmpty)
                  StatefulShellBranch(
                    navigatorKey: profileNavigatorKey,
                    routes: profile,
                  ),
                if (business.isNotEmpty)
                  StatefulShellBranch(
                    navigatorKey: businessNavigatorKey,
                    routes: business,
                  ),
              ],
            ),
          ],
          redirect: (BuildContext context, state) {
            bool loggingIn = context.read<GetIt>().get<AuthRepository>().isAuth;
            if ((!loggingIn) && (!state.uri.toString().startsWith('/auth'))) {
              return '/start';
            } else {
              return null;
            }
          },
        );

  GoRouter router;
}

// class GoRouterRefreshStreamCustom extends ChangeNotifier {
//   GoRouterRefreshStreamCustom(Stream<dynamic> stream) {
//     notifyListeners();
//     _subscription = stream.asBroadcastStream().listen(
//       (data) {
//         if (data is NavState) {
//           notifyListeners();
//         }
//       },
//     );
//   }

//   late final StreamSubscription<dynamic> _subscription;

//   @override
//   void dispose() {
//     _subscription.cancel();
//     super.dispose();
//   }
// }
