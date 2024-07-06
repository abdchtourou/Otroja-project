import 'package:admins/src/otroja/presentation/widgets/otroja_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/text field.dart';

class AddActivityScreen extends StatefulWidget {
  const AddActivityScreen({super.key});

  @override
  _AddActivityScreenState createState() => _AddActivityScreenState();
}

class _AddActivityScreenState extends State<AddActivityScreen> {
  int activityCount = 1;

  void _incrementActivityCount() {
    setState(() {
      activityCount++;
    });
  }

  void _decrementActivityCount() {
    if (activityCount > 1) {
      setState(() {
        activityCount--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 249, 245, 239),
      appBar: OtrojaAppBar(
        mainText: "تفقد الطلاب ",
        secText:
        'حدد تاريخ اليوم والحلقة المرادة واضغك على انهاء \n  التفقد عند الانتهاء ',
        optionalWidget: SizedBox(
          width: 35.w,
          height: 35.h,
          child: Image.asset('assets/icons/add.png'),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            PlatyTextField(
                hintText: "اكتب اسم العمل ",
                labelText: 'الاسم ',
                containerColor: Color(0xffffffff),
                containerWidth: 350.w,
                borderThickness: 2,
                borderColor: Color(0xffE6E6E6),
                imagePath: 'assets/icons/product-development(1).png',
                textDirection: TextDirection.rtl),
            PlatyTextField(
                hintText: "اكتب نبذة عن العمل ",
                labelText: 'النبذة ',
                containerColor: Color(0xffffffff),
                containerWidth: 350.w,
                borderThickness: 2,
                borderColor: Color(0xffE6E6E6),
                imagePath: 'assets/icons/info.png',
                textDirection: TextDirection.rtl),
            SizedBox(
              height: 15,
            ),
            Text(
              'عدد أترجات العمل ',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 20),
            ),
            SizedBox(height: 20,),
            Column(
              children: [
                SizedBox(
                  width: 340.w,
                  height: 250.h,
                  child: Stack(
                    children: [

                      Positioned(
                        left:70,
                        child: Container(
                          width: 200.w,
                          height: 180.h,
                          child: Image.asset('assets/icons/rub-el-hizb.png'),
                        ),
                      ),
                      Positioned(
                        left: 70.w,
                        top: -10.h,
                        child: Transform.rotate(
                          angle: 3.14 / 4,
                          child: Container(
                            margin: EdgeInsets.only(left: 72, top: 32.5),
                            width: 100.w,
                            height: 100.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2),
                              color: Color.fromARGB(255, 245, 236, 224),
                              border: Border.all(width: 4, color: Color(0xff85313C)),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 74.w,
                        child: Transform.rotate(
                          angle: 3.14 / 4,
                          child: Container(
                            margin: EdgeInsets.only(left: 130, top: 90),
                            padding: EdgeInsets.only(left: 15, bottom: 0),
                            width: 32.w,
                            height: 32.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2),
                              color: Color(0xff85313C),
                            ),
                            child: Transform.rotate(
                              angle: -3.14 / 4,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 152.w,
                        top: 55.h,
                        child: SizedBox(
                          width: 50.w,
                          height: 50.h,
                          child: Image.asset('assets/icons/lemon.png'),
                        ),
                      ),
                      Positioned(
                        left: 163.w,
                        top: 121.h,
                        child: Text(
                          '$activityCount',
                          style: TextStyle(
                              fontSize: 22.5,
                              fontWeight: FontWeight.w500,
                              color: Color(0xffEEEAE4)),
                        ),
                      ),
                      Positioned(
                        top: 120,
                        child: Row(
                          children: [
                            Stack(
                              children: [
                                SizedBox(
                                  width: 125.w,
                                  height: 125.h,
                                  child: Image.asset('assets/icons/islam.png'),
                                ),
                                Positioned(
                                  left: 47,
                                  top: 50,
                                  child: InkWell(
                                    onTap: _decrementActivityCount,
                                    child: SizedBox(
                                      width: 30.w,
                                      height: 30.h,
                                      child: Image.asset('assets/icons/minus-sign.png'),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: 90,),
                            Stack(
                              children: [
                                SizedBox(
                                  width: 125.w,
                                  height: 125.h,
                                  child: Image.asset('assets/icons/islam.png'),
                                ),
                                Positioned(
                                  left: 47,
                                  top: 50,
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
                      )

                    ],
                  ),
                ),

                Container(
                  padding: EdgeInsets.only(bottom: 6),

                  width: 320,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Color(0xff85313C),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      'عرض المجموعة',
                      style: TextStyle(
                          color: Color(0xffEFEBE6),
                          fontStyle: FontStyle.normal,
                          fontSize:  15),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
