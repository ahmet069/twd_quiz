import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class LineChartWidget extends StatefulWidget {
  @override
  _LineChartWidgetState createState() => _LineChartWidgetState();
}

class _LineChartWidgetState extends State<LineChartWidget> {
  List<FlSpot> _generateRandomData(int count) {
    final List<FlSpot> spots = [];

    for (int i = 0; i < count; i++) {
      final double x = i.toDouble();
      final double y = (i * i).toDouble();

      spots.add(FlSpot(x, y));
    }

    return spots;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300.0,
      child: Container(),
    );
  }
}
