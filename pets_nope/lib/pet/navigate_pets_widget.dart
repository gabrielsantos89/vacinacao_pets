import 'package:flutter/material.dart';

class NavigatPetsWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClickedPrevious;
  final VoidCallback onClickedNext;

  const NavigatPetsWidget({
    Key? key,
    required this.text,
    required this.onClickedPrevious,
    required this.onClickedNext,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      IconButton(
        iconSize: 48,
        icon: Icon(Icons.navigate_before),
        onPressed: onClickedPrevious,
      ),
      Text(
        text,
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
      ),
      IconButton(
        iconSize: 48,
        icon: Icon(Icons.navigate_next),
        onPressed: onClickedNext,
      ),
    ],
  );
}
