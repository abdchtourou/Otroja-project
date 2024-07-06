import 'package:admins/src/otroja/presentation/widgets/karamDatePicker.dart';
import 'package:admins/src/otroja/presentation/widgets/otroja_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TasmeaaScreen extends StatefulWidget {
  const TasmeaaScreen({super.key});

  @override
  State<TasmeaaScreen> createState() => _TasmeaaScreenState();
}

class _TasmeaaScreenState extends State<TasmeaaScreen> {
  List<bool> attendanceStatus = [false, false, false, true, true];
  TextEditingController _activityController = TextEditingController(text: '1');
  int repetationCount=0;

  void updateAttendanceStatus(int index, bool isPresent) {
    setState(() {
      attendanceStatus[index] = isPresent;
    });
  }

  void _incrementActivityCount() {
    setState(() {
      int currentCount = int.tryParse(_activityController.text) ?? 0;
      currentCount++;
      _activityController.text = currentCount.toString();
    });
  }

  void _decrementActivityCount() {
    setState(() {
      int currentCount = int.tryParse(_activityController.text) ?? 0;
      if (currentCount > 1) {
        currentCount--;
        _activityController.text = currentCount.toString();
      }
    });
  }

   void _decrementRepetationCount() {
    setState(() {
      repetationCount--;
    });
  }
   void _incrementRepetationCount() {
    setState(() {
      repetationCount++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 249, 245, 239),
        appBar: OtrojaAppBar(
          mainText: "تسميع الطلاب",
          secText:
              'حدد تاريخ اليوم والصفحة المرادة \n  ثم املأ جدول المعايير',
          optionalWidget: SizedBox(
            width: 35.w,
            height: 35.h,
            child: Image.asset('assets/icons/add.png'),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 0),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                DatePickerWidget(
                  hintText: "حدد التاريخ",
                  labelText: 'اختر تاريخ',
                  containerColor: Color(0xffffffff),
                  containerWidth: 340.w,
                  borderThickness: 2,
                  borderColor: Color(0xffE6E6E6),
                  imagePath: 'assets/icons/calendar.png',
                  textDirection: TextDirection.rtl,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'عدد الصفحات ',
                  style: TextStyle(
                    color: Colors.black,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500,
                    fontSize: 18.sp,
                  ),
                ),
                Row(
                  children: [
                    SizedBox(width: 5),
                    Stack(
                      children: [
                        SizedBox(
                          width: 70.w,
                          height: 70.h,
                          child: Image.asset('assets/icons/islam1.png'),
                        ),
                        Positioned(
                          left: 20,
                          top: 22,
                          child: InkWell(
                            onTap: _decrementActivityCount,
                            child: SizedBox(
                              width: 30.w,
                              height: 30.h,
                              child:
                                  Image.asset('assets/icons/minus-sign.png'),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 5),
                    Stack(
                      children: [
                        SizedBox(
                          width: 200.w,
                          height: 100.h,
                          child: Image.asset('assets/icons/label.png'),
                        ),
                        Positioned(
                          left: 80,
                          top: 22,
                          child: SizedBox(
                            width: 50.w,
                            child: TextField(
                              controller: _activityController,
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              style: TextStyle(
                                color: Colors.black,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.bold,
                                fontSize: 22.sp,
                              ),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 5),
                    Stack(
                      children: [
                        SizedBox(
                          width: 70.w,
                          height: 70.h,
                          child: Image.asset('assets/icons/islam1.png'),
                        ),
                        Positioned(
                          left: 20,
                          top: 22,
                          child: InkWell(
                            onTap: _incrementActivityCount,
                            child: SizedBox(
                              width: 30.w,
                              height: 30.h,
                              child: Image.asset('assets/icons/plus(6).png'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Column(
                  children: [
                    Column(
                      children: [
                        Container(
                          width: 340.w,
                          height: 40.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                            color: Color.fromARGB(223, 239, 227, 211),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            textDirection: TextDirection.rtl,
                            children: [
                              Text(
                                'الاسم  ',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18.sp,
                                ),
                              ),
                              SizedBox(
                                width: 170.w,
                              ),
                              Text(
                                'مرات تكراره',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18.sp,
                                ),
                              ),
                              
                            ],
                          ),
                        ),
                        Container(
                          width: 340.w,
                          height: 300.h,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 245, 236, 224),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ListView.builder(
                            itemBuilder: (context, index) {
                              return SizedBox(
                                width: 300,
                                height: 75,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      child: SizedBox(
                                        width: 340,
                                        height: 0,
                                        child: Divider(
                                          color:
                                              Color.fromARGB(223, 234, 226, 215),
                                          thickness: 1.5,
                                          indent: 10,
                                          endIndent: 10,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 340,
                                      height: 70,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        textDirection: TextDirection.rtl,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              top: 0,
                                              right: 10,
                                            ),
                                            child: Text(
                                              'يعقوب قمر الدين دبيازة',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15.sp,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 50,
                                          ),
                                          Container(
                                            width: 120,
                                            height: 50,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                     _decrementRepetationCount();
                                                  },
                                                  child: Container(
                                                    width: 30,
                                                    height: 30,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xff85313C),
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: Center(
                                                      child: Icon(
                                                        Icons.remove,
                                                        color: Colors.white,
                                                        size: 20,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  width: 40,
                                                  height: 30,
                                                  decoration: BoxDecoration(
                                                    color: Color.fromARGB(
                                                      223,
                                                      239,
                                                      227,
                                                      211,
                                                    ),
                                                    border: Border.all(
                                                      color: Color(0xff85313C),
                                                      width: 1,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      5,
                                                    ),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      '$repetationCount', // Replace with actual count
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 18.sp,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                   _incrementRepetationCount();

                                                  },
                                                  child: Container(
                                                    width: 30,
                                                    height: 30,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xff85313C),
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: Center(
                                                      child: Icon(
                                                        Icons.add,
                                                        color: Colors.white,
                                                        size: 20,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                            itemCount: 5, // Replace with actual list length
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
  }
}
