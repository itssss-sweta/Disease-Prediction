import 'package:dis_pred/core/constants/colors.dart';
import 'package:dis_pred/core/constants/sizedbox.dart';
import 'package:flutter/material.dart';

class TextContainer extends StatefulWidget {
  final TextEditingController? controller;
  final IconData? icon;
  final String? hintText;
  final bool? suffix;
  final TextInputType? type;
  final bool? obscureText;
  const TextContainer({
    super.key,
    this.controller,
    this.icon,
    this.hintText,
    this.suffix,
    this.type,
    this.obscureText,
  });

  @override
  State<TextContainer> createState() => _TextContainerState();
}

class _TextContainerState extends State<TextContainer> {
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
              obscureText: widget.obscureText ?? false,
              decoration: InputDecoration(
                hintText: widget.hintText,
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 10),
                  child: Icon(widget.icon),
                ),
                filled: true,
                suffixIcon: (widget.suffix != null && widget.suffix == true)
                    ? IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.visibility_off_outlined))
                    : null,
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(
                    color: lGrey,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(
                    color: lGrey,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(
                    color: Colors.blue.shade700,
                  ),
                ),
              )),
          sHeight,
        ],
      ),
    );
  }
}
