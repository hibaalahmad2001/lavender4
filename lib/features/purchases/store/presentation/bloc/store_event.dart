



import 'package:flutter/material.dart';

import '../ui/store_page.dart';

@immutable
abstract class StoreEvent {}

class AddProductEvent extends StoreEvent {
  final Product newProduct;

  AddProductEvent(this.newProduct);
}

