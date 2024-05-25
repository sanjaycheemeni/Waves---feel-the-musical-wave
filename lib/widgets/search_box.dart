import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SearchBox extends StatelessWidget {
  const SearchBox(
      {super.key,
      required this.onTextChanged,
      required this.ScreenDimension,
      required this.hint});

  final Function(String) onTextChanged;
  final String hint;
  final ScreenDimension;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 010, right: 10, top: 20),
      child: TextField(
        onChanged: onTextChanged,
        // keyboardType: hintText == "Mobile Number"
        //     ? TextInputType.phone
        //     : TextInputType.name,
        // controller: controller,
        // obscureText: obscureText,

        decoration: InputDecoration(
          hintText: 'Search...',
          hintStyle: TextStyle(color: Colors.grey.shade500),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              color: Color(0xFFE7E6E6),
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent
                // color: Color(0xFFE7E6E6),
                ),
          ),
          // fillColor: Color(0xFFE7E6E6),
          filled: true,
        ),
      ),
    );
  }
}
