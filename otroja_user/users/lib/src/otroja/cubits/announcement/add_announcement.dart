import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:image_picker/image_picker.dart';

import '../../../core/utils/constant.dart';

class AnnouncementFormCubit extends Cubit<AnnouncementFormState> {
  AnnouncementFormCubit() : super(AnnouncementFormState());

  // final picker = ImagePicker();

  void setTitle(String title) {
    emit(state.copyWith(title: title));
  }

  void setBody(String body) {
    emit(state.copyWith(body: body));
  }

  // Future<void> pickImage() async {
  //   // final pickedFile = await picker.pickImage(source: ImageSource.gallery);
  //
  //   if (pickedFile != null) {
  //     emit(state.copyWith(image: File(pickedFile.path)));
  //   } else {
  //     print('No image selected.');
  //   }
  // }

  Future<void> uploadAnnouncement(String token) async {
    if (state.title.isEmpty || state.body.isEmpty || state.image == null) {
      print('Please fill all fields and select an image.');
      return;
    }

    String fileName = state.image!.path.split('/').last;

    FormData formData = FormData.fromMap({
      'image': [
        await MultipartFile.fromFile(state.image!.path, filename: fileName),
      ],
      'title': state.title,
      'body': state.body,
    });

    try {
      Dio dio = Dio();
      Response response = await dio.post(
        'http://$ip:8000/api/announcment/create', // Adjust this URL
        data: formData,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'multipart/form-data',
          },
        ),
      );

      if (response.statusCode == 201) {
        print('Upload successful: ${response.data}');
        emit(state.copyWith(isSubmitted: true)); // Indicate success
      } else {
        print('Upload failed: ${response.statusMessage}');
      }
    } catch (e) {
      print('Exception: $e');
    }
  }
}

class AnnouncementFormState {
  final String title;
  final String body;
  final File? image;
  final bool isSubmitted;

  AnnouncementFormState({
    this.title = '',
    this.body = '',
    this.image,
    this.isSubmitted = false,
  });

  AnnouncementFormState copyWith({
    String? title,
    String? body,
    File? image,
    bool? isSubmitted,
  }) {
    return AnnouncementFormState(
      title: title ?? this.title,
      body: body ?? this.body,
      image: image ?? this.image,
      isSubmitted: isSubmitted ?? this.isSubmitted,
    );
  }
}