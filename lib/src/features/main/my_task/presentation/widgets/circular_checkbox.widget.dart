import 'package:flutter/material.dart';
import 'package:to_do_apps/src/config/theme/color.theme.dart';

class CircularCheckbox extends StatefulWidget {
  const CircularCheckbox({
    super.key,
  });

  @override
  _CircularCheckboxState createState() => _CircularCheckboxState();
}

class _CircularCheckboxState extends State<CircularCheckbox> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isChecked = !isChecked;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: isChecked ? Colors.blue : Colors.grey,
            width: 2.0,
          ),
          // color: widget.value ? Colors.blue : Colors.transparent,
        ),
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: isChecked
              ? const Icon(
                  Icons.check_rounded,
                  color: AppColorTheme.primary500,
                  size: 8.0, // Adjust the size as needed
                )
              : const Icon(
                  Icons.radio_button_unchecked,
                  size: 8.0,
                  color: Colors.transparent,
                ),
        ),
      ),
    );
  }
}
