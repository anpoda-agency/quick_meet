import 'package:flutter/material.dart';

class CreateMeetPage extends StatefulWidget {
  const CreateMeetPage({super.key});

  @override
  State<CreateMeetPage> createState() => _CreateMeetPageState();
}

class _CreateMeetPageState extends State<CreateMeetPage> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Создание встречи',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontFamily: 'Comfortaa',
            fontWeight: FontWeight.w400,
          ),
        ),
        backgroundColor: Colors.white10,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.black, 
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 27,
              ),
              const SizedBox(
                width: 271,
                child: Text(
                  'Название',
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
                height: 12,
              ),
              const SizedBox(
                width: 271,
                child: Text(
                  'Описание',
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
                height: 12,
              ),
              const SizedBox(
                width: 271,
                child: Text(
                  'Категория',
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
                height: 12,
              ),
              const SizedBox(
                width: 271,
                child: Text(
                  'Адрес',
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
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      const SizedBox(
                        width: 118,
                        child: Text(
                          'Дата',
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
                        width: 132,
                        height: 50,
                        child: TextField(
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
                    ],
                  ),
                  const SizedBox(
                    width: 23.5,
                  ),
                  Column(
                    children: [
                      const SizedBox(
                        width: 118,
                        child: Text(
                          'Время',
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
                        width: 132,
                        height: 50,
                        child: TextField(
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
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              const SizedBox(
                width: 271,
                child: Text(
                  'Количество участников',
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
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  ),
                  const SizedBox(
                    width: 245,
                    child: Text(
                      'Без ограничений',
                      style: TextStyle(
                        color: Color(0xFF505050),
                        fontSize: 16,
                        fontFamily: 'SF Pro Text',
                        fontWeight: FontWeight.w300,
                        letterSpacing: 0.80,
                      ),
                    ),
                  )
                ],
              ),
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
                          content: Container(
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
                                    'Встреча добавлена в раздел \n"Мои встречи"',
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
                                Container(
                                  width: 163,
                                  height: 35,
                                  decoration: ShapeDecoration(
                                    color: Color(0xFFF5F5F5),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18),
                                    ),
                                  ),
                                  child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.pushNamed(context, '/main_page');
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Color(0xFFF5F5F5),
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                                      ),
                                      child: const Text(
                                        'Закрыть',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Color(0xFF6B4EFF),
                                          fontSize: 15,
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
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF6B4EFF),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                    ),
                    child: const Text(
                      'Создать',
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
        ),
      ),
    );
  }
}
