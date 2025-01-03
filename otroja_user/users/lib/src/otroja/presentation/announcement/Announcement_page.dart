import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:otroja_users/src/core/utils/constant.dart';

import '../../../core/utils/colors.dart';
import '../../cubits/announcement/add_announcement.dart';
import '../../cubits/announcement/show_announcement_cubit.dart';
import '../widgets/otroja_app_bar.dart';
import '../widgets/otroja_text_field.dart';

class AnnouncementPage extends StatefulWidget {
  @override
  _AnnouncementPageState createState() => _AnnouncementPageState();
}

class _AnnouncementPageState extends State<AnnouncementPage> {
  void _showAddAnnouncementDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return BlocProvider(
          create: (_) => AnnouncementFormCubit(),
          child: AnnouncementFormDialog(),
        );
      },
    ).then((_) {
      // Trigger refresh when the dialog is closed
      context.read<AnnouncementCubit1>().fetchAnnouncements();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OtrojaAppBar(
        mainText: 'الإعلانات',
      ),
      body:
       BlocBuilder<AnnouncementCubit1, List<Announcement>>(
          builder: (context, announcements) {
            if (announcements.isEmpty) {
              return const Center(child: CircularProgressIndicator());
            }

            return ListView.builder(
              itemCount: announcements.length + 1,
              // Add one more item for the loading indicator
              itemBuilder: (context, index) {
                if (index == announcements.length) {
                  // This is the last item, show a loading indicator
                  context.read<AnnouncementCubit1>().loadNextPage();
                  return Padding(
                    padding: EdgeInsets.all(8.0.r),
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }

                final announcement = announcements[index];
                return _buildCardNews(announcement.body, announcement.title,announcement.imagePath);
              },
            );
          },
        ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: OtrojaColors.primary2Color,
        onPressed: () => _showAddAnnouncementDialog(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}

class AnnouncementFormDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AnnouncementFormCubit, AnnouncementFormState>(
      listener: (context, state) {
        if (state.isSubmitted) {
          Navigator.of(context).pop(); // Close dialog on successful submission
        }
      },
      child: AlertDialog(
        title: const Text(
          ' إضافة إعلان',
          textAlign: TextAlign.center,
        ),
        content: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              OtrojaTextFormField(
                label: 'عنوان',
                onChange: (value) =>
                    context.read<AnnouncementFormCubit>().setTitle(value),
              ),
              OtrojaTextFormField(
                label: 'الوصف',
                onChange: (value) =>
                    context.read<AnnouncementFormCubit>().setBody(value),
              ),
              const SizedBox(height: 10),
              BlocBuilder<AnnouncementFormCubit, AnnouncementFormState>(
                builder: (context, state) {
                  return state.image == null
                      ? const Text('لم يتم اختيار أي صورة.')
                      : Image.file(state.image!, height: 100);
                },
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {},
                child: const Text('إختر الصورة'),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () => context
                      .read<AnnouncementFormCubit>()
                      .uploadAnnouncement(myToken),
                  child: const Text('اضافة'),
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('الغاء'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

_buildCardNews(body, title,imagePath) {
  bool test= imagePath =="assets/images/IMG-20170511-WA0050 1.png" ;
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 8.0.r, vertical: 8.0.r),
    child: Row(
      children: [
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: OtrojaColors.primaryColor,
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0.r),
                  child: Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  height: 150,
                  margin: EdgeInsets.all(8.0.r),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0.r),
                    image: DecorationImage(
                      image: !test
                          ? NetworkImage('http://192.168.137.245:8000/storage/$imagePath')
                          : const AssetImage("assets/images/IMG-20170511-WA0050 1.png") as ImageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                  padding: EdgeInsets.all(16.0.r),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0.r),
                  child: Text(
                    body,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
