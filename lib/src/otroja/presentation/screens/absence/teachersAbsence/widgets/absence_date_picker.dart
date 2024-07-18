import 'package:flutter/material.dart';

class AbsenceDatePicker extends StatefulWidget {
  final String? hintText;
  final String labelText;
  final Color containerColor;
  final double containerWidth;
  final double borderThickness;
  final Color borderColor;
  final String imagePath;
  final TextDirection textDirection;

  AbsenceDatePicker({
     this.hintText="",
    required this.labelText,
    required this.containerColor,
    required this.containerWidth,
    required this.borderThickness,
    required this.borderColor,
    required this.imagePath,
    required this.textDirection,
  });

  @override
  _DatePickerWidgetState createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<AbsenceDatePicker> {
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
            colorScheme: ColorScheme.light(
              primary: Color(0xff85313C), // لون الاختيار
              onPrimary: Colors.white, // لون النص عند الاختيار
              surface: Color.fromARGB(223, 239, 227, 211), // لون الخلفية
              onSurface: Colors.black, // لون النص عند عدم الاختيار
            ),
            dialogBackgroundColor:
                Color.fromARGB(223, 239, 227, 211), // لون خلفية الحوار
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
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
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            decoration: BoxDecoration(
              color: widget.containerColor,
              border: Border.all(
                color: widget.borderColor,
                width: widget.borderThickness,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Row(
              textDirection: TextDirection.rtl,
              children: [
                Image.asset(widget.imagePath),
                SizedBox(
                  width: 100,
                ),
                selectedDate == null
                    ? Text(
                        '${widget.hintText}',
                        style: TextStyle(
                          color: Color.fromARGB(255, 155, 151, 151),
                          fontSize: 16.0,
                        ),
                      )
                    : Text(
                        '${selectedDate!.day}-${selectedDate!.month}-${selectedDate!.year}',
                        style: TextStyle(
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
