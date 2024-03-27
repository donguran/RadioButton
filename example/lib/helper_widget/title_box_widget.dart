import 'package:flutter/material.dart';

class TitleBoxWidget extends StatelessWidget {
  const TitleBoxWidget(this.title, {
    super.key,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(border: Border.all(color: Colors.black)),
      child: Text(title,
        style: const TextStyle(fontSize: 21.0),
        textAlign: TextAlign.center,
      ),
    );
  }
}
