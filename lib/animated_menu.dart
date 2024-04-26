import 'package:flutter/material.dart';
import 'package:animated_menu/custom_menu.dart';

class AnimatedMenu extends StatefulWidget {
  const AnimatedMenu({super.key, this.iconSize});
  final double? iconSize;
  @override
  createState() => _AnimatedMenuState();
}

class _AnimatedMenuState extends State<AnimatedMenu>
    with SingleTickerProviderStateMixin {
  bool _isScaled = false;
  late AnimationController _cancelButtonController;
  late Animation<double> _cancelButtonAnimation;

  @override
  void initState() {
    _cancelButtonController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _cancelButtonAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _cancelButtonController,
        curve: Curves.easeInOut,
      ),
    );

    super.initState();
  }

  _startAnimation({required bool isScaled}) {
    setState(() {
      _isScaled = isScaled;
      if (_isScaled) {
        _cancelButtonController.forward();
      } else {
        _cancelButtonController.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                _startAnimation(isScaled: true);
              },
              child: ScaleTransition(
                scale: Tween<double>(begin: 0.5, end: 1.0).animate(
                  CurvedAnimation(
                    parent: ModalRoute.of(context)!.animation!,
                    curve: Curves.easeInOut,
                  ),
                ),
                child: CustomMenu(
                  isScaled: _isScaled,
                  onBack: () {
                    _startAnimation(isScaled: false);
                  },
                ),
              ),
            ),
            ScaleTransition(
              scale: _cancelButtonAnimation,
              child: InkWell(
                onTap: () {
                  debugPrint('cancel');
                },
                child: const Icon(
                  color: Colors.grey,
                  Icons.cancel,
                  size: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
