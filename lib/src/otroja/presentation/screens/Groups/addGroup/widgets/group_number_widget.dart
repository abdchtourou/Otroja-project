import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GroupNumberWidget extends StatelessWidget {
  const GroupNumberWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
                      height: 100.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 81.w, // Set the width of the image
                            height: 81.h, // Set the height of the image
                            child: Image.asset("assets/icons/sujude.png"),
                          ),
                          Column(
                            children: [
                              const Text(
                              "رقم الحلقة",
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                              Stack(
                                children: [
                                  Container(
                                    width: 180.w, // Set the width of the label image
                                    height: 75.h, // Set the height of the label image
                                    child: Image.asset("assets/icons/label.png"),
                                  ),
                                  Positioned.fill(
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text("2"), // Ensure the text is centered
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Container(
                            width: 81.w, // Set the width of the second image
                            height: 81.h, // Set the height of the second image
                            child: Image.asset("assets/icons/sujude.png"),
                          ),
                        ],
                      ),
                    );
  }
}