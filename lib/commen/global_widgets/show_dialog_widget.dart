import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ShowDialogWidget extends StatefulWidget {
  final String title;
  final TextEditingController?
      controller; // استخدم TextEditingController بدلاً من int للتحكم في النص
  final String
      inputDecoration; // هذا يجب أن يكون من النوع InputDecoration وليس String
  final String titleOk;
  final Function()? onPressedOk; // جعلها قابلة للتكوين على أنها null
  final GlobalKey<_ShowDialogWidgetState> showDialogWidgetKey;


  // إذا أردت إزالة const، فقط أزلها من هنا
  const ShowDialogWidget({
    Key? key,
    required this.title,
    this.controller,
    required this.inputDecoration,
    required this.titleOk,
    this.onPressedOk, // توفير الدوال كمعاملات اختيارية مع قيم افتراضية
    required this.showDialogWidgetKey,
  }) : super(key: key);

  @override
  State<ShowDialogWidget> createState() => _ShowDialogWidgetState();
}

class _ShowDialogWidgetState extends State<ShowDialogWidget> {
  // int minQuantity = 100; // الافتراضية للكمية الدنيا
  // final _minQuantityController = TextEditingController();

  void _showEditDialog() {
    showDialog(
      barrierColor: Colors.grey.withOpacity(0.7),
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            widget.title,
            // استبدل بترجمتك إذا كانت الواجهة متعددة اللغات
            style: TextStyle(
                color: Colors.blueGrey,
                fontWeight: FontWeight.bold,
                fontFamily: 'Recursive'), // تأكد من صحة اسم الخط
          ),
          content: TextField(
            controller: widget.controller,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: widget.inputDecoration,
              // استبدل بترجمتك إذا كانت الواجهة متعددة اللغات
              border: OutlineInputBorder(),
            ),
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                primary: Colors.white,
                backgroundColor: Colors.red,
              ),
              child: Text("Cancel".tr()),
              // استبدل بترجمتك إذا كانت الواجهة متعددة اللغات
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                primary: Colors.white,
                backgroundColor: Colors.green,
              ),
              child: Text(widget.titleOk),
              // استبدل بترجمتك إذا كانت الواجهة متعددة اللغات
              onPressed: widget.onPressedOk,
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: InkWell(
      onTap: () {
        _showEditDialog();
      },
    ));
  }
}
