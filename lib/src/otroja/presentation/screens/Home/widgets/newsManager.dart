
import 'dart:async';
import 'package:admins/src/otroja/presentation/screens/Home/widgets/newsItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

// Import your project-specific packages
import 'package:admins/src/otroja/core/utils/constants/colors.dart';





class NewsManager extends StatefulWidget {
  const NewsManager({Key? key}) : super(key: key);

  @override
  _NewsManagerState createState() => _NewsManagerState();
}

// The state class for the NewsManager widget, handling scroll logic and timers.
class _NewsManagerState extends State<NewsManager> {
  // List of news headlines to be displayed in the carousel.
  final List<String> _newsItems = [
    'Breaking News: h',
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

  // Controllers for managing the scroll position and interaction.
  final ItemScrollController _scrollController = ItemScrollController();
  final ItemPositionsListener _itemPositionsListener = ItemPositionsListener.create();
  Timer? _timer;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  // Automatically scrolls through news items at regular intervals.
  void _startAutoScroll() {
    _timer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      if (_scrollController.isAttached) {
        _scrollController.scrollTo(
          index: _currentIndex,
          duration: const Duration(seconds: 1),
        );
        _currentIndex++;
        if (_currentIndex >= _newsItems.length) {
          _currentIndex = 0;
        }
      }
    });
  }

  // Stops the automatic scrolling, useful when manually scrolling.
  void _stopAutoScroll() {
    _timer?.cancel();
  }

  // Manually scrolls to the next item in the carousel.
  void _scrollToNextItem() {
    _stopAutoScroll();
    if (_scrollController.isAttached) {
      _scrollController.scrollTo(
        index: _currentIndex,
        duration: const Duration(seconds: 1),
      );
      _currentIndex++;
      if (_currentIndex >= _newsItems.length) {
        _currentIndex = 0;
      }
    }
    _startAutoScroll();
  }

  // Manually scrolls to the previous item in the carousel.
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
      );
    }
    _startAutoScroll();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        // Button to scroll to the previous news item.
        IconButton(
          onPressed: _scrollToPreviousItem,
          icon: const Icon(
            Icons.arrow_back_ios,
            color: OtrojaColors.primaryColor,
            size: 30,
          ),
        ),
        // Container for the carousel of news items.
        Expanded(
          child: SizedBox(
            height: 190.h,
            width: 275.w,
            child: ScrollablePositionedList.builder(
              scrollDirection: Axis.horizontal,
              itemScrollController: _scrollController,
              itemPositionsListener: _itemPositionsListener,
              itemCount: _newsItems.length,
              itemBuilder: (context, index) {
                return NewsItem(
                  newsTitle: _newsItems[index],
                  imageUrl: 'assets/images/homepagepic.jpg',
                );
              },
            ),
          ),
        ),
        // Button to scroll to the next news item.
        IconButton(
          onPressed: _scrollToNextItem,
          icon: const Icon(
            Icons.arrow_forward_ios,
            color: OtrojaColors.primaryColor,
            size: 30,
          ),
        ),
      ],
    );
  }
}