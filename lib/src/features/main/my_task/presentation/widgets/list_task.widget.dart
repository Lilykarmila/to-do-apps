
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'circular_checkbox.widget.dart';

class ListTaskWidget extends StatefulWidget {
  const ListTaskWidget({
    super.key,
    this.icon,
    this.showCheckbox = true,
    this.taskTitle = '',
    this.taskDate,
    this.tag,
    this.tagColor = const Color(0xFFFFA726),
    this.additionalText,
    this.iconColor = Colors.blue,
    this.iconSize = 20,
  });

  final IconData? icon;
  final double iconSize;
  final bool showCheckbox;
  final String taskTitle;
  final String? taskDate;
  final String? tag;
  final Color tagColor;
  final Color iconColor;
  final String? additionalText;
  @override
  State<ListTaskWidget> createState() => _ListTaskWidgetState();
}

class _ListTaskWidgetState extends State<ListTaskWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.grey.shade200,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (widget.showCheckbox)
                  const CircularCheckbox()
                else if (widget.icon != null)
                  Icon(
                    widget.icon,
                    color: widget.iconColor,
                    size: widget.iconSize,
                  ),
                // CircularCheckbox(),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    widget.taskTitle,
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
                if (widget.tag != null)
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
                    decoration: BoxDecoration(
                      color: widget.tagColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(
                      widget.tag!,
                      style: GoogleFonts.poppins(
                        fontSize: 10,
                        color: Colors.white,
                      ),
                    ),
                  ),
                if (widget.additionalText != null)
                  Text(
                    widget.additionalText!,
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: Colors.black,
                    ),
                  )
              ],
            ),
            if (widget.taskDate != null)
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(width: 25),
                  Text(
                    widget.taskDate!,
                    style: GoogleFonts.poppins(
                      fontSize: 10,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
