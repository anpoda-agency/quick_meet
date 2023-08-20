import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:quick_meet/data/repository/activation_code_repository.dart';
import 'package:quick_meet/features/auth/auth_with_sms/step_one_phone/bloc/auth_with_sms_bloc.dart';
import 'package:quick_meet/features/core_widgets/auth_logo_area.dart';

class AuthSmsPage extends StatefulWidget {
  const AuthSmsPage({super.key});

  @override
  State<AuthSmsPage> createState() => _AuthSmsPageState();
}

class _AuthSmsPageState extends State<AuthSmsPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthWithSmsBloc(
        activationCodeRepository:
            context.read<GetIt>().get<ActivationCodeRepository>(),
        pageState: const PageState(),
      ),
      child: BlocConsumer<AuthWithSmsBloc, AuthWithSmsState>(
        listener: (context, state) {
          if (state is AuthWithSmsError) {
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
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18)),
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
          if (state is AuthWithSmsAllowedToPush) {
            Navigator.pushNamed(context, '/auth_sms_code_page',
                arguments: state.pageState.request.source);
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
                children: [
                  Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: <Widget>[
                      const AuthLogoAreaWidget(
                        heightRatioRelativeScreen: 0.35,
                      ),
                      Column(
                        children: [
                          const SizedBox(
                            width: 200,
                            height: 100,
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Войти в\n',
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
                          // НИЖЕ КОД КОТОРЫЙ НАЛЕЗАЕТ ДРУГ НА ДРУГА
                          /* SizedBox(
                            width: 170,  
                            height: 0.2,
                            child: Align(
                              alignment: Alignment
                                  .bottomCenter, //Alignment.bottomRight,
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  // margin: EdgeInsets.only(
                                  //     right: MediaQuery.of(context).size.width /
                                  //         6),
                                  //MediaQuery.of(context).size.width / 3),
                                  decoration: const ShapeDecoration(
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        width: 0.6,
                                        strokeAlign:
                                            BorderSide.strokeAlignCenter,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ), */
                          // Дивайдер сломал мне мозг сука
                          Align(
                            alignment:
                                Alignment.bottomCenter, //Alignment.bottomRight,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.only(
                                    left: MediaQuery.of(context).size.width /
                                        3.5),
                                //MediaQuery.of(context).size.width / 3),
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
                      SizedBox(
                        width: 285,
                        height: 50,
                        child: TextField(
                          keyboardType: TextInputType.phone,
                          onChanged: (value) => context
                              .read<AuthWithSmsBloc>()
                              .add(AuthWithSmsEnterPhone(value)),
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                              borderSide: const BorderSide(
                                  width: 0.50, color: Color(0xFF6B4EFF)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                              borderSide: const BorderSide(
                                  width: 0.50, color: Color(0xFF6B4EFF)),
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
                          color: const Color(0xFFF5F5F5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                        child: ElevatedButton(
                            onPressed: () {
                              // Navigator.pushNamed(context, '/auth_sms_code_page');
                              context
                                  .read<AuthWithSmsBloc>()
                                  .add(AuthWithSmsSendPhone());
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFF5F5F5),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18)),
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
