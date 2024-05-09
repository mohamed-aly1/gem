import 'package:flutter/material.dart';

Widget defaultButton({
  double size = 20,
  double width = 180,
  double height = 50,
  Color backgroundColor = const Color(0xFF2B2B28),
  Color textColor = Colors.white,
  required VoidCallback onpressedfunction,
  required String title,
}) =>
    ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(20)),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            // color: Colors.red,
            ),
        child: ElevatedButton(
          onPressed: onpressedfunction,
          child: Text(
            textAlign: TextAlign.center,
            title,
            style: TextStyle(
              fontSize: size,
              color: Colors.white,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ),
    );

Widget defaultTextField({
  required TextEditingController controller,
  required String? Function(String?)? validateFun,
  TextInputType keyboardType = TextInputType.text,
  VoidCallback? onSubmitFun,
  VoidCallback? onTapFun,
  VoidCallback? onChangedFun,
  required String hintText,
  Widget? prefixIcon,
  Widget? suffixIcon,
  double width = 300,
  int maxlines = 1,
  bool obscureText = false,
  bool readOnly = false,
  TextAlign textAlign = TextAlign.start,
  double fontSize = 16,
  String? initialvalue,
}) =>
    SizedBox(
      width: width,
      child: TextFormField(
        initialValue: initialvalue,
        textAlign: textAlign,
        maxLines: maxlines,
        readOnly: readOnly,
        onTap: onTapFun,
        obscureText: obscureText,
        controller: controller,
        keyboardType: keyboardType,
        validator: validateFun,
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          filled: true,
          fillColor: Colors.transparent,
          hintText: hintText,
          prefixIcon: prefixIcon,
          hintStyle: TextStyle(
            color: Colors.black,
            fontSize: fontSize,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        style: TextStyle(color: Colors.black, fontSize: fontSize),
      ),
    );

Widget timeButton({
  double size = 13,
  double width = 115,
  double height = 50,
  Color backgroundColor = const Color(0xFFE8E8E8),
  Color textColor = Colors.black,
  required VoidCallback onpressedfunction,
  required String title,
}) =>
    ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          )),
      child: Text(
        textAlign: TextAlign.center,
        title,
        style: TextStyle(
          fontSize: size,
          color: textColor,
          fontWeight: FontWeight.w800,
        ),
      ),
      onPressed: onpressedfunction,
    );
