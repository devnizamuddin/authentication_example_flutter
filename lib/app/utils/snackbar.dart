import 'package:flutter/material.dart';
import 'package:get/get.dart';

helloSnack(String title, String msg) => Get.snackbar(
      title,
      msg,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      margin: const EdgeInsets.all(20),
      snackStyle: SnackStyle.FLOATING,
      titleText: Text(title,
          style: const TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
      messageText:
          Text(msg, style: const TextStyle(color: Colors.white, fontSize: 14)),
    );

errorSnack(String msg) => Get.snackbar(
      'ERROR',
      msg,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(20),
      backgroundColor: Colors.red,
      snackStyle: SnackStyle.FLOATING,
      icon: const Icon(Icons.error, color: Colors.white),
      titleText: const Text('ERROR',
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
      messageText:
          Text(msg, style: const TextStyle(color: Colors.white, fontSize: 14)),
    );

alertSnack(String msg) => Get.snackbar(
      'ALERT',
      msg,
      margin: const EdgeInsets.all(20),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.yellow,
      snackStyle: SnackStyle.FLOATING,
      icon: const Icon(Icons.alarm, color: Colors.black),
      titleText: const Text('ALERT',
          style: TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold)),
      messageText:
          Text(msg, style: const TextStyle(color: Colors.black, fontSize: 14)),
    );

successSnack(String msg) => Get.snackbar(
      'SUCCESS',
      msg,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(20),
      backgroundColor: Colors.green,
      snackStyle: SnackStyle.FLOATING,
      icon: const Icon(Icons.check, color: Colors.white),
      titleText: const Text('SUCCESS',
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
      messageText:
          Text(msg, style: const TextStyle(color: Colors.white, fontSize: 14)),
    );
