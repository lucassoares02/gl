import 'package:flutter/material.dart';
import 'package:gl/src/utils/decorations.dart';
import 'package:gl/src/utils/spacing.dart';

class AppCard extends StatelessWidget {
  const AppCard({
    super.key,
    required this.title,
    required this.date,
    required this.day,
    required this.location,
    required this.color,
  });

  final String title;
  final String date;
  final String day;
  final String location;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(appPadding),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.withOpacity(0.3), width: 2),
        borderRadius: BorderRadius.circular(appRadius),
      ),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.trip_origin,
                  color: color,
                  size: 15,
                ),
                const SizedBox(width: 5),
                Text(title, style: appTitleText),
              ],
            ),
            Text(date),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(
                  Icons.location_on_outlined,
                  color: Colors.grey,
                  size: 20,
                ),
                Text(location),
              ],
            ),
            Text(day),
          ],
        ),
      ]),
    );
  }
}
