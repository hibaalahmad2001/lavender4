import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DesignDetailWidget extends StatefulWidget {
  const DesignDetailWidget({Key? key, required this.images}) : super(key: key);
  final List<String> images;

  @override
  State<DesignDetailWidget> createState() => _DesignDetailWidgetState();
}

class _DesignDetailWidgetState extends State<DesignDetailWidget> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
          barrierColor: Colors.grey.withOpacity(0.7),
          barrierDismissible: true,
          context: context,
          builder: (BuildContext context) {
            return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return AlertDialog(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  content: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      // mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                           mainAxisAlignment: MainAxisAlignment.spaceEvenly, // لتوزيع العناصر بالتساوي
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.arrow_back_ios,
                                size: 24,
                                color: currentIndex > 0 ? Colors.black : Colors.grey,
                              ),
                              onPressed: currentIndex > 0
                                  ? () {
                                setState(() {
                                  currentIndex = currentIndex - 1;
                                });
                              }
                                  : null,
                            ),

                            Expanded(
                              child: Image.asset(
                                widget.images[currentIndex],
                                width: 165.w, // قد تحتاج لضبط هذه القيمة
                                height: 250.h, // وهذه أيضاً
                                fit: BoxFit.cover,
                              ),
                            ),

                            IconButton(
                              icon: Icon(
                                Icons.arrow_forward_ios,
                                size: 24,
                                color: currentIndex < widget.images.length - 1 ? Colors.black : Colors.grey,
                              ),
                              onPressed: currentIndex < widget.images.length - 1
                                  ? () {
                                setState(() {
                                  currentIndex = currentIndex + 1;
                                });
                              }
                                  : null,
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade800,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              "${currentIndex + 1} / ${widget.images.length}",
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),


                        const SizedBox(height: 15),
                        StyleWidget(
                          title: 'Id'.tr(),
                          detail: '300',
                          icon: Icons.verified_user, //
                          color:  Colors.grey.shade200,
                        ),
                        StyleWidget(
                          title: 'Name'.tr(),
                          detail: 'Jacket'.tr(),
                          icon: Icons.label, // مثال لأيقونة
                          color:  Colors.grey.shade200,
                        ),
                        StyleWidget(
                            title: 'Total_height'.tr(),
                            detail: '100 cm',
                            icon: Icons.height, // مثال لأيقونة
                            color: Colors.grey.shade200

                        ),
                        StyleWidget(
                            title: 'Fabrics:'.tr(),
                            detail: '',
                            icon: Icons.texture, // مثال لأيقونة
                            color: Colors.purple.shade100),
                        StyleWidget(
                          title: 'Fur'.tr(),
                          detail: 'Width'.tr() +': 10\n' + 'Height'.tr() + ': 20' ,
                          icon: Icons.radio_button_checked, // مثال لأيقونة
                            color: Colors.purple.shade100
                        ),
                        StyleWidget(
                          title: 'Gogh'.tr(),
                          detail: 'Width'.tr() +': 10\n' + 'Height'.tr() + ': 20' ,
                          icon: Icons.radio_button_checked, // مثال لأيقونة
                            color: Colors.purple.shade100
                        ),

                        StyleWidget(
                          title: 'Accessories:'.tr(),
                          detail: '',
                          icon: Icons.extension, // مثال لأيقونة
                            color: Colors.green.shade100
                        ),
                        StyleWidget(
                          title: 'Leather_button'.tr(),
                          detail: '2',
                          icon: Icons.radio_button_checked, // مثال لأيقونة
                            color: Colors.green.shade100
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          },
        );
      },
      child: Image.asset(
        alignment: Alignment.topCenter,
        widget.images[currentIndex],
        width: 90,
        height: 100,
      ),
    );
  }
}

class StyleWidget extends StatelessWidget {
  final String title;
  final String detail;
  final IconData icon;
  final Color color;

  const StyleWidget(
      {Key? key,
      required this.title,
      required this.detail,
      required this.icon,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        margin: const EdgeInsets.only(bottom: 10.0),
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 6,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          children: <Widget>[
            Icon(
              icon,
              color: Colors.grey.shade700,
              size: 20.0,
            ),
            SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade900,
                      fontSize: 14,
                      fontFamily: 'Recursive',
                    ),
                  ),
                  if (detail.isNotEmpty)
                    Text(
                      detail,
                      style: TextStyle(
                        color: Colors.grey.shade800,
                        fontSize: 13,
                        fontFamily: 'Recursive',
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
