import 'package:flunt_dart/flunt_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum ErrorFormatType { onlyPropertyName, onlyMessage, both }

class Formatter {
  final ErrorFormatType errorFormatType;
  final Contract contract;
  final String Function(String propery, String message) formater;

  Formatter(
      {this.errorFormatType = ErrorFormatType.both,
      this.contract,
      this.formater});
  _formatByTpe(ErrorFormatType type, String name, String message) {
    switch (type) {
      case ErrorFormatType.onlyPropertyName:
        return "$name";
      case ErrorFormatType.onlyMessage:
        return "$message";
      case ErrorFormatType.both:
        return "$name $message";
    }
    return "$name $message";
  }

  String formattedMessage() {
    if (contract.invalid) {
      var propery = contract.notifications.first.property;
      var message = contract.notifications.first.message;
      if (formater == null) {
        return _formatByTpe(errorFormatType, propery, message);
      } else {
        return formater(propery, message);
      }
    }
    return null;
  }
}

class FluntTextFormField extends TextFormField {
  final ErrorFormatType errorFormatType;

  static String _formatByTpe(
      ErrorFormatType type, String name, String message) {
    switch (type) {
      case ErrorFormatType.onlyPropertyName:
        return "$name";
      case ErrorFormatType.onlyMessage:
        return "$message";
      case ErrorFormatType.both:
        return "$name $message";
    }
    return "$name $message";
  }

  FluntTextFormField({
    Key key,
    this.errorFormatType = ErrorFormatType.both,
    @required Contract Function(String value) contract,
    String Function(String propery, String message) errorFormat,
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
  })  : assert(contract != null),
        super(
            key: key,
            validator: (value) {
              var formatter = Formatter(
                  contract: contract(value),
                  errorFormatType: errorFormatType,
                  formater: errorFormat);

              return formatter.formattedMessage();
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
