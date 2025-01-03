import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otroja_users/src/core/utils/extensions.dart';
import 'package:otroja_users/src/otroja/presentation/screens/showExams/widget/exam_card.dart';
import 'package:otroja_users/src/otroja/presentation/screens/showExams/widget/search_bar.dart';

import '../../../../core/routing/routes.dart';
import '../../../cubits/show_exams/show_exams_cubit.dart';
import '../../widgets/otroja_app_bar.dart';
import '../../widgets/otroja_circular_progress_indicator.dart';


class ShowExams extends StatelessWidget {
  ShowExams({super.key});

  final ValueNotifier<String> searchNotifier = ValueNotifier<String>('');

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Number of tabs
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: OtrojaAppBar(
              mainText: 'الامتحانات',
              secText: 'اضغط على الامتحان لعرض تفاصيله والتقدم إليه',

              tabs: [
                Tab(text: 'الامتحانات القادمة'),
                Tab(text: 'الامتحانات السابقة'),
              ],
              tabController: DefaultTabController.of(context),
            ),
            body: TabBarView(
              children: [
                UpcomingExamsTab(searchNotifier: searchNotifier),
                PastExamsTab(searchNotifier: searchNotifier),
              ],
            ),
          );
        }
      ),
    );
  }
}

class UpcomingExamsTab extends StatelessWidget {
  final ValueNotifier<String> searchNotifier;

  const UpcomingExamsTab({required this.searchNotifier});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OtrojaSearchBar1(searchNotifier: searchNotifier), // Custom search bar
        Expanded(
          child: BlocBuilder<ShowExamsCubit, ShowExamsState>(
            builder: (context, state) {
              if (state is ShowExamsLoading) {
                return Center(child: OtrojaCircularProgressIndicator());
              } else if (state is ShowExamsLoaded) {
                return ValueListenableBuilder<String>(
                  valueListenable: searchNotifier,
                  builder: (context, searchQuery, child) {
                    final now = DateTime.now();
                    final upcomingExams = state.list.where((exam) {
                      final examDateTime = DateTime.parse(exam.date!);
                      return examDateTime.isAfter(now) &&
                          examDateTime.year == now.year &&
                          examDateTime.month == now.month &&
                          examDateTime.day == now.day &&
                          exam.name!.toLowerCase().contains(searchQuery.toLowerCase());
                    }).toList();

                    return ListView.separated(
                      separatorBuilder: (context, index) => const SizedBox(height: 18),
                      padding: const EdgeInsets.all(10),
                      itemBuilder: (context, index) {
                        return ExamCard(
                          startDate: upcomingExams[index].date!,
                          examName: upcomingExams[index].name!,
                          onTap: () {
                            context.pushNamed(Routes.examDetails, arguments: upcomingExams[index]);
                          },
                        );
                      },
                      itemCount: upcomingExams.length,
                    );
                  },
                );
              } else {
                return Center(child: Text('No upcoming exams available.'));
              }
            },
          ),
        ),
      ],
    );
  }
}

class PastExamsTab extends StatelessWidget {
  final ValueNotifier<String> searchNotifier;

  const PastExamsTab({required this.searchNotifier});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OtrojaSearchBar1(searchNotifier: searchNotifier), // Custom search bar
        Expanded(
          child: BlocBuilder<ShowExamsCubit, ShowExamsState>(
            builder: (context, state) {
              if (state is ShowExamsLoading) {
                return Center(child: OtrojaCircularProgressIndicator());
              } else if (state is ShowExamsLoaded) {
                return ValueListenableBuilder<String>(
                  valueListenable: searchNotifier,
                  builder: (context, searchQuery, child) {
                    final now = DateTime.now();
                    final pastExams = state.list.where((exam) {
                      final examDateTime = DateTime.parse(exam.date!);
                      return examDateTime.isBefore(now) &&
                          examDateTime.year == now.year &&
                          examDateTime.month == now.month &&
                          exam.name!.toLowerCase().contains(searchQuery.toLowerCase());
                    }).toList();

                    return ListView.separated(
                      separatorBuilder: (context, index) => const SizedBox(height: 18),
                      padding: const EdgeInsets.all(10),
                      itemBuilder: (context, index) {
                        return ExamCard(
                          startDate: pastExams[index].date!,
                          examName: pastExams[index].name!,
                          onTap: () {
                            context.pushNamed(Routes.examDetails, arguments: pastExams[index].id);
                          },
                        );
                      },
                      itemCount: pastExams.length,
                    );
                  },
                );
              } else {
                return Center(child: Text('No past exams available.'));
              }
            },
          ),
        ),
      ],
    );
  }
}
