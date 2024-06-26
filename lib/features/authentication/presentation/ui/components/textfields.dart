import 'package:dis_pred/core/constants/colors.dart';
import 'package:dis_pred/core/constants/sizedbox.dart';
import 'package:flutter/material.dart';

class BaseTextFieldWidget extends StatefulWidget {
  final TextEditingController? controller;
  final IconData? icon;
  final String? hintText;
  final bool? suffix;
  final TextInputType? type;
  final bool? obscureText;
  final String? Function(String?)? validator;
  const BaseTextFieldWidget({
    super.key,
    this.controller,
    this.icon,
    this.hintText,
    this.suffix,
    this.type,
    this.obscureText,
    this.validator,
  });

  @override
  State<BaseTextFieldWidget> createState() => _BaseTextFieldWidgetState();
}

class _BaseTextFieldWidgetState extends State<BaseTextFieldWidget> {
  bool showPassword = false;

  void showOrHidePassword() {
    setState(() {
      showPassword = !showPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // padding: equalpadding,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TextFormField(
              maxLines: 1,
              controller: widget.controller,
              keyboardType: widget.type,
              obscureText: (widget.obscureText != null)
                  ? (showPassword)
                      ? widget.obscureText == false
                      : widget.obscureText == true
                  : false,
              validator: widget.validator,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: InputDecoration(
                hintText: widget.hintText,
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 10),
                  child: Icon(widget.icon),
                ),
                filled: true,
                suffixIcon: (widget.suffix != null && widget.suffix == true)
                    ? (showPassword)
                        ? IconButton(
                            onPressed: () {
                              showOrHidePassword();
                            },
                            icon: const Icon(Icons.visibility_outlined))
                        : IconButton(
                            onPressed: () {
                              showOrHidePassword();
                            },
                            icon: const Icon(Icons.visibility_off_outlined))
                    : null,
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(
                    color: ColorPalate.lightGrey,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(
                    color: ColorPalate.lightGrey,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(
                    color: Colors.blue.shade700,
                  ),
                ),
              )),
          SizedBoxHeightAndWidth.sizedBoxHeight15,
        ],
      ),
    );
  }
}
