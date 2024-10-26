import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Money Wizard",
          style: TextStyle(color: AppColors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Wrap(
              // shrinkWrap: true,
              // gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              //   crossAxisCount: 2,
              // ),
              children: <Widget>[
                MainButton(
                  icon: Icons.add_circle_outlined,
                  text: "Credit",
                  color: AppColors.primary,
                  onTap: () {
                    Navigator.pushNamed(context, '/add', arguments: true);
                  },
                ),
                MainButton(
                  icon: Icons.remove_circle,
                  text: "Debit",
                  color: AppColors.red,
                  onTap: () {
                    Navigator.pushNamed(context, '/add', arguments: false);
                  },
                ),
                MainButton(
                  icon: Icons.summarize_outlined,
                  text: "Daily",
                  color: AppColors.purple,
                  onTap: () {
                    Navigator.pushNamed(context, '/today_summary');
                  },
                ),
                MainButton(
                  icon: Icons.calendar_today,
                  text: "Reports",
                  color: AppColors.blue,
                  onTap: () {
                    Navigator.pushNamed(context, '/weekly_summary');
                  },
                ),
              ],
            ),
            MainButton(
              icon: Icons.settings,
              text: "Settings",
              color: AppColors.black,
              isFullWidth: true,
              onTap: () {
                Navigator.pushNamed(context, '/settings');
              },
            ),
          ],
        ),
      ),
    );
  }
}

class MainButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;
  final bool isFullWidth;

  final void Function()? onTap;
  const MainButton(
      {super.key,
      required this.icon,
      required this.text,
      required this.color,
      this.onTap,
      this.isFullWidth = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      onTap: onTap,
      child: Card(
        elevation: 5,
        color: color.withOpacity(0.85),
        margin: EdgeInsets.all(10.sp),
        child: Container(
          constraints: BoxConstraints(
            minHeight: 140.sp,
          ),
          // height: 140,
          width: isFullWidth
              ? MediaQuery.sizeOf(context).width
              : MediaQuery.sizeOf(context).width * 0.43,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: AppColors.white,
                size: 36.sp,
              ),
              Padding(
                padding: EdgeInsets.all(8.sp),
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 20.sp,
                    overflow: TextOverflow.ellipsis,
                    color: AppColors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
