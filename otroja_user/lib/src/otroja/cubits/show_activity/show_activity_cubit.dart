import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../data/models/show_activity_model.dart';
import '../../data/repositories/show_activity_repo.dart';

part 'show_activity_state.dart';

class ShowActivityCubit extends Cubit<ShowActivityState> {
  final ShowActivityRepo showActivityRepo;
  ShowActivityCubit(this.showActivityRepo) : super(ShowActivityInitial()) {}
  final List<ShowActivityModel> activityList = <ShowActivityModel>[];
  int? studentId;
  int? activityId;

  Future<void> didActivity() async {
    try {
      final result =
          await showActivityRepo.didActivity(studentId!, activityId!);

      emit(ShowActivityDid());
      emit(ShowActivityLoaded(activityList));
    } catch (e) {
      emit(ShowActivityError());
    }
  }

  Future<void> getActivity() async {
    emit(ShowActivityLoading());
    try {
      final activities = await showActivityRepo.getStudents();
      print(activities);

      for (var data in activities['data']) {
        print(data);
        print('//////');
        activityList.add(ShowActivityModel.fromJson(data));
        print('after');
      }
      print('//////////test');
      emit(ShowActivityLoaded(activityList));
    } catch (e) {
      print(e);
    }
  }
}
