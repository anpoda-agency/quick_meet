import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quick_meet/features/core_widgets/svg_image.dart';

class AuthTextFormField extends StatefulWidget {
  const AuthTextFormField({
    Key? key,
    this.suffixIcon,
    this.onTapSuffixIcon,
    this.validator,
    this.maxLines,
    this.textAlign,
    this.minLines,
    this.textCapitalization = TextCapitalization.sentences,
    this.controller,
    this.onChanged,
    this.keyboardType,
    this.textAlignVertical,
    this.style,
    this.focusNode,
    this.hintText,
    this.hintStyle,
    this.autofocus,
    this.enabled = true,
    this.inputFormatters,
    this.contentPadding,
    this.isErrorState = false,
    this.onEditingComplete,
    this.errorText,
    this.borderRadius,
    this.decoration,
    this.borderColors,
    this.readOnly,
    this.onTap,
    this.border,
    this.icon,
    this.focusBorder,
    this.height = 55,
    this.label,
    this.expands = false,
    this.onFieldSubmitted,
    this.enableInteractiveSelection,
    this.onTapOutside,
  }) : super(key: key);
  final Widget? suffixIcon;
  final void Function()? onTapSuffixIcon;
  final void Function()? onEditingComplete;
  final bool enabled;
  final bool? readOnly;
  final String? Function(String?)? validator;
  final int? maxLines;
  final int? minLines;
  final void Function()? onTap;
  final TextCapitalization textCapitalization;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final void Function(PointerDownEvent)? onTapOutside;
  final TextInputType? keyboardType;
  final TextAlignVertical? textAlignVertical;
  final TextStyle? style;
  final String? hintText;
  final TextStyle? hintStyle;
  final List<TextInputFormatter>? inputFormatters;
  final bool isErrorState;
  final String? errorText;
  final FocusNode? focusNode;
  final InputDecoration? decoration;
  final TextAlign? textAlign;
  final bool? autofocus;
  final double? borderRadius;
  final InputBorder? focusBorder;
  final EdgeInsetsGeometry? contentPadding;
  final Color? borderColors;
  final BoxBorder? border;
  final Widget? icon;
  final double height;
  final bool expands;
  final void Function(String)? onFieldSubmitted;
  final bool? enableInteractiveSelection;
  final String? label;

  @override
  State<AuthTextFormField> createState() => _AuthTextFormFieldState();
}

class _AuthTextFormFieldState extends State<AuthTextFormField> {
  bool isFocus = false;
  bool isContainsValue = false;

  @override
  void initState() {
    widget.focusNode?.addListener(() {
      mounted
          ? setState(() {
              isFocus = !isFocus;
            })
          : null;
    });
    widget.controller?.addListener(() {
      mounted
          ? setState(() {
              widget.controller!.text.isNotEmpty ? isContainsValue = true : isContainsValue = false;
            })
          : null;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 60,
          child: TextFormField(
            onTapOutside: widget.onTapOutside,
            enableInteractiveSelection: widget.enableInteractiveSelection,
            expands: widget.expands,
            autofocus: widget.autofocus ?? false,
            focusNode: widget.focusNode,
            onEditingComplete: widget.onEditingComplete,
            inputFormatters: widget.inputFormatters,
            enabled: widget.enabled,
            validator: widget.validator,
            textCapitalization: widget.textCapitalization,
            maxLines: widget.maxLines,
            minLines: widget.minLines,
            cursorColor: Colors.white.withOpacity(0.2),
            cursorWidth: 1,
            controller: widget.controller,
            onChanged: (value) {
              widget.onChanged?.call(value);
            },
            keyboardType: widget.keyboardType,
            textAlign: widget.textAlign ?? TextAlign.start,
            textAlignVertical: widget.textAlignVertical ?? TextAlignVertical.bottom,
            style: widget.style ?? Theme.of(context).primaryTextTheme.titleSmall,
            decoration: (widget.decoration != null) ? widget.decoration : customInputDecoration(context),
          ),
        ),
        widget.errorText != null && widget.isErrorState
            ? Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                  decoration:
                      const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Text(
                    widget.errorText ?? '',
                    style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Color(0xFFEF37A5)),
                  ),
                ),
              )
            : const SizedBox(
                height: 27,
              ),
      ],
    );
  }

  InputDecoration customInputDecoration(BuildContext context) {
    return InputDecoration(
      suffixIcon: (widget.suffixIcon != null)
          ? IconButton(
              highlightColor: Colors.transparent,
              onPressed: widget.onTapSuffixIcon,
              icon: widget.suffixIcon ?? const SizedBox.shrink())
          : null,
      labelText: widget.label,
      labelStyle: widget.focusNode != null && widget.controller != null
          ? isFocus
              ? TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 18, fontWeight: FontWeight.w400)
              : isContainsValue
                  ? TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 18, fontWeight: FontWeight.w400)
                  : const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w400)
          : const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w400),
      focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white.withOpacity(0.3), width: 2)),
      border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white.withOpacity(0.3), width: 2)),
      errorBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white.withOpacity(0.3), width: 2)),
      enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white.withOpacity(0.3), width: 2)),
      contentPadding: const EdgeInsets.symmetric(vertical: 12),
    );
  }
}

