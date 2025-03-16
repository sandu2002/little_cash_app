import 'package:flutter/material.dart' show Widget;

class Categories {
  final String title;
  final Widget icon;
  Categories(this.title, this.icon);
}

class Promo {
  final String title;
  final String link;
  final String image;

  Promo(this.title, this.link, this.image);

}

class UserActivity {
  final String activity;
  final DateTime date;

  UserActivity(this.activity, this.date);
}