import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:currency_converter/currency.dart';
import 'package:currency_converter/currency_converter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exchange Rates',
      theme: ThemeData(
        primarySwatch: Colors.green,
        //accentColor: Colors.black,
        backgroundColor: Colors.black
      ),
      home: ConversionPage(),
    );
  }
}

class ConversionPage extends StatefulWidget {
  @override
  _ConversionPageState createState() => _ConversionPageState();
}

class _ConversionPageState extends State<ConversionPage> {
  CurrencyConverter converter = CurrencyConverter();
  List<FlSpot> data = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  _loadData() async {
    double rate = await converter.convert(from: Currency.usd, to: Currency.eur, amount: 1);
    setState(() {
      data = [FlSpot(0, rate)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exchange Rates'),
      ),
      body: LineChart(
        LineChartData(
          lineBarsData: [
            LineChartBarData(
              spots: data,
              //colors: [Colors.green],
              color: Colors.green,
              barWidth: 2,
            ),
          ],
        ),
      ),
    );
  }
}