import 'package:flutter/material.dart';

import '../utils/constants.dart';

class ForecastPage extends StatelessWidget {
  const ForecastPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Ramalan Cuaca Per Jam",
            style: kWeatherTitleTextStyle,
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 100,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                return HourForecastGrid(
                  imageLocation: "images/clear_white.png",
                  hour: "${12 + index}:00",
                  temp: 27 + index,
                );
              },
              separatorBuilder: (_, __) => const VerticalDivider(),
              itemCount: 6,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            "Ramalan Cuaca Per Hari",
            style: kWeatherTitleTextStyle,
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.separated(
              itemBuilder: (_, index) {
                return DayForecastCard(
                  imageLocation: "images/clear_white.png",
                  date: "Sabtu, 27 Maret",
                  temp: 27 + index,
                  feelsLike: 29+ index,
                );
              },
              separatorBuilder: (_, __) => const Divider(),
              itemCount: 6,
            ),
          ),
        ],
      ),
    );
  }
}

class HourForecastGrid extends StatelessWidget {
  final String imageLocation;
  final String hour;
  final int temp;

  const HourForecastGrid({
    Key? key,
    required this.imageLocation,
    required this.hour,
    required this.temp,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).brightness == Brightness.light
            ? Colors.grey.shade200
            : Colors.grey.shade800,
      ),
      height: 100,
      width: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(hour),
          Image.asset(
            imageLocation,
            height: 40,
            width: 40,
            color: Theme.of(context).brightness == Brightness.light
                ? Colors.black
                : null,
          ),
          Text("$temp°")
        ],
      ),
    );
  }
}

class DayForecastCard extends StatelessWidget {
  final String imageLocation;
  final String date;
  final int temp;
  final int feelsLike;

  DayForecastCard({
    required this.imageLocation,
    required this.date,
    required this.temp,
    required this.feelsLike,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.light
            ? Colors.grey.shade200
            : Colors.grey.shade800,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 12,
        horizontal: 16,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(
              date,
              style: kWeatherAttrTextStyle2,
            ),
          ),
          Expanded(
            child: Image.asset(
              imageLocation,
              width: 44,
              height: 44,
              color: Theme.of(context).brightness == Brightness.light
                  ? Colors.black
                  : null,
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                "$temp°",
                style: kDayForecastTempTextStyle,
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                "$feelsLike°",
                style: kDayForecastTempTextStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}