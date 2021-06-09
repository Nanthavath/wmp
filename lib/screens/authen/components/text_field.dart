import 'package:flutter/material.dart';

class TextFields extends StatelessWidget {
  const TextFields(
      {Key? key,
      this.hint,
      this.textInputType,
      this.controller,
      this.icon,
      this.secure,
      this.onTap,
      this.onChanged})
      : super(key: key);
  final String? hint;
  final TextEditingController? controller;
  final IconData? icon;
  final bool? secure;
  final TextInputType? textInputType;
  final GestureTapCallback? onTap;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
      child: TextFormField(
        keyboardType: textInputType,
        obscureText: secure!,
        controller: controller,
        decoration: InputDecoration(
          isDense: true,
          hintText: '$hint',
          border: OutlineInputBorder(
            borderSide: BorderSide(),
          ),
          prefixIcon: Icon(icon),
          suffixIcon: controller!.text == "" || controller!.text.isEmpty
              ? Container(
                  width: 1,
                )
              : InkWell(
                  child: Icon(Icons.close),
                  onTap: onTap,
                ),
        ),
        onChanged: onChanged,
      ),
    );
  }
}
