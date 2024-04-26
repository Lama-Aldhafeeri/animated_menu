import 'package:flutter/material.dart';
import 'package:animated_menu/menu_button.dart';

class CustomMenu extends StatelessWidget {
  const CustomMenu(
      {super.key,
      this.onBack,
      required this.isScaled,
      this.onEdit,
      this.onDelete});
  final Function()? onBack;
  final Function()? onEdit;
  final Function()? onDelete;
  final bool isScaled;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MenuButton(
          onTap: onEdit,
          isScaled: isScaled,
          color: Colors.grey.shade200,
          icon: Icons.edit,
        ),
        const SizedBox(
          width: 4,
        ),
        MenuButton(
          onTap: onDelete,
          isScaled: isScaled,
          color: Colors.red.shade200,
          icon: Icons.delete,
        ),
        const SizedBox(
          width: 4,
        ),
        MenuButton(
          onTap: onBack,
          isScaled: isScaled,
          color: Colors.grey.shade200,
          icon: Icons.arrow_back,
        ),
      ],
    );
  }
}
