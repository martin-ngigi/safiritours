import 'package:flutter/material.dart';

class FormInputView extends StatelessWidget {
  InputBorder border = InputBorder.none;
  TextEditingController controller;
  String hintText;
  String title;
  TextInputType? inputType;

  FormInputView(
      {required this.controller,
      required this.hintText,
      required this.title,
      this.inputType,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 5, bottom: 10),
            child: Text(
              title,
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(5, 0, 5, 0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.white, width: 0.5),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      offset: const Offset(0, 0),
                      color: Theme.of(context).highlightColor,
                      blurRadius: 2),
                  BoxShadow(
                      offset: const Offset(0, 1),
                      color: Theme.of(context).highlightColor,
                      blurRadius: 2),
                  BoxShadow(
                      offset: const Offset(1, 0),
                      color: Theme.of(context).highlightColor,
                      blurRadius: 2),
                  BoxShadow(
                      offset: const Offset(1, 1),
                      color: Theme.of(context).highlightColor,
                      blurRadius: 2),
                ]),
            child: TextFormField(
              keyboardType: inputType ?? TextInputType.text,
              controller: controller,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(left: 10),
                hintText: hintText,
                hintStyle: Theme.of(context)
                    .textTheme
                    .subtitle2!
                    .copyWith(color: Theme.of(context).hintColor),
                border: border,
                focusedErrorBorder: border,
                errorBorder: border,
                disabledBorder: border,
                enabledBorder: border,
                focusedBorder: border,
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Field Required';
                }
                return null;
              },
            ),
          ),
        ],
      ),
    );
  }
}

class RechargeInputView extends StatelessWidget {
  final InputBorder border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(color: Colors.black12));
  TextEditingController controller;
  String hintText;
  String title;
  String errorText;
  TextInputType? inputType;
  final EdgeInsetsGeometry? contentPadding;
  final EdgeInsetsGeometry? padding;
  final bool? enabled;
  bool? isValidator;
  ValueChanged<String>? onChanged;

  RechargeInputView(
      {required this.controller,
      required this.hintText,
      required this.title,
      required this.errorText,
      this.inputType,
      super.key,
      this.contentPadding,
      this.padding,
      this.enabled,
      this.onChanged,
      this.isValidator});

  @override
  Widget build(BuildContext context) {
    isValidator = isValidator ?? true;
    return Padding(
      padding: padding ?? const EdgeInsets.fromLTRB(30, 25, 30, 10),
      child: TextFormField(
        keyboardType: inputType ?? TextInputType.number,
        controller: controller,
        decoration: InputDecoration(
            contentPadding: contentPadding ??
                const EdgeInsets.only(left: 20, top: 0, bottom: 0),
            hintText: hintText,
            enabled: enabled ?? true,
            label: Padding(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: Text(
                title,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(),
              ),
            ),
            hintStyle: Theme.of(context).textTheme.titleSmall!.copyWith(),
            border: border,
            focusedErrorBorder: border,
            errorBorder: border,
            disabledBorder: border,
            enabledBorder: border,
            focusedBorder: border,
            counterText: ''),
        onChanged: onChanged,
        maxLines: 1,
        validator: (value) {
          if (isValidator!) {
            if (value!.isEmpty) {
              return errorText;
            }
          }
          return null;
        },
      ),
    );
  }
}
