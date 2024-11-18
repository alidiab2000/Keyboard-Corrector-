import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/cubit/keyboard_cubit.dart';
import 'show_convert_view.dart';

class KeyboardSubmit extends StatelessWidget {
  const KeyboardSubmit({
    super.key,
    required this.keyboardCubit,
  });

  final KeyboardCubit keyboardCubit;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: keyboardCubit.formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: Column(
            children: [
              //Space
              const SizedBox(
                height: 50,
              ),
              //Text field to get the contents of the keyboard
              TextFormField(
                controller: keyboardCubit.textEditingController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                maxLines: 10,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                onTapOutside: (event) {
                  FocusManager.instance.primaryFocus!.unfocus();
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter text',
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue,
                      width: 2.0,
                    ),
                  ),
                ),
              ),
              //Space
              const SizedBox(
                height: 50,
              ),
              // Button to convert the text form ar to en or vice versa
              SizedBox(
                height: 50,
                width: double.infinity,
                child: BlocListener<KeyboardCubit, KeyboardState>(
                  listener: (context, state) {
                    if (state is KeyboardError) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          behavior: SnackBarBehavior.floating,
                          backgroundColor: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          content: SizedBox(
                            height: 30,
                            child: Text(
                              'Please enter some text',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      );
                    } else if (state is KeyboardSuccess) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ShowConvert(
                            message: state.message,
                            keyboardCubit: keyboardCubit,
                          ),
                        ),
                      );
                    }
                  },
                  child: ElevatedButton(
                    onPressed: keyboardCubit.onSubmit,
                    child: const Text(
                      "Convert",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              // Test widget to show the content the had been converted
            ],
          ),
        ),
      ),
    );
  }
}
/*

BlocListener<KeyboardCubit, KeyboardState>(
          listener: (context, state) {
            if (state is KeyboardError) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  content: SizedBox(
                    height: 30,
                    child: Text(
                      'Please enter some text',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              );
            }
          },
*/ 