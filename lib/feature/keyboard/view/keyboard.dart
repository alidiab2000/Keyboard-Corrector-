import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/cubit/keyboard_cubit.dart';
import 'widgets/keyboard_submit_view.dart';

class KeyboardBody extends StatelessWidget {
  const KeyboardBody({super.key});

  @override
  Widget build(BuildContext context) {
    final KeyboardCubit keyboardCubit = context.read<KeyboardCubit>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Keyboard'),
      ),
      body: KeyboardSubmit(
        keyboardCubit: keyboardCubit,
      ),
    );
  }
}
