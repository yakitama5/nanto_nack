import 'package:flutter/material.dart';
import 'package:quiz_core/quiz_core.dart';

enum QuizCategory {
  shopping,
  chat,
  streaming,
  map,
  alarm,
  payment,
  mail,
  news,
  calendar
  ;

  String get id => name;

  IconData get icon => switch (this) {
    shopping => Icons.shopping_cart_outlined,
    chat => Icons.chat_bubble_outline,
    streaming => Icons.play_circle_outline,
    map => Icons.map_outlined,
    alarm => Icons.alarm_outlined,
    payment => Icons.payment_outlined,
    mail => Icons.mail_outlined,
    news => Icons.newspaper_outlined,
    calendar => Icons.calendar_month_outlined,
  };

  bool get isComingSoon => false;

  String label(Translations t) => switch (this) {
    shopping => t.play.categoryLabel.shopping,
    chat => t.play.categoryLabel.chat,
    streaming => t.play.categoryLabel.streaming,
    map => t.play.categoryLabel.map,
    alarm => t.play.categoryLabel.alarm,
    payment => t.play.categoryLabel.payment,
    mail => t.play.categoryLabel.mail,
    news => t.play.categoryLabel.news,
    calendar => t.play.categoryLabel.calendar,
  };

  Color color(NantoNackThemeExtension ext) => switch (this) {
    shopping => ext.shoppingCategoryColor,
    chat => ext.chatCategoryColor,
    streaming => ext.streamingCategoryColor,
    map => ext.mapCategoryColor,
    alarm => ext.alarmCategoryColor,
    payment => ext.paymentCategoryColor,
    mail => ext.mailCategoryColor,
    news => ext.newsCategoryColor,
    calendar => ext.calendarCategoryColor,
  };

  Color containerColor(NantoNackThemeExtension ext) => switch (this) {
    shopping => ext.shoppingCategoryContainerColor,
    chat => ext.chatCategoryContainerColor,
    streaming => ext.streamingCategoryContainerColor,
    map => ext.mapCategoryContainerColor,
    alarm => ext.alarmCategoryContainerColor,
    payment => ext.paymentCategoryContainerColor,
    mail => ext.mailCategoryContainerColor,
    news => ext.newsCategoryContainerColor,
    calendar => ext.calendarCategoryContainerColor,
  };

  static QuizCategory fromId(String id) => QuizCategory.values.firstWhere(
    (e) => e.id == id,
    orElse: () => QuizCategory.shopping,
  );
}
