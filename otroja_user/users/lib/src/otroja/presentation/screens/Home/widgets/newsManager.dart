import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:otroja_users/src/core/utils/extensions.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../../../../core/routing/routes.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../cubits/announcement/show_announcement_cubit.dart';
import '../../../widgets/otroja_circular_progress_indicator.dart';
import 'newsItem.dart';

// Import your project-specific packages

class NewsManager extends StatefulWidget {
  final List<Announcement> list;

  const NewsManager({Key? key, required this.list}) : super(key: key);

  @override
  _NewsManagerState createState() => _NewsManagerState();
}

// The state class for the NewsManager widget, handling scroll logic and timers.
class _NewsManagerState extends State<NewsManager> {
  // List of news headlines to be displayed in the carousel.


  // Controllers for managing the scroll position and interaction.
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

  // Automatically scrolls through news items at regular intervals.
  void _startAutoScroll() {
    _timer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      if (_scrollController.isAttached) {
        _scrollController.scrollTo(
          index: _currentIndex,
          duration: const Duration(seconds: 1),
        );
        _currentIndex++;
        if (_currentIndex >= widget.list.length) {
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
      if (_currentIndex >= widget.list.length) {
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
        _currentIndex = widget.list.length - 1;
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
    final cubit = context.read<AnnouncementCubit1>();


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
        BlocBuilder<AnnouncementCubit1, List<Announcement>>(
          builder: (context, state) {
            return Expanded(
                child: cubit.isLoading
                    ? SizedBox(
                  height: 190.h,
                  width: 275.w,
                  child: const Center(
                    child: OtrojaCircularProgressIndicator(),
                  ),
                )
                    : InkWell(
                  onTap: (){
                    context.pushNamed(Routes.announcementPage);
                  },
                  child: SizedBox(
                    height: 190.h,
                    width: 275.w,
                    child: ScrollablePositionedList.builder(
                      scrollDirection: Axis.horizontal,
                      itemScrollController: _scrollController,
                      itemPositionsListener: _itemPositionsListener,
                      itemCount: widget.list.length,
                      itemBuilder: (context, index) {
                        // String test= widget.list[index].imagePath!;
                        // print(test.isNotEmpty);
                        return NewsItem(
                          newsTitle: widget.list[index].title,
                          imageUrl: widget.list[index].imagePath! ,
                        );
                      },
                    ),
                  ),
                ));
          },
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
