import 'package:google_fonts/google_fonts.dart';
import 'package:payapp/helper/responsive_helper.dart';
import 'package:payapp/util/dimensions.dart';
import 'package:payapp/util/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../themes/colors.dart';

class CustomAuthTextField extends StatefulWidget {
  final String titleText;
  final String hintText;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final FocusNode? nextFocus;
  final TextInputType inputType;
  final TextInputAction inputAction;
  final bool isPassword;
  final Function? onChanged;
  final Function? onSubmit;
  final bool isEnabled;
  final int maxLines;
  final TextCapitalization capitalization;
  final String? prefixImage;
  final IconData? prefixIcon;
  final double prefixSize;
  final TextAlign textAlign;
  final bool isAmount;
  final bool isNumber;
  final bool showTitle;
  final bool showBorder;
  final double iconSize;
  final bool isPhone;
  final String? countryDialCode;
  final Widget? suffixIcon;
  // final Function(CountryCode countryCode)? onCountryChanged;

  const CustomAuthTextField({
    super.key,
    this.titleText = 'Write something...',
    this.hintText = '',
    this.controller,
    this.focusNode,
    this.nextFocus,
    this.isEnabled = true,
    this.inputType = TextInputType.text,
    this.inputAction = TextInputAction.next,
    this.maxLines = 1,
    this.onSubmit,
    this.onChanged,
    this.prefixImage,
    this.prefixIcon,
    this.suffixIcon,
    this.capitalization = TextCapitalization.none,
    this.isPassword = false,
    this.prefixSize = Dimensions.paddingSizeSmall,
    this.textAlign = TextAlign.start,
    this.isAmount = false,
    this.isNumber = false,
    this.showTitle = false,
    this.showBorder = true,
    this.iconSize = 18,
    this.isPhone = false,
    this.countryDialCode,
    // this.onCountryChanged,
  });

  @override
  CustomAuthTextFieldState createState() => CustomAuthTextFieldState();
}

class CustomAuthTextFieldState extends State<CustomAuthTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.showTitle
            ? Text(widget.titleText,
                style:
                    robotoRegular.copyWith(fontSize: Dimensions.fontSizeSmall))
            : const SizedBox(),
        SizedBox(
            height: widget.showTitle
                ? ResponsiveHelper.isDesktop(context)
                    ? Dimensions.paddingSizeDefault
                    : Dimensions.paddingSizeExtraSmall
                : 0),
        TextField(
          maxLines: widget.maxLines,
          controller: widget.controller,
          focusNode: widget.focusNode,
          textAlign: widget.textAlign,
          style: robotoRegular.copyWith(fontSize: Dimensions.fontSizeLarge),
          textInputAction: widget.inputAction,
          keyboardType:
              widget.isAmount ? TextInputType.number : widget.inputType,
          cursorColor: Theme.of(context).primaryColor,
          textCapitalization: widget.capitalization,
          enabled: widget.isEnabled,
          autofocus: false,
          obscureText: widget.isPassword ? _obscureText : false,
          inputFormatters: widget.inputType == TextInputType.phone
              ? <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp('[0-9]'))
                ]
              : widget.isAmount
                  ? [FilteringTextInputFormatter.allow(RegExp(r'\d'))]
                  : widget.isNumber
                      ? [FilteringTextInputFormatter.allow(RegExp(r'\d'))]
                      : null,
          decoration: InputDecoration(
            isDense: true,
            suffixIcon: widget.isPassword
                ? IconButton(
                    onPressed: _toggle,
                    icon: Icon(
                        _obscureText ? Icons.visibility : Icons.visibility_off))
                : SizedBox(),
            prefixIcon: Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(widget.prefixIcon,
                  size: 20, color: ThemeColors.primaryBlueColor),
            ),
            filled: true,
            fillColor: Colors.white,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            hintText: widget.hintText,
            hintStyle: GoogleFonts.ubuntu(
                fontWeight: FontWeight.w500, letterSpacing: 2),
            errorStyle: GoogleFonts.ubuntu(),
            enabledBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: Colors.grey.withOpacity(0.2)),
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: ThemeColors.primaryBlueColor),
            ),
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            errorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
          ),
          onSubmitted: (text) => widget.nextFocus != null
              ? FocusScope.of(context).requestFocus(widget.nextFocus)
              : widget.onSubmit != null
                  ? widget.onSubmit!(text)
                  : null,
          onChanged: widget.onChanged as void Function(String)?,
        ),
      ],
    );
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
}
