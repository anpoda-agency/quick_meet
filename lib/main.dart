import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_meet/di/service_locator.dart';
import 'package:quick_meet/features/auth/auth_with_sms/step_one_phone/ui/auth_sms_page.dart';
import 'package:quick_meet/features/auth/auth_with_password/ui/auth_password_page.dart';
import 'package:quick_meet/features/auth/auth_with_sms/step_two_code/ui/auth_sms_code_page.dart';
import 'package:quick_meet/test_ui/ui/create_meet_pages/create_meet_page.dart';
import 'package:quick_meet/test_ui/ui/main_pages/main_page.dart';
import 'package:quick_meet/test_ui/ui/main_pages/map_page.dart';
import 'package:quick_meet/test_ui/ui/main_pages/meetings_pages/meetings_page.dart';
import 'package:quick_meet/test_ui/ui/main_pages/profile_pages/profile_edit_page.dart';
import 'package:quick_meet/test_ui/ui/main_pages/profile_pages/profile_page.dart';
import 'package:quick_meet/features/reset_password/step_three/ui/password_recovery_enter_page.dart';
import 'package:quick_meet/features/reset_password/step_one/ui/password_recovery_phone_page.dart';
import 'package:quick_meet/features/reset_password/step_two/ui/password_recovery_sms_code_page.dart';
import 'package:quick_meet/features/registration/step_four_fields/ui/reg_final_page.dart';
import 'package:quick_meet/features/registration/step_three_password/reg_password_page.dart';
import 'package:quick_meet/features/registration/step_one_phone/ui/reg_phone_page.dart';
import 'package:quick_meet/features/registration/step_two_code/ui/reg_sms_code_page.dart';
import 'package:quick_meet/features/auth/auth_start/start_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    setup();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => getIt),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/auth_sms_page': (context) => const AuthSmsPage(),
          '/auth_sms_code_page': (context) => const AuthSmsCodePage(),
          '/auth_password_page': (context) => const AuthPasswordPage(),
          '/reg_phone_page': (context) => const RegPhonePage(),
          '/reg_sms_code_page': (context) => const RegSmsCodePage(),
          '/reg_password_page': (context) => const RegPasswordPage(),
          '/reg_final_page': (context) => const RegFinalPage(),
          '/password_recovery_phone_page': (context) => const PasswordRecoveryPhonePage(),
          '/password_recovery_sms_code_page': (context) => const PasswordRecoverySmsCodePage(),
          '/password_recovery_enter_page': (context) => const PasswordRecoveryEnterPage(),
          '/main_page': (context) => const MainPage(),
          '/map_page': (context) => const MapPage(),
          '/create_meet_page': (context) => const CreateMeetPage(),
          '/profile_page': (context) => const ProfilePage(),
          '/meetings_page': (context) => const MeetingsPage(),
          '/profile_edit_page': (context) => const ProfileEditPage(),
        },
        home: const StartPage(),
      ),
    );
  }
}
