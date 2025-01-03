import 'package:flutter/material.dart';

class PlatyTextField extends StatefulWidget {
  final Color containerColor;
  final double containerWidth;
  final double borderThickness;
  final Color borderColor;
  final String imagePath;
  final TextDirection textDirection;
  final String labelText;
  final String hintText;

  PlatyTextField({
    required this.containerColor,
    required this.containerWidth,
    required this.borderThickness,
    required this.borderColor,
    required this.imagePath,
    required this.textDirection,
    required this.labelText,
    required this.hintText,
  });

  @override
  _PlatyTextFieldState createState() => _PlatyTextFieldState();
}

class _PlatyTextFieldState extends State<PlatyTextField> {
  final TextEditingController _controller = TextEditingController();
  double _containerHeight = 50.0; // Initial height

  @override
  void initState() {
    super.initState();
    _controller.addListener(_updateContainerHeight);
  }

  @override
  void dispose() {
    _controller.removeListener(_updateContainerHeight);
    _controller.dispose();
    super.dispose();
  }

  void _updateContainerHeight() {
    // Calculate the number of lines in the TextField
    final int lines = '\n'.allMatches(_controller.text).length + 1;
    setState(() {
      _containerHeight = 50.0 + (lines - 1) * 20.0; // Adjust the height as needed
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10, top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            widget.labelText,
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Container(
            width: widget.containerWidth,
            height: _containerHeight,
            padding: EdgeInsets.symmetric(horizontal: 2.5),
            decoration: BoxDecoration(
              color: widget.containerColor,
              border: Border.all(color: widget.borderColor, width: widget.borderThickness),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Stack(
              children: [
                TextField(
                  textAlign: TextAlign.end,
                  controller: _controller,
                  maxLines: null, // Allows unlimited lines
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: widget.hintText, // Set hint text
                    contentPadding: EdgeInsets.only(right: 50.0), // Padding to avoid text under the image
                  ),
                ),
                Positioned(
                  right: 5.0,
                  top: 5.0,
                  child: Image.asset(widget.imagePath, width: 34, height: 34),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
