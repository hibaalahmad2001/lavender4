part of 'new_orders_bloc.dart';

@immutable
abstract class NewOrdersEvent {}

class EditDateEvent extends NewOrdersEvent{}

class AcceptAOrderEvent extends NewOrdersEvent{}

class FilterAOrderEvent extends NewOrdersEvent{}
