import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class OtrojaTimePickerWidget extends StatefulWidget {
  final String hintText;
  final String labelText;
  final Color containerColor;
  final double containerWidth;
  final double borderThickness;
  final Color borderColor;
  final String imagePath;
  final TextDirection textDirection;
  final Function(TimeOfDay) onTimeSelected;

  const OtrojaTimePickerWidget({
    Key? key,
    required this.hintText,
    required this.labelText,
    required this.containerColor,
    required this.containerWidth,
    required this.borderThickness,
    required this.borderColor,
    required this.imagePath,
    required this.textDirection,
    required this.onTimeSelected,
  }) : super(key: key);

  @override
  _OtrojaTimePickerWidgetState createState() => _OtrojaTimePickerWidgetState();
}

class _OtrojaTimePickerWidgetState extends State<OtrojaTimePickerWidget> {
  TimeOfDay? selectedTime;

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime ?? TimeOfDay.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: const Color(0xff85313C), // Selected color
            hintColor: const Color(0xff85313C), // Accent color
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
            dialogBackgroundColor: const Color.fromARGB(223, 239, 227, 211), // Dialog background
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
      widget.onTimeSelected(picked);
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
            widget.labelText,
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: 18.sp, // Adjust font size to match design
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        GestureDetector(
          onTap: () => _selectTime(context),
          child: Container(
            width: widget.containerWidth,
            height: 50.h, // Adjust height as per design
            padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 8.0.h),
            decoration: BoxDecoration(
              color: widget.containerColor,
              border: Border.all(
                color: widget.borderColor,
                width: widget.borderThickness,
              ),
              borderRadius: BorderRadius.circular(18.0),
            ),
            child: Row(
              textDirection: widget.textDirection,
              children: [
                // Image.asset(widget.imagePath, width: 24.w, height: 24.h), // Adjust icon size
                Icon(Icons.hourglass_bottom,color: Color(0xFFE6E6E6),),
                SizedBox(width: 10.w),
                Expanded(
                  child: Text(
                    selectedTime == null
                        ? widget.hintText
                        : '${selectedTime!.format(context)}',
                    style: TextStyle(
                      color: selectedTime == null ? Color(0xFFC2C0C0) : Colors.black,
                      fontSize: 16.sp, // Adjust font size to match design
                    ),
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