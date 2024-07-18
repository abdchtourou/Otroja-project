import 'package:admins/src/otroja/presentation/widgets/karamDatePicker.dart';
import 'package:admins/src/otroja/presentation/widgets/otroja_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/page_count_widget.dart';
import 'widgets/table_title_widget.dart';

class TasmeaaScreen extends StatelessWidget {
  TextEditingController _activityController = TextEditingController(text: '1');

   TasmeaaScreen({super.key});

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
                PageCountWidget(),
                SizedBox(
                  height: 20.h,
                ),
                Column(
                  children: [
                    Column(
                      children: [
                        TableTitleWidget(),
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
                                child: Column(
                                  children: [
                                    Divider(
                                      color:
                                          Color.fromARGB(223, 234, 226, 215),
                                      thickness: 1.5,
                                      indent: 10,
                                      endIndent: 10,
                                    ),
                                    Row(
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
                                                    '56', // Replace with actual count
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
