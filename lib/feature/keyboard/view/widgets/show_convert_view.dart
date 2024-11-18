// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../data/cubit/keyboard_cubit.dart';

class ShowConvert extends StatelessWidget {
  const ShowConvert({
    super.key,
    required this.keyboardCubit,
    required this.message,
  });

  final KeyboardCubit keyboardCubit;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Keyboard'),
      ),
      body: SafeArea(
        child: Center(
          child: SizedBox(
            width: min(MediaQuery.of(context).size.width, 500),
            height: min(MediaQuery.of(context).size.height, 2532),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Original message:\n ${keyboardCubit.textEditingController.text.trim()}",
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const Divider(
                      color: Colors.black,
                      thickness: 2,
                      height: 20,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Converted message:\n $message",
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    //Copy Icon Button
                    IconButton(
                      onPressed: () {
                        ClipboardData data = ClipboardData(text: message);
                        Clipboard.setData(data);
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          behavior: SnackBarBehavior.floating,
                          backgroundColor: Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          content: Text(
                            'Copied to clipboard',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ));
                      },
                      icon: const Icon(Icons.copy),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          keyboardCubit.textEditingController.clear();
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "Reconvert",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
