// import 'package:dartz/dartz.dart';
// import 'package:ecommerce_app/core/database/api/api_consumer.dart';
// import 'package:ecommerce_app/core/database/api/end_points.dart';
// import 'package:ecommerce_app/features/data/models/money_model.dart';

// import '../../../core/services/service_locator.dart';

// class ProductRepository {
//   Future<Either<String, List<ProductModel>>> getAllProducts() async {
//     try {
//       List<ProductModel> productsList = [];
//       final products =
//           await sl<ApiConsumer>().get(EndPoint.getProductsEndPoint());
//       products.forEach((productData) {
//         ProductModel product = ProductModel.fromJson(productData);
//         productsList.add(product);
//       });
//       return Right(productsList);
//     } catch (e) {
//       return Left(e.toString());
//     }
//   }
// }
