import 'dart:developer';

import 'package:flutter/material.dart';

class DataTile extends StatelessWidget {
  final Widget child;
  final Function() onTap;

  const DataTile(
    this.child, {
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 14.0,
      borderRadius: BorderRadius.circular(12.0),
      shadowColor: const Color(0x802196F3),
      child: InkWell(
        onTap: onTap != null
            ? () => onTap()
            : () {
                log('Not set yet');
              },
        child: child,
      ),
    );
  }
}
