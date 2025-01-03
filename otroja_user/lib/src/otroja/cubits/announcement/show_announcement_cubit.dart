import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/datasource/api_services.dart';

class AnnouncementCubit1 extends Cubit<List<Announcement>> {
  @override
  Future<void> close() {
    // TODO: implement close
    return super.close();
  }
  AnnouncementCubit1() : super([]);

  int _currentPage = 1;
  bool isLoading = false;
  bool hasMoreData = true;
  List<Announcement> list=[];

  Future<void> fetchAnnouncements({int page = 1}) async {
    if (isLoading || !hasMoreData) return;

    isLoading = true;

    try
    {
      print('///////////////////////');
      ApiService apiService = ApiService();
      var response = await apiService
          .get('announcments?page=$page');

      if (response.statusCode == 200) {
        List<dynamic> data = response.data['data']['data'];
        print(data);

        hasMoreData = data.isNotEmpty;

        List<Announcement> announcements = data.map((item) {
          return Announcement.fromJson(item);
        }).toList();
        list.addAll(announcements);


        if (page > 1) {
          emit(List.from(state)..addAll(announcements));
        } else {
          emit(announcements);
        }

        _currentPage = page;
        close();
      } else {
        throw Exception('Failed to load announcements');
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading = false;
    }
  }

  void loadNextPage() {
    if (hasMoreData && !isLoading) {
      fetchAnnouncements(page: _currentPage + 1); // Fetch the next page
    }
  }

  void refreshAnnouncements() {
    _currentPage = 1;
    hasMoreData = true;
    fetchAnnouncements(page: 1); // Reload the first page
  }
}

class Announcement {
  final int id;
  final String title;
  final String body;
  final String createdAt;
  final String updatedAt;
  final String? imagePath;

  Announcement({
    required this.id,
    required this.title,
    required this.body,
    required this.createdAt,
    required this.updatedAt,
    this.imagePath,
  });

  factory Announcement.fromJson(Map<String, dynamic> json) {
    return Announcement(
      id: json['id'],
      title: json['title'],
      body: json['body'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      imagePath: json['image'] != null ? json['image']['path'] : 'assets/images/IMG-20170511-WA0050 1.png',
    );
  }

}
