import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class PriceChart extends StatelessWidget {
  final String symbol;
  const PriceChart({super.key, required this.symbol});

  @override
  Widget build(BuildContext context) {
    // Demo static data. Replace with real OHLC timeseries when available.
    final spots = [
      FlSpot(0, 150),
      FlSpot(1, 152),
      FlSpot(2, 149),
      FlSpot(3, 155),
      FlSpot(4, 158),
      FlSpot(5, 154)
    ];

    return LineChart(
      LineChartData(
        minY: 140,
        maxY: 165,
        lineBarsData: [
          LineChartBarData(spots: spots, isCurved: true, barWidth: 2),
        ],
        titlesData: FlTitlesData(show: true),
      ),
    );
  }
}
