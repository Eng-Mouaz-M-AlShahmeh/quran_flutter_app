/* Developed by: Eng. Mouaz M. Al-Shahmeh */
import 'package:flutter/material.dart';

class LoadingListView extends StatelessWidget {
  const LoadingListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: List.generate(
        20,
        (index) => Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          width: double.infinity,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.black.withOpacity(0.3),
          ),
        ),
      ),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
    );
  }
}
