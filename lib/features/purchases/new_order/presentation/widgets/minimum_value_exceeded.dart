import 'package:flutter/material.dart';
import 'package:lavender4/features/purchases/store/presentation/ui/Product_type_details_page.dart';

class MinimumValueExceeded extends StatefulWidget {
  const MinimumValueExceeded({Key? key}) : super(key: key);

  @override
  State<MinimumValueExceeded> createState() => _MinimumValueExceededState();
}

class _MinimumValueExceededState extends State<MinimumValueExceeded> {
  // القيم الثابتة للعرض
  final String materialName = 'Fabric';
  final String materialType = 'Satin';
  final String color = 'blue';
  final int currentValue = 50; // مثال للقيمة الحالية
  final int minimumValue = 100; // مثال للقيمة الدنيا

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: (){
        //  Navigator.push(context, MaterialPageRoute(builder: (context) => ProductTypeDetailsPage()));
        },
        child: Card(
          elevation: 4.0,
          shadowColor: Colors.deepPurple.withOpacity(0.5),
          margin: const EdgeInsets.all(20),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InformationRow(title: 'Name:', value: materialName),
                Divider(),
                InformationRow(title: 'Type:', value: materialType),
                Divider(),
                InformationRow(title: 'Color:', value: color),
                Divider(),
                InformationRow(title: 'Current value:', value: '$currentValue'),
                Divider(),
                InformationRow(
                  title: 'Minimum permissible value:',
                  value: '$minimumValue',
                  highlight: currentValue > minimumValue,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // واجيت مساعد لعرض معلومات الطلبية بطريقة مرتبة
  Widget InformationRow({required String title, required String value, bool highlight = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontFamily: 'Recurisive'
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.blueGrey,

              fontSize: 14.0,
                fontFamily: 'Recurisive'
            ),
          ),
        ],
      ),
    );
  }
}