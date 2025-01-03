import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class OtrojaDatePickerWidget extends StatefulWidget {
  final String hintText;
  final String labelText;
  final Color containerColor;
  final double containerWidth;
  final double borderThickness;
  final Color borderColor;
  final String imagePath;
  final TextDirection textDirection;
  final Function(DateTime) onDateSelected;

  OtrojaDatePickerWidget({
    required this.hintText,
    required this.labelText,
    required this.containerColor,
    required this.containerWidth,
    required this.borderThickness,
    required this.borderColor,
    required this.imagePath,
    required this.textDirection,
    required this.onDateSelected,
  });

  @override
  _OtrojaDatePickerWidgetState createState() => _OtrojaDatePickerWidgetState();
}

class _OtrojaDatePickerWidgetState extends State<OtrojaDatePickerWidget> {
  DateTime? selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),

      
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: const ColorScheme.light(
              primary: Color(0xff85313C), // لون الاختيار
              onPrimary: Colors.white, // لون النص عند الاختيار
              surface: Color.fromARGB(223, 239, 227, 211), // لون الخلفية
              onSurface: Colors.black, // لون النص عند عدم الاختيار
            ),
            dialogBackgroundColor:
                const Color.fromARGB(223, 239, 227, 211), // لون خلفية الحوار
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
      widget.onDateSelected(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 15.0, right: 15),
          child: Text(
            "${widget.labelText}",
            textAlign: TextAlign.right,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        GestureDetector(
          onTap: () => _selectDate(context),
          child: Container(
            width: widget.containerWidth,
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            decoration: BoxDecoration(
              color: widget.containerColor,
              border: Border.all(
                color: widget.borderColor,
                width: widget.borderThickness,
              ),
              borderRadius: BorderRadius.circular(18.0),
            ),
            child: Row(
              textDirection: TextDirection.rtl,
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(widget.imagePath),
                SizedBox(
                  width: 10.w,
                ),
                selectedDate == null
                    ? Text(
                        '${widget.hintText}',
                        style: const TextStyle(
                          color: Color(0xFFC2C0C0),
                          fontSize: 16.0,
                        ),
                      )
                    : Text(
                        '${selectedDate!.day}-${selectedDate!.month}-${selectedDate!.year}',
                        style: const TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 16.0,
                        ),
                      ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
