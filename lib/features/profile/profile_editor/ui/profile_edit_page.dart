import 'package:flutter/material.dart';

class ProfileEditPage extends StatefulWidget {
  const ProfileEditPage({super.key});

  @override
  State<ProfileEditPage> createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(245, 245, 245, 1),
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
                    'Имя',
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
                    'Фамилия',
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
                    'Электронная почта',
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
                  height: 12,
                ),
                const SizedBox(
                  width: 271,
                  child: Text(
                    'О себе',
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
                  height: 40,
                ),
                Container(
                  width: 285,
                  height: 40,
                  decoration: ShapeDecoration(
                    color: Color(0xFFF5F5F5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  child: ElevatedButton(
                      onPressed: () {
                        //Navigator.pushNamed(context, '/');
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF6B4EFF),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18)),
                      ),
                      child: const Text(
                        'Сохранить изменения',
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
                Container(
                  width: 285,
                  height: 40,
                  decoration: ShapeDecoration(
                    color: Color(0xFFF5F5F5),
                    //backgroundColor: const Color.fromRGBO(245, 245, 245, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  child: ElevatedButton(
                      onPressed: () {
                        //Navigator.pushNamed(context, '/');
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                bottomRight: Radius.circular(30),
                              ),
                            ),
                            backgroundColor: Color(0xFF6B4EFF),
                            contentPadding: EdgeInsets.zero,
                            content: //Scaffold(
                                //body:

                                Container(
                              width: 341,
                              height: 247,
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 61,
                                  ),
                                  const SizedBox(
                                    width: 281,
                                    child: Text(
                                      'Вы действительно\n хотите удалить\n аккаунт?',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 22,
                                        fontFamily: 'Comfortaa',
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 1.10,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 29,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 83,
                                        height: 35,
                                        decoration: ShapeDecoration(
                                          color: Color(0xFFF5F5F5),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(18),
                                          ),
                                        ),
                                        child: ElevatedButton(
                                            onPressed: () {
                                              Navigator.pushNamed(context, '/');
                                            },
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  Color(0xFFF5F5F5),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          18)),
                                            ),
                                            child: const Text(
                                              'Да',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Color(0xFFE55F5F),
                                                fontSize: 15,
                                                fontFamily: 'Comfortaa',
                                                fontWeight: FontWeight.w400,
                                                letterSpacing: 0.75,
                                              ),
                                            )),
                                      ),
                                      const SizedBox(
                                        width: 44,
                                      ),
                                      Container(
                                        width: 83,
                                        height: 35,
                                        decoration: ShapeDecoration(
                                          color: Color(0xFFF5F5F5),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(18),
                                          ),
                                        ),
                                        child: ElevatedButton(
                                            onPressed: () {
                                              // Navigator.pushNamed(context,
                                              //     '/profile_edit_page');
                                              Navigator.of(context).pop();
                                            },
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  Color(0xFFF5F5F5),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          18)),
                                            ),
                                            child: const Text(
                                              'Нет',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Color(0xFF6B4EFF),
                                                fontSize: 15,
                                                fontFamily: 'Comfortaa',
                                                fontWeight: FontWeight.w400,
                                                letterSpacing: 0.75,
                                              ),
                                            )),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            //),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        side: const BorderSide(
                          width: 1,
                          color: Color(0xFFE55F5F),
                        ),
                        backgroundColor: const Color.fromRGBO(245, 245, 245, 1),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18)),
                      ),
                      child: const Text(
                        'Удалить аккаунт',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFFE55F5F),
                          fontSize: 20,
                          fontFamily: 'Comfortaa',
                          fontWeight: FontWeight.w500,
                        ),
                      )),
                ),
                const SizedBox(
                  height: 90,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
