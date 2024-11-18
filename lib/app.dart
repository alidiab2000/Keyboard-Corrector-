import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keyboard/feature/keyboard/view/keyboard.dart';

import 'feature/keyboard/data/cubit/keyboard_cubit.dart';

class KeyboardWrongInput extends StatelessWidget {
  const KeyboardWrongInput({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => KeyboardCubit(),
        child: const KeyboardBody(),
      ),
    );
  }
}
