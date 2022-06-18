import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

/// common shimmer effect widget for display while loading data
class AppShimmer extends StatelessWidget {
  final Widget child;

  //shimmer color
  static Color shimmerBaseColor = Colors.grey[300];
  static Color shimmerHighlightColor = Colors.grey[050];

  const AppShimmer({Key key, @required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: shimmerBaseColor,
      highlightColor: shimmerHighlightColor,
      enabled: true,
      child: child,
    );
  }
}
