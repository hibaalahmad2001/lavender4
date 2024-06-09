import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lavender4/commen/appBar/app_Bar.dart';
import 'package:lavender4/features/designer/chat/presentation/ui/chat_page.dart';

class ShowImagePage extends StatelessWidget {
  ShowImagePage({Key? key, required this.image}) : super(key: key);

  final File? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: 'Image', leadingIcons: [
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
        ),
      ]),
      body: Center(
        child: InteractiveViewer(
          panEnabled: false,
          // Set it to false to prevent panning.
          boundaryMargin: EdgeInsets.all(100),
          minScale: 0.5,
          maxScale: 4,
          child: Image.file(image as File),
        ),
      ),
    );
  }
}
