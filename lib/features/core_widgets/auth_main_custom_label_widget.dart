import 'package:flutter/material.dart';

class AuthMainCustomLabelWidget extends StatelessWidget {
  const AuthMainCustomLabelWidget({
    super.key,
    required this.topLabel,
    required this.widthLabelContainer,
  });

  final String topLabel;
  final double widthLabelContainer;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          const Expanded(
            flex: 1,
            child: SizedBox(
              height: 100,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: widthLabelContainer,
                height: 100,
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: '$topLabel\n',
                        style: const TextStyle(
                          color: Color(0xFFD9D9D9),
                          fontSize: 32,
                          fontFamily: 'Comfortaa',
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1.60,
                        ),
                      ),
                      const TextSpan(
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
              SizedBox(
                width: widthLabelContainer,
                child: Align(
                  alignment: Alignment.bottomCenter, 
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
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
              ),
              const SizedBox(
                height: 27,
              ),
            ],
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 200,
                  height: 100,
                  child: SizedBox(),
                ),
                Align(
                  alignment: Alignment.bottomCenter, 
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
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
          ),
        ],
      ),
    );
  }
}
