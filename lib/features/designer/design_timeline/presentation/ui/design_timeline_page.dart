import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // لتنسيق التواريخ

class DesignTimelinePage extends StatefulWidget {
  const DesignTimelinePage({Key? key}) : super(key: key);

  @override
  _DesignTimelinePageState createState() => _DesignTimelinePageState();
}

class _DesignTimelinePageState extends State<DesignTimelinePage> {
  List<Map<String, dynamic>> designDeliveryTimeline = [];

  Future<void> _selectNewDeliveryDate(BuildContext context, int index) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: designDeliveryTimeline[index]["deliveryDate"],
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null &&
        picked != designDeliveryTimeline[index]["deliveryDate"]) {
      setState(() {
        designDeliveryTimeline[index]["deliveryDate"] = picked;
      });
    }
  }

  void _showAddDesignDialog() {
    final _titleController = TextEditingController();
    DateTime _selectedDate = DateTime.now();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Add new design"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _titleController,
                decoration: InputDecoration(hintText: "The name of design"),
              ),
              SizedBox(height: 10),
              ListTile(
                title: Text(
                    "Completion Date: ${DateFormat('yyyy/MM/dd').format(_selectedDate)}"),
                trailing: Icon(Icons.calendar_today),
                onTap: () async {
                  final DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: _selectedDate,
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2101),
                  );
                  if (picked != null && picked != _selectedDate) {
                    setState(() {
                      _selectedDate = picked;
                    });
                  }
                },
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: Text('Add'),
              onPressed: () {
                if (_titleController.text.isNotEmpty) {
                  setState(() {
                    designDeliveryTimeline.add({
                      'title': _titleController.text,
                      'deliveryDate': _selectedDate,
                      'addedDate': DateTime.now(), // تاريخ إضافة التصميم
                    });
                    _titleController.clear(); // لتنظيف الحقل بعد الإضافة
                  });
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        itemCount: designDeliveryTimeline.length,
        itemBuilder: (context, index) {
          final item = designDeliveryTimeline[index];
          return Card(
            margin: EdgeInsets.only(left: 5,right: 5,top: 7),
            elevation: 5.0,
            child: ListTile(
              title: Text(
                item["title"],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Padding(
                padding: EdgeInsets.only(top: 5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Start Date:${DateFormat('yyyy/MM/dd').format(item["addedDate"])}",
                      style: TextStyle(color: Colors.black.withOpacity(0.6)),
                    ),
                    SizedBox(height:10,),
                    Text(
                      "Completion Date: ${DateFormat('yyyy/MM/dd').format(item["deliveryDate"])}",
                      style: TextStyle(color: Colors.black.withOpacity(0.6)),
                    ),

                  ],
                ),
              ),
              trailing: IconButton(
                icon: Icon(Icons.date_range, color: Theme.of(context).primaryColor),
                onPressed: () => _selectNewDeliveryDate(context, index),
              ),
              onTap: () {
                // هنا يمكن إضافة تفاعل عند الضغط على أي تصميم، مثلاً عرض تفصيل أكثر أو تعديل التصميم
              },
            ),
          );
        },
        separatorBuilder: (context, index) =>
            Divider(color: Colors.grey.shade300),
        padding: EdgeInsets.all(8.0),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddDesignDialog,
        tooltip: 'Add new design',
        child: Icon(Icons.add),
        backgroundColor: Colors.purple,
      ),
    );
  }
}
