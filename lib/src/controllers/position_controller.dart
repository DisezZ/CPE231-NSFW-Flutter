import 'package:cpe231_nsfw_flutter/src/models/position.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PositionController extends GetxController {
  static PositionController instance = Get.find();
  final _items = [
    Position(positionId: 1, positionName: 'Manager'),
    Position(positionId: 2, positionName: 'Employee'),
    Position(positionId: 3, positionName: 'Customer')
  ];

  get items => _items;

  findPositionById(int id) =>
      _items.firstWhere((element) => element.positionId == id);
}
