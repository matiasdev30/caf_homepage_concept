import 'package:flutter/material.dart';

class AnimatedToggle extends StatefulWidget {
  final List<String> values;
  final Function onToggle;
  final Color backgroundColor;
  final Color buttonColor;
  final Color textColor;
  final List<BoxShadow> shadows;

   // ignore: use_key_in_widget_constructors
   const AnimatedToggle({
    required this.values,
    required this.onToggle,
    this.backgroundColor = const Color(0xFFe7e7e8),
    this.buttonColor = const Color(0xFFFFFFFF),
    this.textColor = const Color(0xFF000000),
    this.shadows = const [
      BoxShadow(
        color:  Color(0xFFd8d7da),
        spreadRadius: 5,
        blurRadius: 10,
        offset: Offset(0, 5),
      ),
    ],
  });
  @override
  _AnimatedToggleState createState() => _AnimatedToggleState();
}

class _AnimatedToggleState extends State<AnimatedToggle> {
  bool initialPosition = true;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: 200,
      height: 30,
      margin: const EdgeInsets.all(20),
      child: Stack(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              initialPosition = !initialPosition;
              
              setState(() {
                widget.onToggle();
              });
            },
            child: Container(
              width: 200,
              height: 30,
              decoration: ShapeDecoration(
                color: widget.backgroundColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(width * 0.1),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  widget.values.length,
                  (index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Text(
                      widget.values[index],
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF918f95),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          AnimatedAlign(
            duration: const Duration(milliseconds: 250),
            curve: Curves.decelerate,
            alignment:
                initialPosition ? Alignment.centerLeft : Alignment.centerRight,
            child: Container(
              width: 100,
              height: 30,
              decoration: ShapeDecoration(
                color: widget.buttonColor,
                shadows: widget.shadows,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(width * 0.1),
                ),
              ),
              child: Text(
                initialPosition ? widget.values[0] : widget.values[1],
                style: TextStyle(
                  fontSize: 14,
                  color: widget.textColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              alignment: Alignment.center,
            ),
          ),
        ],
      ),
    );
  }
}
