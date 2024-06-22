import 'package:flutter/material.dart';

class Functions{
  static void adjustDimensionsBasedOnOrientation(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    bool isPortrait = mediaQuery.orientation == Orientation.portrait;

    double height = mediaQuery.size.height ;
    double width =  mediaQuery.size.width ;

    Dimensions().setDimensions(height, width,isPortrait);
  }


}

class Dimensions {
  static final Dimensions _instance = Dimensions._();

  factory Dimensions( ) {
    return _instance;
  }

  Dimensions._();

  double height = 0.0;
  double width = 0.0;
  bool isPortrait=false;

  void setDimensions(double h, double w,bool isPortrait) {
    height = h;
    width = w;
    isPortrait  =isPortrait;
  }

  double getHeight() {

    return isPortrait?width:height;
  }
  bool getIsPortrait(){
    return isPortrait;
  }

  double getWidth() {
    return isPortrait?height:width;
  }
}
