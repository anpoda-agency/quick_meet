import 'package:flutter/material.dart';

class RegFinalPage extends StatefulWidget {
  const RegFinalPage({super.key});

  @override
  State<RegFinalPage> createState() => _RegFinalPageState();
}

class _RegFinalPageState extends State<RegFinalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF6B4EFF),
        elevation: 0,
      ),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomCenter,
            //textDirection: TextDirection.ltr,

            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: 220,
                decoration: const ShapeDecoration(
                  color: Color(0xFF6B4EFF),
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.only(bottomRight: Radius.circular(30)),
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
              // Надписи на фиолетовом фоне
              // Column(
              //   children: [
              //     const SizedBox(
              //       width: 200,
              //       height: 100,
              //       child: Text.rich(
              //         TextSpan(
              //           children: [
              //             TextSpan(
              //               text: 'Войти в\n',
              //               style: TextStyle(
              //                 color: Color(0xFFD9D9D9),
              //                 fontSize: 32,
              //                 fontFamily: 'Comfortaa',
              //                 fontWeight: FontWeight.w700,
              //                 letterSpacing: 1.60,
              //               ),
              //             ),
              //             TextSpan(
              //               text: 'QuickMeet',
              //               style: TextStyle(
              //                 color: Colors.white,
              //                 fontSize: 36,
              //                 fontFamily: 'Comfortaa',
              //                 fontWeight: FontWeight.w700,
              //                 letterSpacing: 1.80,
              //               ),
              //             ),
              //           ],
              //         ),
              //         textAlign: TextAlign.center,
              //       ),
              //     ),
              //     Align(
              //       alignment: Alignment.bottomRight,
              //       child: Container(
              //         width: 282,
              //         decoration: const ShapeDecoration(
              //           shape: RoundedRectangleBorder(
              //             side: BorderSide(
              //               width: 0.20,
              //               strokeAlign: BorderSide.strokeAlignCenter,
              //               color: Colors.white,
              //             ),
              //           ),
              //         ),
              //       ),
              //     ),
              //     const SizedBox(
              //       height: 27,
              //     ),
              //   ],
              // ),
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
                  'Имя*',
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
                height: 12,
              ),
              const SizedBox(
                width: 271,
                child: Text(
                  'Фамилия*',
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
                height: 12,
              ),
              // const SizedBox(
              //   height: 17,
              // ),
              // const SizedBox(
              //   width: 335,
              //   height: 50,
              //   child: Text(
              //     'Забыли пароль?',
              //     textAlign: TextAlign.center,
              //     style: TextStyle(
              //       color: Color(0xFF505050),
              //       fontSize: 16,
              //       fontFamily: 'SF Pro Text',
              //       fontWeight: FontWeight.w300,
              //       decoration: TextDecoration.underline,
              //       letterSpacing: 0.80,
              //     ),
              //   ),
              // ),
              const SizedBox(
                width: 271,
                child: Text(
                  'Дата рождения*',
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
                height: 12,
              ),
              const SizedBox(
                width: 271,
                child: Text(
                  'Электронная почта*',
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
              // const SizedBox(
              //   height: 12,
              // ),
              const SizedBox(
                height: 40,
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
                    onPressed: () {
                      Navigator.pushNamed(context, '/');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF6B4EFF),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18)),
                    ),
                    child: const Text(
                      'Зарегистрироваться',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 19,
                        fontFamily: 'Comfortaa',
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.95,
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
    );
  }
}
