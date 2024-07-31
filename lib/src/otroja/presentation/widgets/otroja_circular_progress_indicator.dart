import 'package:flutter/material.dart';

import '../../core/utils/constants/colors.dart';

class OtrojaCircularProgressIndicator extends StatelessWidget {
  const OtrojaCircularProgressIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator(
      color: OtrojaColors.primaryColor,
    ));
  }
}