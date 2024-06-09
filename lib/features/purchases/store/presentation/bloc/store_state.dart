import 'package:flutter/material.dart';

@immutable
abstract class StoreState {}

class StoreInitialState extends StoreState {
  final List<String> productTypes;

  StoreInitialState({required this.productTypes});
}
