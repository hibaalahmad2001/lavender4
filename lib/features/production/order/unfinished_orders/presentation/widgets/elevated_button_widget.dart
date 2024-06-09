import 'package:flutter/material.dart';

class ElevatedButtonWidget extends StatefulWidget {
  ElevatedButtonWidget({
    Key? key,
    required this.selectedCategory,
    required this.type,
    required this.onPressed,
  }) : super(key: key);

  String selectedCategory;
  String type;
  final void Function(String) onPressed;

  @override
  State<ElevatedButtonWidget> createState() => _ElevatedButtonWidgetState();
}

class _ElevatedButtonWidgetState extends State<ElevatedButtonWidget> {
  bool _isPressed = false;

  void _onButtonPressed() {
    setState(() {
      widget.selectedCategory = widget.type;
    });
    widget.onPressed(widget.type);
  }

  @override
  Widget build(BuildContext context) {
    bool isSelectedCategory = (widget.selectedCategory == widget.type);
    double scale = _isPressed ? 1.1 : 1.0; // تكبير الزر عند الضغط
    double fontSize = _isPressed ? 18.0 : 16.0; // تكبير النص عند الضغط

    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: GestureDetector(
          onTap: _onButtonPressed,
          onTapDown: (_) => setState(() => _isPressed = true),
          onTapCancel: () => setState(() => _isPressed = false),
          onTapUp: (_) => setState(() => _isPressed = false),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 50),
            transform: Matrix4.identity()
              ..scale(scale), // التحكم في تكبير الزر
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors:  [
                    Color(0xBB9FC6FF),
                    Color(0xBBC89CBD),
                    Color(0xBB9CD399),
                    Color(0xBBFEC627),
                  ]),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 6.0,
                  offset: Offset(3, 3),
                ),
              ],
              border: (_isPressed || isSelectedCategory)
                  ? Border.all(
                color: Colors.purple,
                width: 1.5,
              )
                  : null,
            ),
            child: Container(
              constraints: BoxConstraints(
                minWidth: 80.0,
                minHeight: 36.0,
              ),
              child: Center(
                child: AnimatedDefaultTextStyle(
                  duration: Duration(milliseconds: 50),
                  style: TextStyle(
                    color: Colors.grey.shade800,
                    fontWeight: FontWeight.bold,
                    fontSize: fontSize,
                  ),
                  child: Text(widget.type),
                ),
              ),
            ),)
      ),
    );
  }
}