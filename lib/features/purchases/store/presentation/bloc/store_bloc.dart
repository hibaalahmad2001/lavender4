// // store_bloc.dart
//
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:lavender4/features/purchases/store/presentation/bloc/store_event.dart';
// import 'package:lavender4/features/purchases/store/presentation/bloc/store_state.dart';
//
// class StoreBloc extends Bloc<StoreEvent, StoreState> {
//   StoreBloc() : super(StoreInitialState(productTypes: ['']));
//
//   @override
//   Stream<StoreState> mapEventToState(StoreEvent event) async* {
//     if (event is AddProductEvent) {
//       final newList = List<Product>.from(state.products)..add(event.newProduct);
//       yield ProductAddedState(newList);
//     }
//
//   }
// }
