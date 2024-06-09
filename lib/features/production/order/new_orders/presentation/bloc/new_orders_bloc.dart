import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../ui/new_order.dart';

part 'new_orders_event.dart';
part 'new_orders_state.dart';

class NewOrdersBloc extends Bloc<NewOrdersEvent, NewOrdersState> {

  NewOrdersBloc() : super(NewOrdersInitial()) {
    on<NewOrdersEvent>((event, emit) {
      if(event is EditDateEvent){

      }else if(event is AcceptAOrderEvent){

      }else if(event is FilterAOrderEvent){

      }
    });
  }
}
