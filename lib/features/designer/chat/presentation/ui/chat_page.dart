import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:lavender4/commen/appBar/app_Bar.dart';
import 'package:lavender4/features/designer/chat/presentation/ui/show_image_page.dart';

class Message {
  final String text;
  final bool isOwnMessage;
  final DateTime timestamp;
  final File? image; // Add the 'image' field

  Message({
    required this.text,
    required this.isOwnMessage,
    required this.timestamp,
    this.image, // Initialize the 'image' field
  });
}

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final List<Message> _messages = [];
  final _textController = TextEditingController();

  void initState() {
    super.initState();

    _messages.addAll([
      Message(
        text: 'مرحباً، كيف حالك اليوم؟',
        isOwnMessage: false,
        timestamp: DateTime(2024, 5, 20),
      ),
      Message(
        text: 'أنا بخير، شكراً لك! وأنت؟',
        isOwnMessage: true,
        timestamp: DateTime(2024, 5, 20),
      ),
      Message(
        text: 'أنا بخير أيضاً، شكراً على السؤال.',
        isOwnMessage: false,
        timestamp: DateTime.now().subtract(Duration(minutes: 30)),
      ),
      Message(
        text: 'هل لديك أي خطط لنهاية الأسبوع؟',
        isOwnMessage: true,
        timestamp: DateTime.now().subtract(Duration(minutes: 15)),
      ),
      Message(
        text: 'نعم، لدي بعض الخطط.',
        isOwnMessage: false,
        timestamp: DateTime.now().subtract(Duration(minutes: 10)),
      ),
    ]);
    _messages.sort((a, b) => b.timestamp.compareTo(a.timestamp));
  }

  File? _selectedImage;

  Future<void> _pickImage() async {
    final imagePicker = ImagePicker();
    final pickedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _selectedImage = File(pickedImage.path);
      });
    }
  }

  void _handleSubmitted(String text) {
    _textController.clear();
    setState(() {
      _messages.insert(
        0,
        Message(
          text: text,
          isOwnMessage: true,
          timestamp: DateTime.now(),
          image: _selectedImage, // إضافة الصورة إلى الرسالة
        ),
      );
      _selectedImage = null; // إعادة تهيئة الصورة المحددة
    });
  }

  Widget _buildMessageItem(Message message) {
    final bool isOwnMessage = message.isOwnMessage;
    final Color? backgroundColor =
    isOwnMessage ? Colors.purple[300] : Colors.grey[200];
    final BorderRadius borderRadius = isOwnMessage
        ? BorderRadius.only(
      topLeft: Radius.circular(16),
      bottomLeft: Radius.circular(16),
      topRight: Radius.circular(16),
    )
        : BorderRadius.only(
      topRight: Radius.circular(16),
      bottomRight: Radius.circular(16),
      topLeft: Radius.circular(16),
    );

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ShowImagePage(image: message.image!),
          ),
        );
      },
      child: Material(
        child: Column(
          crossAxisAlignment: isOwnMessage
              ? CrossAxisAlignment.end
              : CrossAxisAlignment.start,
          children: <Widget>[
            if (_shouldDisplayDate(message)) // إضافة شرط لعرض التاريخ فوق الرسالة
              Container(
                margin: EdgeInsets.only(bottom: 8),
                child: Row( // استخدام واجهة الصف
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          _formatDate(message.timestamp), // عرض التاريخ
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            if (message.image != null)
              Container(
                margin: const EdgeInsets.only(top: 8),
                child: Material(
                  color: backgroundColor,
                  borderRadius: borderRadius,
                  elevation: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: isOwnMessage
                            ? BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16),
                        )
                            : BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16),
                        ),
                        child: Image.file(
                          message.image!,
                          width: 300,
                          height: 200,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          _formatTime(message.timestamp),
                          style: TextStyle(
                            color: isOwnMessage ? Colors.white70 : Colors.black54,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            if (message.text.isNotEmpty)
              Padding(
                padding: EdgeInsets.only(top: 8),
                child: Material(
                  borderRadius: borderRadius,
                  elevation: 1,
                  color: backgroundColor,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          message.text,
                          style: TextStyle(
                            color: isOwnMessage ? Colors.white : Colors.black87,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          _formatTime(message.timestamp),
                          style: TextStyle(
                            color: isOwnMessage ? Colors.white70 : Colors.black54,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
  bool _shouldDisplayDate(Message message) {
    if (_messages.isEmpty) {
      return true;
    }

    final index = _messages.indexOf(message);
    if (index == _messages.length - 1) {
      // Last message, always display the date
      return true;
    }

    final currentDate = _formatDate(message.timestamp);
    final nextDate = _formatDate(_messages[index + 1].timestamp);

    return currentDate != nextDate;
  }

  String _formatDate(DateTime timestamp) {
    final dateFormat = DateFormat('dd/MM/yyyy');
    return dateFormat.format(timestamp);
  }

  String _formatTime(DateTime timestamp) {
    final timeFormat = DateFormat(
        'h:mm a',
        context.locale.languageCode == 'ar'
            ? 'ar'
            : 'en'); // استخدام اللغة العربية

    return timeFormat.format(timestamp);
  }

  Widget _buildTextComposer() {
    return IconTheme(
      data: IconThemeData(color: Theme.of(context).colorScheme.secondary),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(children: <Widget>[
          Flexible(
            child: TextField(
              controller: _textController,
              onSubmitted: _handleSubmitted,
              decoration: InputDecoration.collapsed(hintText: "Send a message"),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 4.0),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.image, color: Colors.grey), // زر الصورة
                  onPressed: _pickImage,
                ),
                IconButton(
                  icon: Icon(Icons.send, color: Colors.grey),
                  onPressed: () => _handleSubmitted(_textController.text),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: 'Chat', leadingIcons: [
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
        ),
      ]),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(8.0),
              reverse: true,
              itemBuilder: (_, int index) =>
                  _buildMessageItem(_messages[index]),
              itemCount: _messages.length,
            ),
          ),
          Divider(height: 1.0),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
            ),
            child: _buildTextComposer(),
          ),
        ],
      ),
    );
  }
}
