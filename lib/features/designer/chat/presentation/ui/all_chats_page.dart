import 'package:flutter/material.dart';
import 'package:lavender4/features/designer/chat/presentation/ui/chat_page.dart';

class AllChatsPage extends StatefulWidget {
  const AllChatsPage({Key? key}) : super(key: key);

  @override
  State<AllChatsPage> createState() => _AllChatsPageState();
}

class _AllChatsPageState extends State<AllChatsPage> {
  final List<Map<String, dynamic>> _chatsData = [
    {
      'name': 'أحمد',
      'message': 'مرحباً! كيف حالك؟',
      'time': '3:45 م',
    },
    {
      'name': 'سارة',
      'message': 'هل ستحضر الاجتماع اليوم؟',
      'time': '1:30 م',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        itemCount: _chatsData.length,
        separatorBuilder: (context, index) => const Divider(), // فاصل بين عناصر القائمة
        itemBuilder: (BuildContext context, int index) {
          final chat = _chatsData[index];
          return ListTile(
              leading: const Icon(Icons.person,size: 40),
              title: Text(
                chat['name'],
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  fontFamily: 'Recurisive'
                ),
              ),
              subtitle: Text(
                chat['message'],
                style: TextStyle(
                  color: Colors.grey.shade600,
                    fontFamily: 'Recurisive'
                ),
                overflow: TextOverflow.ellipsis,
              ),
              trailing: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    chat['time'],
                    style: const TextStyle(color: Colors.black54, fontSize: 14, fontFamily: 'Recurisive'),
                  ),
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.green,
                    ),
                    child: const Text(
                      '1', // مثال على عدد الرسائل الجديدة
                      style: TextStyle(color: Colors.white, fontSize: 14, fontFamily: 'Recurisive'),
                    ),
                  ),
                ],
              ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ChatPage())
              );
            }
          );
        },
      ),
    );
  }
}
