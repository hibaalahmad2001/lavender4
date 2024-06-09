import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lavender4/commen/appBar/app_Bar.dart';
import 'package:lavender4/commen/global_widgets/design_details.dart';
import 'package:lavender4/features/designer/Mood_Board/presentation/ui/mood_board_page.dart';
import 'package:lavender4/features/designer/chat/presentation/ui/all_chats_page.dart';
import 'package:lavender4/features/designer/chat/presentation/ui/chat_page.dart';
import 'package:lavender4/features/designer/design_timeline/presentation/ui/design_timeline_page.dart';
import 'package:lavender4/features/designer/details/presentation/ui/design_details_page.dart';
import 'package:lavender4/features/designer/setting/presentation/ui/setting.dart';

class BasePage extends StatefulWidget {
  const BasePage({Key? key}) : super(key: key);

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  int _currentIndex = 0;

  List<Widget> body = [];

  @override
  void initState() {
    super.initState();
    body = [
      AllChatsPage(),
      DesignTimelinePage(),
      DesignDetailsPage(),
      MoodBoardPage(),
      Setting(),
    ];
  }

  List<Widget?> appBarList = <Widget?>[
    AppBarWidget(
      title: 'Chat'.tr(),
    ),
    AppBarWidget(
      title: 'design Timeline'.tr(),
    ),
    AppBarWidget(
      title: 'Design Details'.tr(),
    ),
    AppBarWidget(
      title: 'Mood Board'.tr(),
    ),
    null,
    //  null, // استبدل AppBar للصفحة Setting بقيمة null
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarList[_currentIndex] != null
          ? appBarList[_currentIndex] as PreferredSizeWidget
          : null, // استخدم AppBar المناسب إذا كانت القيمة غير قابلة للتطبيق
      body: Container(
        child: Center(
          child: body[_currentIndex],
        ),
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.purple.shade100, // تعيين اللون الأحمر هنا
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (int newIndex) {
            setState(() {
              _currentIndex = newIndex;
            });
          },
          selectedItemColor: Colors.purple,
          unselectedItemColor: Colors.black38,
          items: [
            BottomNavigationBarItem(
              label: 'Chat'.tr(),
              icon: Icon(Icons.chat),
            ),
            BottomNavigationBarItem(
              label: 'design Timeline'.tr(),
              icon: Icon(Icons.hourglass_empty),
            ),
            BottomNavigationBarItem(
              label: 'Design Details'.tr(),
              icon: Icon(Icons.note_alt_outlined),
            ),
            BottomNavigationBarItem(
              label: 'Mood Board'.tr(),
              icon: Icon(Icons.palette),
            ),
            BottomNavigationBarItem(
              label: 'Setting'.tr(),
              icon: Icon(Icons.settings),
            ),
          ],
        ),
      ),
    );
  }
}
