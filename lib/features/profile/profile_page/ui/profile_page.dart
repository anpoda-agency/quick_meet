import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(245, 245, 245, 1),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/profile_edit_page', arguments: {
                  //пока что здесь хардкод
                  //'phone': '+7 927 111 22 33',
                  'firstName': 'Данила',
                  'secondName': 'Попов',
                  'email': 'danila.popov@mail.ru',
                  'description': 'Я Данила, лесной кудесник',
                });
              },
              icon: const Icon(
                Icons.edit,
              )),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Stack(
              //alignment: AlignmentDirectional.bottomCenter,
              //textDirection: TextDirection.ltr,

              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 303,
                  decoration: const ShapeDecoration(
                    color: Colors.white,
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
                Center(
                  child: Column(
                    children: [
                      Container(
                        width: 112,
                        height: 112,
                        child: Placeholder(),
                        // decoration:
                        // BoxDecoration(
                        //   image:
                        //   DecorationImage(
                        //     image: NetworkImage(
                        //         "https://via.placeholder.com/112x112"),
                        //     fit: BoxFit.fill,
                        //   ),
                        // ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Попов Данила',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontFamily: 'Comfortaa',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Text(
                        '22 года',
                        style: TextStyle(
                          color: Color(0xFF505050),
                          fontSize: 15,
                          fontFamily: 'SF Pro Text',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        width: 190,
                        height: 35,
                        decoration: ShapeDecoration(
                          color: Color(0xFFF5F5F5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                        child: ElevatedButton(
                            onPressed: () {
                              // Navigator.pushNamed(
                              //     context, '/auth_sms_code_page');
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black87,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18)),
                            ),
                            child: const Text(
                              'ПРЕМИУМ-СТАТУС',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontFamily: 'Comfortaa',
                                fontWeight: FontWeight.w300,
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
                // НИХУЯ НЕ ДОБАВИЛОСЬ
                // Container(
                //   width: 112,
                //   height: 112,
                //   decoration: BoxDecoration(
                //     image: DecorationImage(
                //       image:
                //           NetworkImage("https://via.placeholder.com/112x112"),
                //       fit: BoxFit.fill,
                //     ),
                //   ),
                // ),
              ],
            ),
            const SizedBox(
              height: 7,
            ),
            Stack(
              //alignment: AlignmentDirectional.bottomCenter,
              //textDirection: TextDirection.ltr,

              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 314,
                  decoration: const ShapeDecoration(
                    color: Colors.white,
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: Column(
                        //crossAxisAlignment: CrossAxisAlignment.start,
                        //mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 21,
                          ),
                          Text(
                            'Номер телефона',
                            style: TextStyle(
                              color: Color(0xFF505050),
                              fontSize: 15,
                              fontFamily: 'SF Pro Text',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Text(
                            '+79994567812',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontFamily: 'SF Pro Text',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 7, 0, 7),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: const ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: 0.40,
                              strokeAlign: BorderSide.strokeAlignCenter,
                              color: Color(0xFF6B4EFF),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        //mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Электронная почта',
                            style: TextStyle(
                              color: Color(0xFF505050),
                              fontSize: 15,
                              fontFamily: 'SF Pro Text',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Text(
                            'danila.popov@mail.ru',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontFamily: 'SF Pro Text',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Container(
                            width: 168,
                            height: 27,
                            decoration: ShapeDecoration(
                              color: Color(0xFFF5F5F5),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18),
                              ),
                            ),
                            child: ElevatedButton(
                                onPressed: () {
                                  // Navigator.pushNamed(
                                  //     context, '/auth_sms_code_page');
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Color.fromARGB(255, 202, 202, 202),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                                child: const Text(
                                  'Подтвердить почту',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontFamily: 'SF Pro Text',
                                    fontWeight: FontWeight.w300,
                                  ),
                                )),
                          ),
                          const SizedBox(
                            height: 17,
                          ),
                          const Text(
                            'О себе',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontFamily: 'SF Pro Text',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          SizedBox(
                            width: 335,
                            height: 88,
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
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            // Здесь кусок коода со страницы получить код, поле с кнопкой
            // Column(
            //   children: [
            //     const SizedBox(
            //       width: 271,
            //       child: Text(
            //         'Номер телефона',
            //         style: TextStyle(
            //           color: Color(0xFF505050),
            //           fontSize: 16,
            //           fontFamily: 'SF Pro Text',
            //           fontWeight: FontWeight.w300,
            //           letterSpacing: 0.80,
            //         ),
            //       ),
            //     ),
            //     const SizedBox(
            //       height: 12,
            //     ),
            //     Container(
            //       width: 285,
            //       height: 50,
            //       child: TextField(
            //         decoration: InputDecoration(
            //           enabledBorder: OutlineInputBorder(
            //             borderRadius: BorderRadius.circular(18),
            //             borderSide: const BorderSide(
            //                 width: 0.50, color: Color(0xFF6B4EFF)),
            //           ),
            //           focusedBorder: OutlineInputBorder(
            //             borderRadius: BorderRadius.circular(18),
            //             borderSide: const BorderSide(
            //                 width: 0.50, color: Color(0xFF6B4EFF)),
            //           ),
            //         ),
            //       ),
            //     ),
            //     const SizedBox(
            //       height: 29,
            //     ),
            //     Container(
            //       width: 285,
            //       height: 50,
            //       decoration: ShapeDecoration(
            //         color: Color(0xFFF5F5F5),
            //         shape: RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(18),
            //         ),
            //       ),
            //       child: ElevatedButton(
            //           onPressed: () {
            //             Navigator.pushNamed(
            //                 context, '/password_recovery_sms_code_page');
            //           },
            //           style: ElevatedButton.styleFrom(
            //             backgroundColor: Color(0xFFF5F5F5),
            //             shape: RoundedRectangleBorder(
            //                 borderRadius: BorderRadius.circular(18)),
            //           ),
            //           child: const Text(
            //             'Получить код',
            //             textAlign: TextAlign.center,
            //             style: TextStyle(
            //               color: Colors.black,
            //               fontSize: 20,
            //               fontFamily: 'Comfortaa',
            //               fontWeight: FontWeight.w400,
            //               letterSpacing: 1,
            //             ),
            //           )),
            //     ),
            //     const SizedBox(
            //       height: 20,
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
