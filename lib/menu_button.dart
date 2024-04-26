import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({
    super.key,
    required this.isScaled,
    required this.color,
    required this.icon,
    this.onTap,
    this.defaultColor,
  });
  final bool isScaled;
  final Color color;
  final Color? defaultColor;
  final IconData icon;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isScaled ? onTap : null,
      child: AnimatedContainer(
        alignment: Alignment.center,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        height: isScaled ? 30 : 8,
        width: isScaled ? 30 : 8,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isScaled ? color : (defaultColor ?? Colors.grey)),
        child: isScaled
            ? FutureBuilder(
                future: Future.delayed(const Duration(
                    milliseconds: 300)), // Delay to show the icons smoothly
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const SizedBox();
                  } else {
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Icon(icon),
                      ),
                    );
                  }
                })
            : null,
      ),
    );
  }
}
