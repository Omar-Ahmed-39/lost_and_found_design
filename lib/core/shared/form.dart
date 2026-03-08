
import 'package:flutter/material.dart';
import 'package:lostandfound/core/theme/app_theme.dart';

class Mybutton extends StatelessWidget {
  final void Function()? onTap;
 final String text;
 final Color? color;
  const Mybutton({super.key, this.onTap, required this.text, this.color});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
              height: 60,
              shape:RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(14)),
              color:color?? MyAppColor.primarybutton,
                onPressed:onTap,
                child:  Text(
                      text,
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                      ),
                    ),
                  );
                
  }
}
class MyInputField extends StatelessWidget {
  final String hint;
  final bool isMultiline;
  final int? maxLines;
  final bool obscure;
  final bool ispassword;
  final String title;
  final TextEditingController? controller;
  final String? Function(String?)? val;
  final void Function()? onTap;




  const MyInputField({
    this.isMultiline = false,
    this.maxLines,
    required this.hint,
     this.obscure=false , required this.title, this.val, this.controller, this.ispassword=false, this.onTap,
  });

  @override
Widget build(BuildContext context) {
  final bool canBeMultiline = isMultiline && !obscure; // ✅ ممنوع multiline لو obscure true
  final int? effectiveMaxLines = canBeMultiline ? (maxLines ?? 5) : 1;

  return Column(
    children: [
      Align(
        alignment: Alignment.centerRight,
        child: Text(
          title,
          textAlign: TextAlign.right,
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      const SizedBox(height: 10),
      TextFormField(
        controller: controller,
        validator: val,
        obscureText: obscure,
        textAlign: TextAlign.right,

        // ✅ هنا الحل
        maxLines: effectiveMaxLines,

        decoration: InputDecoration(
          prefixIcon: ispassword
              ? IconButton(
                  icon: Icon(
                    obscure ? Icons.visibility_off : Icons.visibility,
                    color: Colors.grey,
                  ),
                  onPressed: onTap,
                )
              : null,
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.grey),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 18,
            vertical: 15,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: const BorderSide(
              color: Color(0xFFBDBDBD),
              width: 1.2,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: const BorderSide(
              color: Colors.red,
              width: 1.2,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: const BorderSide(
              color: Colors.red,
              width: 1.2,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide(
              color: MyAppColor.primarybutton,
              width: 1.2,
            ),
          ),
        ),
      ),
    ],
  );
}
}
class MySubtitleSgin extends StatelessWidget {
 final void Function()? onTap;
 final String underlinetext;
 final String text;
  const MySubtitleSgin({super.key, this.onTap, required this.underlinetext, required this.text});

  @override
  Widget build(BuildContext context) {
    return 
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: onTap,
                    child:  Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                      child: Text(
                        underlinetext,
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                ),
                 Text(
                text,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                  ),
                ),
              ],
            );
  }
}
class MyInputFieldwithdetails extends StatelessWidget {
  final String hint;
  final bool obscure;
  final String title;
  final String  details;


  const MyInputFieldwithdetails({
    required this.hint,
    this.obscure = false, required this.title, required this.details,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
        alignment: Alignment.centerRight,

          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                        details,
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey
                        ),
                      ),

                  Text(
                        title,
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          
                        ),
                      ),     
            ],
          ),
        ),
                 const SizedBox(height: 10),
        TextField(
          obscureText: obscure,
          textAlign: TextAlign.right,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: Colors.grey),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 18,
              vertical: 15,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: const BorderSide(
                color: Color(0xFFBDBDBD),
                width: 1.2,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: const BorderSide(
                color: Color(0xFF9E9E9E),
                width: 1.2,
              ),
            ),
          ),
        ),
         
      ],
    );
  }
}