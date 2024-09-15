import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';

class CusotmLoadingIndicator extends StatelessWidget {
  const CusotmLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
    // return const SpinKitFadingCircle(color: AppColors.primary,);
  }
}
