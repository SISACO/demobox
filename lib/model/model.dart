import 'package:flutter/material.dart';

class NewPost {
  final int id;
  final List img;
  final String slogan;
  final double linear;
  final String gefund;
  final String refund;
  final String perc;
  final String des;
  NewPost(
      {required this.id,
      required this.img,
      required this.slogan,
      required this.linear,
      required this.gefund,
      required this.refund,
      required this.perc,
      required this.des});
}

class Filters {
  final int id;
  final Icon idol;
  final String t1;

  Filters({required this.id, required this.idol, required this.t1});
}

class DtAmount {
  final String Amount;
  DtAmount({required this.Amount});
}

