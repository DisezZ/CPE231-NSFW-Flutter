import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  static UserController instance = Get.find();
  var userId = 0.obs;
  var positionId = 0.obs;
  var firstName = "".obs;

}
