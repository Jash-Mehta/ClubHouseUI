import 'dart:math';

import 'package:clubhouse_flutterui/palette.dart';
import 'package:flutter/material.dart';

import '../data.dart';

class UpComingRooms extends StatelessWidget {
  final List<Room> upcomingRooms;

  const UpComingRooms({
    Key? key,
    required this.upcomingRooms,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Palette.secondaryBackground,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 4.0, left: 32.0, bottom: 4.0),
        child: Column(
          children: upcomingRooms
              .map(
                (e) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.only(top: e.club.isNotEmpty ? 2.0 : 0),
                        child: Text(e.time),
                      ),
                      const SizedBox(
                        width: 12.0,
                      ),
                      // Text(e.name),
                      // Text(e.club),
                      // Text(e.time),

                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (e.club.isNotEmpty)
                              Flexible(
                                child: Text(
                                  '${e.club}🏘'
                                      .toUpperCase(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .overline!
                                      .copyWith(
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: 1.0),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            Text(e.name),
                          
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
