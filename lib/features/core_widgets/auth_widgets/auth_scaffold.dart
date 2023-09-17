import 'package:flutter/material.dart';

class AuthScaffold extends StatelessWidget {
  const AuthScaffold({
    super.key,
    this.body,
  });

  final Widget? body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment(-1.00, -0.06),
                    end: Alignment(1, 0.06),
                    colors: [Color(0xFFF35A7B), Color(0xFF9712AD)])),
          ),
          body ?? const SizedBox.shrink(),
        ],
      ),
    );
  }
}
