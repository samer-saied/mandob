// import 'dart:math';

// import 'package:dartz/dartz.dart';
// import 'package:ecommerce_app/core/database/api/api_consumer.dart';
// import 'package:ecommerce_app/core/database/api/dio_consumer.dart';
// import 'package:ecommerce_app/core/services/service_locator.dart';
// import 'package:ecommerce_app/features/data/models/money_model.dart';
// import 'package:ecommerce_app/features/data/repository/product_repository.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import 'home_state.dart';

// class HomeCubit extends Cubit<HomeState> {
//   HomeCubit(this.productsRep) : super(HomeLoaded([], number: 0));

//   final ProductRepository productsRep;

//   int number = 0;
//   List<ProductModel> products = [];

//   void increased() {
//     emit(HomeLoading());
//     number++;
//     emit(HomeLoaded(products, number: number));
//   }

//   Future<void> decresed() async {
//     emit(HomeLoading());
//     number--;
//     emit(HomeLoaded(
//       products,
//       number: number,
//     ));
//   }

//   Future<void> getProducts() async {
//     emit(HomeLoading());
//     Either<String, List<ProductModel>> result =
//         await productsRep.getAllProducts();
//     result.fold(
//       (l) => emit(HomeError(error: l.toString())),
//       (r) {
//         products = r;
//         emit(HomeLoaded(r, number: number));
//       },
//     );
//   }
// }