class AuthTextFormFieldPassword extends StatefulWidget {
  const AuthTextFormFieldPassword({
    Key? key,
    this.obscureText = false,
    this.suffixIcon,
    this.onTapSuffixIcon,
    this.validator,
    this.focusNode,
    this.maxLines,
    this.minLines,
    this.textCapitalization = TextCapitalization.sentences,
    required this.controller,
    this.onChanged,
    this.keyboardType,
    this.textAlignVertical,
    this.style,
    this.hintText,
    this.hintStyle,
    this.enabled = true,
    this.inputFormatters,
    this.isErrorState = false,
    this.height = 70,
    this.errorText,
    this.label,
    this.contentPadding,
  }) : super(key: key);
  final bool obscureText;
  final Widget? suffixIcon;
  final void Function()? onTapSuffixIcon;
  final bool enabled;
  final String? Function(String?)? validator;
  final int? maxLines;
  final int? minLines;
  final String? errorText;
  final FocusNode? focusNode;
  final TextCapitalization textCapitalization;
  final TextEditingController controller;
  final void Function(String)? onChanged;
  final TextInputType? keyboardType;
  final TextAlignVertical? textAlignVertical;
  final TextStyle? style;
  final String? hintText;
  final TextStyle? hintStyle;
  final List<TextInputFormatter>? inputFormatters;
  final bool isErrorState;
  final double height;
  final EdgeInsetsGeometry? contentPadding;
  final String? label;

  @override
  State<AuthTextFormFieldPassword> createState() => _AuthTextFormFieldPasswordState();
}

class _AuthTextFormFieldPasswordState extends State<AuthTextFormFieldPassword> {
  bool isFocus = false;
  bool isContainsValue = false;
  bool isVisible = true;

  @override
  void initState() {
    widget.focusNode?.addListener(() {
      mounted
          ? setState(() {
              isFocus = !isFocus;
            })
          : null;
    });
    widget.controller.addListener(() {
      mounted
          ? setState(() {
              widget.controller.text.isNotEmpty ? isContainsValue = true : isContainsValue = false;
            })
          : null;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 60,
          child: TextFormField(
            focusNode: widget.focusNode,
            obscureText: isVisible,
            inputFormatters: widget.inputFormatters,
            enabled: widget.enabled,
            validator: widget.validator,
            textCapitalization: widget.textCapitalization,
            maxLines: widget.maxLines,
            minLines: widget.minLines,
            cursorColor: Theme.of(context).primaryColorLight.withOpacity(0.2),
            cursorWidth: 1,
            controller: widget.controller,
            onChanged: widget.onChanged,
            keyboardType: widget.keyboardType,
            textAlignVertical: widget.textAlignVertical ?? TextAlignVertical.bottom,
            style: widget.style ?? Theme.of(context).primaryTextTheme.titleSmall,
            decoration: customInputDecoration(context, widget.isErrorState),
          ),
        ),
        widget.errorText != null && widget.isErrorState
            ? Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                  decoration:
                      const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Text(
                    widget.errorText ?? '',
                    style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Color(0xFFEF37A5)),
                  ),
                ),
              )
            : const SizedBox(
                height: 27,
              ),
      ],
    );
  }

  InputDecoration customInputDecoration(BuildContext context, bool isErrorState) {
    return InputDecoration(
      hintText: widget.hintText,
      suffixIcon: IconButton(
        onPressed: () => setState(() {
          isVisible = !isVisible;
        }),
        icon: widget.suffixIcon ??
            ((!isVisible)
                ? const CustomSvgImageAsset(image: 'password_visible_icon.svg')
                : const CustomSvgImageAsset(image: 'password_invisible_icon.svg')),
      ),
      labelText: widget.label,
      labelStyle: widget.focusNode != null
          ? isFocus
              ? TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 18, fontWeight: FontWeight.w400)
              : isContainsValue
                  ? TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 18, fontWeight: FontWeight.w400)
                  : const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w400)
          : const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w400),
      focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white.withOpacity(0.3), width: 2)),
      border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white.withOpacity(0.3), width: 2)),
      errorBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white.withOpacity(0.3), width: 2)),
      enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white.withOpacity(0.3), width: 2)),
      contentPadding: const EdgeInsets.symmetric(vertical: 12),
    );
  }
}
