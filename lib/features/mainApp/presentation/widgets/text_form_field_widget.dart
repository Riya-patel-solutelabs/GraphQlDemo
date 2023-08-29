import 'package:flutter/material.dart';
import 'package:graphqldemo/core/constants/constants.dart';

///reusable textform field widget
class TextFormFieldWidget extends StatefulWidget {
  ///default constructor
  const TextFormFieldWidget(
      {required this.labelText,
      required this.hintText,
      required this.textInputType,
      required this.textInputAction,
      required this.controller,
      required this.prefixIcon,
      required this.currentNode,
      required this.isExpaned,
      super.key});

  @override
  State<StatefulWidget> createState() => _TextFormFieldWidget();

  ///label text var
  final String labelText;

  ///hint text var
  final String? hintText;

  ///input type var
  final TextInputType textInputType;

  ///keyboard action
  final TextInputAction textInputAction;

  ///textediting controller
  final TextEditingController controller;

  ///prefix icon
  final Icon prefixIcon;

  ///focus node current
  final FocusNode currentNode;

  ///need to expand var
  final bool isExpaned;
}

class _TextFormFieldWidget extends State<TextFormFieldWidget> {
  bool _isFocused = false;
  @override
  void initState() {
    super.initState();
    widget.currentNode.addListener(() {
      setState(() {
        _isFocused = widget.currentNode.hasFocus;
      });
    });
  }

  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.all(Constants.minimumPadding * 2),
        child: TextFormField(
          controller: widget.controller,
          
          cursorColor:Constants.darkBlue,
          keyboardType: widget.textInputType,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
          maxLines: widget.isExpaned ? null : 1,
          textInputAction: widget.textInputAction,
          textAlign: TextAlign.left,
          focusNode: widget.currentNode,
          decoration: InputDecoration(
              hintText: widget.hintText,
              labelText: widget.labelText,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              prefixIcon: widget.prefixIcon,
              focusedBorder: const OutlineInputBorder(),
              hintStyle: const TextStyle(fontSize: 14, color: Colors.grey),
              labelStyle: TextStyle(
                fontSize: 16,
                fontWeight: _isFocused ? FontWeight.bold : FontWeight.normal,
                color: _isFocused ? Constants.darkBlue : Colors.grey,
              )),
        ),
      );
}
