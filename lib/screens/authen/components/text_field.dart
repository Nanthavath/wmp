import 'package:flutter/material.dart';

class TextFields extends StatelessWidget {
  const TextFields(
      {Key? key,
      this.hint,
      this.textInputType,
      this.controller,
      this.prefixIcon,
      this.secure,
      this.onTap,
      this.onChanged})
      : super(key: key);
  final String? hint;
  final TextEditingController? controller;
  final IconData? prefixIcon;
  final bool? secure;
  final TextInputType? textInputType;
  final ValueChanged<String>? onChanged;
  final GestureTapCallback? onTap;

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
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 0.5),
          ),
          prefixIcon: Icon(prefixIcon,size: 25,),
          contentPadding: EdgeInsets.only(top: 5,bottom: 5,right: 10),
          suffixIcon: controller!.text.isEmpty || controller!.text == ""
              ? Container(
                  width: 1,
                )
              : InkWell(
                  child: Icon(Icons.clear),
                  onTap: onTap,
                ),
        ),
        onChanged: onChanged,
      ),
    );
  }
}
