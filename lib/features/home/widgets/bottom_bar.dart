import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({
    required this.selectedIcon,
    required this.unSelectedIcon,
    required this.onTap,
    this.onDoubleTap,
    this.isCart,
    required this.selected,
    required this.label,
    super.key,
  });

  final Widget selectedIcon;
  final Widget unSelectedIcon;
  final Function() onTap;
  final Function()? onDoubleTap;
  final bool selected;
  final String label;
  final bool? isCart;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: GestureDetector(
        onTap: onTap,
        onDoubleTap: onDoubleTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            selected ? selectedIcon : unSelectedIcon,
            const SizedBox(
              height: 4,
            ),
            Text(
              label,
              style: TextStyle(
                color: selected ? Theme.of(context).primaryColor : Theme.of(context).chipTheme.disabledColor,
                fontSize: 13,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(
              height: 6,
            ),
          ],
        ),
      ),
    );
  }
}
