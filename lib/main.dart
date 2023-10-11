import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:quick_meet/core/constants.dart';
import 'package:quick_meet/data/enum.dart';
import 'package:quick_meet/data/service/write_log.dart';
import 'package:quick_meet/di/service_locator.dart';
import 'package:quick_meet/domain/router/route_constants.dart';
import 'package:quick_meet/domain/router/route_impl.dart';

void main() {
  runZonedGuarded(
    () async {
      var widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
      FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.light,
        ),
      );
      runApp(const MyApp());
    },
    (e, s) {
      WriteLogs.write('[!!!]     Global error: $e');
      WriteLogs.write('[!!!]     Stack: $s');
    },
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final globalStream = StreamController<GlobalEvents>.broadcast();
  bool loading = true;
  var router = RouteImpl(
    rootNavigatorKey: GlobalKey<NavigatorState>(debugLabel: 'root'),
    meetsNavigatorKey: GlobalKey<NavigatorState>(debugLabel: 'meets'),
    mapNavigatorKey: GlobalKey<NavigatorState>(debugLabel: 'map'),
    businessNavigatorKey: GlobalKey<NavigatorState>(debugLabel: 'business'),
    profileNavigatorKey: GlobalKey<NavigatorState>(debugLabel: 'profile'),
  );

  @override
  void initState() {
    super.initState();
    init(globalStream).then((auth) {
      setState(() {
        loading = false;
      });
      auth ? router.newRoutesPath([MapRoutes.map.name]) : router.newRoutesPath([RootRoutes.start.name]);
      FlutterNativeSplash.remove();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => getIt),
        RepositoryProvider(create: (context) => router),
      ],
      child: (!loading)
          ? MaterialApp.router(
              debugShowCheckedModeBanner: false,
              routerConfig: router.goRouterImplt.router,
              theme: ThemeData(fontFamily: 'Inter'),
              // theme: ThemeEx.theme(),
              // routes: {
              //   '/auth_sms_page': (context) => const AuthSmsPage(),
              //   '/auth_sms_code_page': (context) => const AuthSmsCodePage(),
              //   '/auth_password_page': (context) => const AuthPasswordPage(),
              //   '/reg_phone_page': (context) => const RegPhonePage(),
              //   '/reg_sms_code_page': (context) => const RegSmsCodePage(),
              //   '/reg_password_page': (context) => const RegPasswordPage(),
              //   '/reg_final_page': (context) => const RegFinalPage(),
              //   '/password_recovery_phone_page': (context) => const PasswordRecoveryPhonePage(),
              //   '/password_recovery_sms_code_page': (context) => const PasswordRecoverySmsCodePage(),
              //   '/password_recovery_enter_page': (context) => const PasswordRecoveryEnterPage(),
              //   '/main_page': (context) => const MainPage(),
              //   '/map_page': (context) => const MapPage(),
              //   '/create_meet_page': (context) => const CreateMeetPage(),
              //   '/profile_page': (context) => const ProfilePage(),
              //   '/meetings_page': (context) => const MeetingsPage(),
              //   '/profile_edit_page': (context) => const ProfileEditPage(),
              // },
              // home: const StartPage(),
            )
          : const SizedBox.shrink(),
    );
  }

  Future<bool> init(
    StreamController<GlobalEvents> gs,
  ) async {
    bool isAuth = await setup();

    var url = Uri.tryParse(AppConstants.baseUrl);

    if (url == null) {
      throw 'AppConstants.serverUrl error';
    }

    return isAuth;
  }
}
