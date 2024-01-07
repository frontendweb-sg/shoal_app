import 'package:flutter/material.dart';

class Menu {
  final int? id;
  final String? title;
  final Icon? icon;
  final String? subtitle;
  final Function(BuildContext context)? onPressed;
  final List<Menu>? childrens;
  Menu({
    this.id,
    this.title,
    this.subtitle,
    this.icon,
    this.onPressed,
    this.childrens,
  });
}
