import 'package:flutter/material.dart';

class DialogWidget {
  final BuildContext context;
  final String? message;
  final String? title;

  DialogWidget({required this.context, this.message, this.title});

  void errorDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Row(
            children: [
              Icon(Icons.error,color: Colors.red,),
              SizedBox(width: 15,),
              Text('$title'),
            ],
          ),
          content: Text(message!),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'))
          ],
        );
      },
    );
  }
}
