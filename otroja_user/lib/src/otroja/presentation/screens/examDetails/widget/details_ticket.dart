import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:otroja_users/src/otroja/data/models/exam_details_model.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../user/model/questions.dart';


class DetailsTicket extends StatelessWidget {
  DetailsTicket({Key? key, required this.examDetailsModel}) : super(key: key);
  ExamDetailsModel examDetailsModel;

  static const Color kSecondaryTextColor = Color(0xFFC2C0C0);
  static const Color kCardBackgroundColor = Color(0xFFFFF5EC);

  static const TextStyle kLabelTextStyle = TextStyle(
    color: kSecondaryTextColor,
    fontSize: 15,
  );

  static const TextStyle kValueTextStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static const TextStyle kSubLabelTextStyle = TextStyle(
    color: kSecondaryTextColor,
    fontSize: 18,
  );

  static const TextStyle kSubValueTextStyle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 18,
    color: Colors.black,
  );

  static const EdgeInsets kCardPadding = EdgeInsets.all(16.0);
  static const SizedBox kVerticalSpacing = SizedBox(height: 16.0);

  Map<String, String> splitDateTime() {
    String dateTimeString = examDetailsModel.date!;
    // Check if the input string is in the expected format
    if (!RegExp(r'^\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}$')
        .hasMatch(dateTimeString)) {
      throw ArgumentError(
          'Invalid date-time format. Expected format: yyyy-MM-dd HH:mm:ss');
    }

    // Split the string into date and time parts
    final parts = dateTimeString.split(' ');
    if (parts.length != 2) {
      throw ArgumentError(
          'Invalid date-time format. Could not split into date and time.');
    }

    final date = parts[0];

    final timeParts = parts[1].split(':');
    print(timeParts);
    if (timeParts.length < 2) {
      throw ArgumentError('Invalid time format. Expected format: HH:mm:ss');
    }
    final time = '${timeParts[0]}:${timeParts[1]}';

    return {
      'date': date,
      'time': time,
    };
  }

  @override
  Widget build(BuildContext context) {
    final result = splitDateTime();

    return SizedBox(
      height: 320.h,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Card(
              color: kCardBackgroundColor,
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: kCardPadding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 25.h),
                    _buildLabelValuePair('اسم الامتحان', examDetailsModel.name!),
                    const Divider(
                      thickness: 2,
                      color: OtrojaColors.primaryColor,
                    ),
                    kVerticalSpacing,
                    _buildSubLabelValuePair('تاريخ الامتحان', result['date']!),
                    kVerticalSpacing,

                    _buildSubLabelValuePair(
                        'الامتحان يبدأ في غضون', result['time']!),
                    kVerticalSpacing,
                    _buildSubLabelValuePair(
                        'مدة الامتحان', '${examDetailsModel.duration!.toString()} دقيقة '),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 0.h,
            left: 0,
            right: 0,
            child: Align(
              alignment: Alignment.center,
              child: Container(
                width: 70.w,
                height: 60.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white,
                    width: 2,
                    style: BorderStyle.solid,
                  ),
                  color: OtrojaColors.primaryColor,
                  image: const DecorationImage(
                    image: AssetImage("assets/images/greeting-card 1.png"),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Helper method for main label and value pairs
  Widget _buildLabelValuePair(String label, String value) {
    return Column(
      children: [
        Text(
          label,
          style: kLabelTextStyle,
        ),
        SizedBox(height: 4.h),
        Text(
          value,
          style: kValueTextStyle,
        ),
      ],
    );
  }

  /// Helper method for sub-label and value pairs
  Widget _buildSubLabelValuePair(String label, String value) {
    return Column(
      children: [
        Text(
          label,
          style: kSubLabelTextStyle,
        ),
        SizedBox(height: 4.h),
        Text(
          value,
          style: kSubValueTextStyle,
        ),
      ],
    );
  }
}
