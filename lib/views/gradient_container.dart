import 'package:flutter/material.dart';

import '/constants/app_colors.dart';

class GradientContainer extends StatelessWidget {
  const GradientContainer({
    super.key,
    required this.children,
  });

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Container(
        height: screenSize.height,
        width: screenSize.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.darkBlue,
              Color(0xFF2193b0),
              Colors.orange,
              Color(0xFF6dd5ed),
              AppColors.darkBlue,
              AppColors.secondaryBlack,
              
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10.0,
              offset: Offset(0, 4),
            ),
          ],
        ),

        child: Padding(
          padding: const EdgeInsets.only(
            left: 24.0,
            right: 24.0,
            top: 36.0,
          ),
          child: CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate(
                  children,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
