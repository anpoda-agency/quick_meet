import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:quick_meet/data/repository/activation_code_repository.dart';
import 'package:quick_meet/features/reset_password/step_one/bloc/password_recovery_bloc.dart';

class PasswordRecoveryPhonePage extends StatefulWidget {
  const PasswordRecoveryPhonePage({super.key});

  @override
  State<PasswordRecoveryPhonePage> createState() => _PasswordRecoveryPhonePageState();
}

class _PasswordRecoveryPhonePageState extends State<PasswordRecoveryPhonePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PasswordRecoveryBloc(
        activationCodeRepository: context.read<GetIt>().get<ActivationCodeRepository>(),
        pageState: const PageState(),
      ),
      child: BlocConsumer<PasswordRecoveryBloc, PasswordRecoveryState>(
        listener: (context, state) {
          if (state is PasswordRecoveryError) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                backgroundColor: const Color(0xFF6B4EFF),
                contentPadding: EdgeInsets.zero,
                content: SizedBox(
                  width: 341,
                  height: 247,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 61,
                      ),
                      SizedBox(
                        width: 285,
                        child: Text(
                          state.pageState.errMsg,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontFamily: 'Comfortaa',
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.40,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 29,
                      ),
                      Container(
                        width: 285,
                        height: 50,
                        decoration: ShapeDecoration(
                          color: const Color(0xFFF5F5F5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFF5F5F5),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                            ),
                            child: const Text(
                              'Закрыть',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF6B4EFF),
                                fontSize: 20,
                                fontFamily: 'Comfortaa',
                                fontWeight: FontWeight.w400,
                                letterSpacing: 1,
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
          if (state is PasswordRecoveryAllowedToPush) {
            Navigator.pushNamed(context, '/password_recovery_sms_code_page', arguments: state.pageState.request.source);
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: const Color(0xFF6B4EFF),
              elevation: 0,
            ),
            body: SingleChildScrollView(
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    //textDirection: TextDirection.ltr,

                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 351,
                        decoration: const ShapeDecoration(
                          color: Color(0xFF6B4EFF),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(bottomRight: Radius.circular(30)),
                          ),
                          shadows: [
                            BoxShadow(
                              color: Color(0x19000000),
                              blurRadius: 15,
                              offset: Offset(0, 4),
                              spreadRadius: 0,
                            )
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          const SizedBox(
                            width: 350,
                            height: 100,
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Сбросить пароль в\n',
                                    style: TextStyle(
                                      color: Color(0xFFD9D9D9),
                                      fontSize: 32,
                                      fontFamily: 'Comfortaa',
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: 1.60,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'QuickMeet',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 36,
                                      fontFamily: 'Comfortaa',
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: 1.80,
                                    ),
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Container(
                              width: 282,
                              decoration: const ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    width: 0.20,
                                    strokeAlign: BorderSide.strokeAlignCenter,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 27,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 49,
                  ),
                  Column(
                    children: [
                      const SizedBox(
                        width: 271,
                        child: Text(
                          'Номер телефона',
                          style: TextStyle(
                            color: Color(0xFF505050),
                            fontSize: 16,
                            fontFamily: 'SF Pro Text',
                            fontWeight: FontWeight.w300,
                            letterSpacing: 0.80,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Container(
                        width: 285,
                        height: 50,
                        child: TextField(
                          onChanged: (value) =>
                              context.read<PasswordRecoveryBloc>().add(PasswordRecoveryInputNumber(value)),
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                              borderSide: const BorderSide(width: 0.50, color: Color(0xFF6B4EFF)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                              borderSide: const BorderSide(width: 0.50, color: Color(0xFF6B4EFF)),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 29,
                      ),
                      Container(
                        width: 285,
                        height: 50,
                        decoration: ShapeDecoration(
                          color: Color(0xFFF5F5F5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                        child: ElevatedButton(
                            onPressed: () => context.read<PasswordRecoveryBloc>().add(PasswordRecoverySend()),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFFF5F5F5),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                            ),
                            child: const Text(
                              'Получить код',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontFamily: 'Comfortaa',
                                fontWeight: FontWeight.w400,
                                letterSpacing: 1,
                              ),
                            )),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
