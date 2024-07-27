import 'package:admins/src/otroja/core/utils/constants/colors.dart';
import 'package:admins/src/otroja/presentation/widgets/otroja_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'dart:async';

class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  final List<String> _newsItems = [
    'Breaking News: Market hits all-time high',
    'Sports Update: Local team wins championship',
    'Weather Alert: Heavy rain expected tomorrow',
    'Tech News: New smartphone released',
    'Health Tips: How to stay fit during winter',
    'Travel Guide: Top destinations for 2024',
    'Finance: Tips for saving money effectively',
    'Entertainment: Upcoming movie releases',
    'Education: New learning methods for kids',
    'Science: Latest discoveries in space'
  ];

  final ItemScrollController _scrollController = ItemScrollController();
  final ItemPositionsListener _itemPositionsListener =
      ItemPositionsListener.create();
  Timer? _timer;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      if (_scrollController.isAttached) {
        _scrollController.scrollTo(
          index: _currentIndex,
          duration: const Duration(seconds: 1),
          curve: Curves.easeInOut,
        );
        _currentIndex++;
        if (_currentIndex >= _newsItems.length) {
          _currentIndex = 0;
        }
      }
    });
  }

  void _stopAutoScroll() {
    _timer?.cancel();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _scrollToNextItem() {
    _stopAutoScroll();
    if (_scrollController.isAttached) {
      _scrollController.scrollTo(
        index: _currentIndex,
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOut,
      );
      _currentIndex++;
      if (_currentIndex >= _newsItems.length) {
        _currentIndex = 0;
      }
    }
    _startAutoScroll();
  }

  void _scrollToPreviousItem() {
    _stopAutoScroll();
    if (_scrollController.isAttached) {
      _currentIndex--;
      if (_currentIndex < 0) {
        _currentIndex = _newsItems.length - 1;
      }
      _scrollController.scrollTo(
        index: _currentIndex,
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOut,
      );
    }
    _startAutoScroll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OtrojaAppBar(
        optionalWidget1: Row(
          children: [
            Container(
              padding: EdgeInsets.all(30),
              width: 40.w,
              height:40.h,
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: OtrojaColors.primaryColor,width: 3),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                image: DecorationImage(
                  image: AssetImage('assets/icons/bell.png')
                )


              ),
              child: Text('asd'),



            ) ,
            Container(
              width: 40.w,
              height:40.h,
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: OtrojaColors.primaryColor,width: 3),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                image: DecorationImage(
                  image: AssetImage('assets/icons/message-bubble (1) 1.png')
                )
              ),

            ) ,

          ],
        ),
        mainText: '',
        optionalWidget: SizedBox(
          width: 200,
          height: 70,
          child: Stack(
            children: [
              Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  width: 150.w,
                  height: 50.h,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      border: Border.all(color: OtrojaColors.primaryColor, width: 3)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'مشرف',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          Text(
                            'علاوي أبو حسين',
                            style: const TextStyle(
                                height: 1.47,
                                letterSpacing: 0.02,
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                                color: Color.fromARGB(255, 119, 119, 119)),
                          ),
                        ],
                      ),
                      Image.asset('assets/images/people (1) 1.png')
                    ],
                  ),
                ),
              ),
              Positioned(
                top:-2,
                left: 20,
                child: SizedBox(
                    width: 40,
                    height: 40,
                    child: Image.asset('assets/images/pattern (1) 1.png',fit: BoxFit.fill,)),
              )

            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                  onPressed: _scrollToPreviousItem,
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: OtrojaColors.primaryColor,
                    size: 30,
                  )),
              Container(
                height: 190.h,
                width: 275.w,
                child: ScrollablePositionedList.builder(
                  scrollDirection: Axis.horizontal,
                  itemScrollController: _scrollController,
                  itemPositionsListener: _itemPositionsListener,
                  itemCount: _newsItems.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: OtrojaColors.primaryColor,
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "تكريم حفظة كتاب الله",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                width: 250.w,
                                margin: const EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.0),
                                    image: const DecorationImage(
                                        image: AssetImage(
                                          'assets/images/IMG-20170511-WA0050 1.png',
                                        ),
                                        fit: BoxFit.cover)),
                                padding: const EdgeInsets.all(16.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              IconButton(
                  onPressed: _scrollToNextItem,
                  icon: const Icon(
                    Icons.arrow_forward_ios,
                    color: OtrojaColors.primaryColor,
                    size: 30,
                  )),
            ],
          ),



        ],
      ),
    );
  }
}
