import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_meet/core/constants.dart';
import 'package:quick_meet/domain/router/route_constants.dart';
import 'package:quick_meet/domain/router/route_impl.dart';
import 'package:quick_meet/features/core_widgets/auth_widgets/auth_scaffold.dart';
import 'package:quick_meet/features/core_widgets/auth_widgets/auth_custom_button.dart';
import 'package:quick_meet/features/core_widgets/auth_widgets/auth_custom_button_morfy.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox.shrink(),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 28),
                child: Image.asset(
                  '${AppConstants.icons}logo_big.png',
                ),
              ),
              const Text(
                'Find friends, collegues, lover quickly',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 52),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  CustomButtonMorfy(
                    onTap: () => context.read<RouteImpl>().push('auth/${RootRoutes.authWithSmsPhone.name}'),
                    text: 'Войти по смс',
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomButtonMorfy(
                    onTap: () => context.read<RouteImpl>().push('auth/${RootRoutes.authWithPassword.name}'),
                    text: 'Войти с паролем',
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  CustomButton(
                    onTap: () => context.read<RouteImpl>().push('auth/${RootRoutes.registrationPhone.name}'),
                    text: 'Зарегистрироваться',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
