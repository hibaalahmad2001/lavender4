part of 'new_orders_bloc.dart';
@immutable
abstract class NewOrdersState {}

class NewOrdersInitial extends NewOrdersState {}

class GetNewOrdersState extends NewOrdersState {
  List<NewOrder> orders = [];

  GetNewOrdersState({required this.orders});
}
