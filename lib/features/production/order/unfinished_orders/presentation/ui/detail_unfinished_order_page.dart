import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lavender4/commen/appBar/app_Bar.dart';
import 'package:lavender4/commen/global_widgets/design_details.dart';
import '../../../../../../commen/global_widgets/text_style_widget.dart';
import '../../../../cart/presentation/ui/purchase_order_page.dart';
import '../widgets/completed_number_widget.dart';
import '../widgets/continue_number_widget.dart';

class DetailsUnderwayOrder extends StatefulWidget {
  const DetailsUnderwayOrder({
    Key? key,
    required this.image,
    required this.requiredDate,
    required this.total,
    required this.type,
  }) : super(key: key);

  final String image;
  final String requiredDate;
  final String type;
  final int total;

  @override
  State<DetailsUnderwayOrder> createState() => _DetailsUnderwayOrderState();
}

class _DetailsUnderwayOrderState extends State<DetailsUnderwayOrder> {
  late TextEditingController _completedController;
  int _completedNumber = 0;
  int _continueNumber = 0;
  final double titleSize = 13;
  bool _isCompleted = false;
  bool _isCountinue = false;
  List<int> _completedNumbers = [];
  List<int> _continueNumbers = [];

  @override
  void initState() {
    super.initState();
    _completedController = TextEditingController();
  }

  @override
  void dispose() {
    _completedController.dispose();
    super.dispose();
  }

  void updateCompletedNumber(int completed) {
    setState(() {
      if (_completedNumbers.length < 3) {
        _completedNumbers.add(completed);
      } else {
        _completedNumbers[_completedNumbers.length - 1] = completed;
      }
      _completedNumber =
          _completedNumbers.reduce((value, element) => value + element);
    });
  }

