import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class LevelCheckboxWidget extends StatefulWidget {
  @override
  _LevelCheckboxWidgetState createState() => _LevelCheckboxWidgetState();
}

class _LevelCheckboxWidgetState extends State<LevelCheckboxWidget> {
  List<bool> _selectedLevels = [false, false, false, false];

  void _updateSelection(int index, bool selected) {
    setState(() {
      for (int i = 0; i <= index; i++) {
        _selectedLevels[i] = selected;
      }
      for (int i = index + 1; i < _selectedLevels.length; i++) {
        _selectedLevels[i] = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        textDirection: TextDirection.rtl,
        children: [
          Text(
            'حدد مستويات الدورة ', // Arabic for "Select Episode Levels"
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
            textDirection: TextDirection.rtl,
          ),
          ...List.generate(4, (index) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.end, // Align to the right
              children: [
                Text(
                  'مستوى ${index + 1}', // Arabic for "Level {number}"
                  style: TextStyle(
                    fontSize: 16.sp,
                  ),
                  textDirection: TextDirection.rtl,
                ),
                Transform.scale(
                  scale: 1.2, // Adjust the scale factor to make it bigger
                  child: Checkbox(
                    value: _selectedLevels[index],
                    onChanged: (bool? value) {
                      _updateSelection(index, value ?? false);
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20), // Circular shape
                    ),
                    activeColor: Color(0xFF85313C), // Custom selected color
                    checkColor: Colors.white,
                  ),
                ),
              ],
            );
          }),
        ],
      ),
    );
  }
}
