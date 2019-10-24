import 'package:flunt_dart/flunt_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FluntTextFormField extends TextFormField {
  FluntTextFormField({
    Key key,
    final Contract Function(String value) contract,
    String Function(String propery, String message) format,
    int quant,
    TextEditingController controller,
    String initialValue,
    FocusNode focusNode,
    InputDecoration decoration = const InputDecoration(),
    TextInputType keyboardType,
    TextCapitalization textCapitalization = TextCapitalization.none,
    TextInputAction textInputAction,
    TextStyle style,
    StrutStyle strutStyle,
    TextDirection textDirection,
    TextAlign textAlign = TextAlign.start,
    bool autofocus = false,
    bool readOnly = false,
    ToolbarOptions toolbarOptions,
    bool showCursor,
    bool obscureText = false,
    bool autocorrect = true,
    bool autovalidate = false,
    bool maxLengthEnforced = true,
    int maxLines = 1,
    int minLines,
    bool expands = false,
    int maxLength,
    ValueChanged<String> onChanged,
    GestureTapCallback onTap,
    VoidCallback onEditingComplete,
    ValueChanged<String> onFieldSubmitted,
    FormFieldSetter<String> onSaved,
    List<TextInputFormatter> inputFormatters,
    bool enabled = true,
    double cursorWidth = 2.0,
    Radius cursorRadius,
    Color cursorColor,
    Brightness keyboardAppearance,
    EdgeInsets scrollPadding = const EdgeInsets.all(20.0),
    bool enableInteractiveSelection = true,
    InputCounterWidgetBuilder buildCounter,
  }) : super(
            key: key,
            validator: (value) {
              var contractT = contract(value);
              if (contractT.invalid) {
                var propery = contractT.notifications.first.property;
                var message = contractT.notifications.first.message;
                if (format == null) {
                  return "$propery $message";
                } else {
                  return format(propery, message);
                }
              }
              return null;
            },
            controller: controller,
            initialValue: initialValue,
            focusNode: focusNode,
            decoration: decoration,
            keyboardType: keyboardType,
            textCapitalization: textCapitalization,
            style: style,
            strutStyle: strutStyle,
            textDirection: textDirection,
            autofocus: autofocus,
            readOnly: readOnly,
            toolbarOptions: toolbarOptions,
            showCursor: showCursor,
            obscureText: obscureText,
            autocorrect: autocorrect,
            autovalidate: autovalidate,
            maxLines: maxLines,
            minLines: minLines,
            expands: expands,
            maxLength: maxLength,
            onChanged: onChanged,
            onTap: onTap,
            onEditingComplete: onEditingComplete,
            onFieldSubmitted: onFieldSubmitted,
            onSaved: onSaved,
            inputFormatters: inputFormatters,
            enabled: enabled,
            cursorWidth: cursorWidth,
            cursorRadius: cursorRadius,
            cursorColor: cursorColor,
            keyboardAppearance: keyboardAppearance,
            scrollPadding: scrollPadding,
            enableInteractiveSelection: enableInteractiveSelection,
            buildCounter: buildCounter);
}