  void updateContinueNumber(int continuenum) {
    setState(() {
      if (_continueNumbers.length < 3) {
        _continueNumbers.add(continuenum);
      } else {
        _continueNumbers[_continueNumbers.length - 1] = continuenum;
      }
      _continueNumber =
          _continueNumbers.reduce((value, element) => value + element);
    });
  }



  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: 'Details_order'.tr(),
        leadingIcons: [
          IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.black,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
        trailingIcons: [
          IconButton(
            icon: Icon(Icons.add_shopping_cart_outlined,color: Colors.green,size: 30,),
            color: Colors.black,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> PurchaseOrderPage(title: '200', selectedItems: [])));
            },
          ),
        ],
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children:[ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Container(
            color: Colors.grey.shade200,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    child: Container(
                      width: double.infinity,
                      color: Colors.white,
                      child:Column(
                        children: [
                          Text(
                            widget.type,
                            style: const TextStyle(
                              color: Colors.purple,
                              fontFamily: 'Recurisive',
                              fontSize: 20,
                            ),
                          ),

                          SizedBox(height: 7),
                          DesignDetailWidget(images: [widget.image,'assets/images/img_5.png']),
                          SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                     ClipRRect(
                       borderRadius: BorderRadius.all(Radius.circular(5)),
                       child: Container(
                         color: Colors.white,
                         child:Column(
                           children: [
                             Row(
                               children: [
                                 textStyleWidget(
                                     title1: 'Required_date'.tr(), title2: '25/8/2022',direction: Axis.vertical),
                                 SizedBox(width: 60,),
                                 textStyleWidget(
                                     title1: 'Work_starting_date'.tr(), title2: '1/8/2022',direction: Axis.vertical),
                               ],
                             ),
                             SizedBox(height: 10,),

                             Row(
                               children: [
                                 textStyleWidget(
                                     title1: 'The_total_number'.tr(),
                                     title2: 100.toString(),direction: Axis.vertical),
                                 SizedBox(width: context.locale.languageCode == 'ar'?   80 : 40 ,),
                                 textStyleWidget(
                                     title1: 'Number_completed'.tr(),
                                     title2: _completedNumber.toString(),direction: Axis.vertical),
                               ],
                             ),
                             Row(
                               mainAxisAlignment: MainAxisAlignment.start,
                               children: [
                                 textStyleWidget(
                                     title1: 'Work-in-progress'.tr(),
                                     title2: _continueNumber.toString(),direction: Axis.vertical),
                                 SizedBox(width: context.locale.languageCode == 'ar'?   50 : 40 ,),
                                 textStyleWidget(
                                     title1: 'Id_Order'.tr(),
                                     title2: '200',direction: Axis.vertical),

                               ],
                             ),

                           ],
                         ) ,
                       ),
                     ),

                      SizedBox(height: 10,),

                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        child: Container(
                          color: Colors.white,
                          child: Column(
                            children: [
                              SizedBox(height: 10,),
                              Text(
                                "Order_details".tr(),
                                style: TextStyle(
                                    fontSize: titleSize,
                                    color: Colors.black,
                                    fontFamily: 'Recurisive',
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 5,
                              ),

                              Row(
                                children: [
                                  SizedBox(width: 12,),
                                  textStyleWidget(
                                      title1: 'Black'.tr(),
                                      title2: '(50, S) + (30, M) + (30, XL)',direction: Axis.vertical),

                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  color: Colors.grey.shade300,
                                  width: double.infinity,
                                  height: 2,
                                ),
                              ),
                              Row(
                                children: [
                                  SizedBox(width: 12,),
                                  textStyleWidget(
                                      title1: 'Red'.tr(),
                                      title2: '(50, S) + (30, M) + (30, XL)',direction: Axis.vertical),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  color: Colors.grey.shade300,
                                  width: double.infinity,
                                  height: 2,
                                ),
                              ),
                              Row(
                                children: [
                                  SizedBox(width: 12,),
                                  textStyleWidget(
                                      title1: 'White'.tr(),
                                      title2: '(50, S) + (30, M) + (30, XL)',direction: Axis.vertical),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        child: Container(
                          color: Colors.white,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Enter_the_completed_number...".tr(),
                                    style: TextStyle(
                                      fontSize: titleSize,
                                      color: Colors.green.shade700,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Recurisive',
                                    ),
                                  ),

                                  IconButton(
                                      onPressed: () {
                                        setState(() {
                                          _isCompleted = !_isCompleted;
                                        });

                                      },
                                      icon:Icon(_isCompleted == false ?  Icons.arrow_drop_down_outlined : Icons.arrow_drop_up,size: 30,) )
                                ],
                              ),
                              Visibility(
                                visible: _isCompleted,
                                child: Column(
                                  children: [
                                    CombletedNumberWidget(
                                        onUpdateCompletedNumber:
                                        updateCompletedNumber,
                                        color: 'Black_Color'.tr()),
                                    CombletedNumberWidget(
                                        onUpdateCompletedNumber:
                                        updateCompletedNumber,
                                        color: 'Red_Color'.tr()),
                                    CombletedNumberWidget(
                                        onUpdateCompletedNumber:
                                        updateCompletedNumber,
                                        color: 'White_Color'.tr()),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(height: 15,),
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        child: Container(
                          color: Colors.white,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Enter_the_work-in-progress_number...".tr(),
                                    style: TextStyle(
                                      fontSize: titleSize,
                                      color: Colors.green.shade700,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Recurisive',
                                    ),
                                  ),

                                  IconButton(
                                      onPressed: () {
                                        setState(() {
                                          _isCountinue = !_isCountinue;
                                        });

                                      },
                                      icon:Icon(_isCountinue == false ?  Icons.arrow_drop_down_outlined : Icons.arrow_drop_up,size: 30,) )
                                ],
                              ),
                              Visibility(
                                visible: _isCountinue,
                                child: Column(
                                  children: [
                                    ContinueNumberWidget(
                                      onUpdateContinueNumber:
                                      updateContinueNumber,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )

                    ],
                  ),
                ],
              ),
            ),
          ),
        ),]
      ),
    );
  }
}
