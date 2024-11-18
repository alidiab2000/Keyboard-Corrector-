import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants.dart';

part 'keyboard_state.dart';

class KeyboardCubit extends Cubit<KeyboardState> {
  KeyboardCubit() : super(KeyboardInitial());
  TextEditingController textEditingController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  void onSubmit() {
    if (formKey.currentState!.validate()) {
      emit(KeyboardSuccess(
        message: convertToARorEN(
          textEditingController.text.trim(),
        ),
      ));
    } else {
      emit(KeyboardError());
    }
  }

  String convertToARorEN(String message) {
    StringBuffer convertedMessage = StringBuffer();

    if (englishToArabicKeyMap.containsKey(message[0])) {
      for (int i = 0; i < message.length; i++) {
        String char = message[i];
        if (char == " ") {
         
          convertedMessage.write(" ");
        } else {
          convertedMessage.write(englishToArabicKeyMap[char.toLowerCase()]!);
        }
      }
    } else {
      for (int i = 0; i < message.length; i++) {
        String char = message[i];
        String? nextChar = i + 1 < message.length ? message[i + 1] : null;

        if (char == " ") {
          convertedMessage.write(" ");
        } else if (nextChar != null && char + nextChar == "لا") {
          convertedMessage.write("b");
          i += 1;
        } else {
          convertedMessage.write(arabicToEnglishKeyMap[char.toLowerCase()]!);
        }
      }
    }

    return convertedMessage.toString();
  }
}
