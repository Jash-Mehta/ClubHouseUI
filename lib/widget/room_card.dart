import 'package:clubhouse_flutterui/data.dart';
import 'package:clubhouse_flutterui/screens/room_screen.dart';
import 'package:clubhouse_flutterui/widget/user_profile_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoomCard extends StatelessWidget {
  final Room room;

  const RoomCard({Key? key, required this.room}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => RoomScreen(room: room),
                  fullscreenDialog: true));
        },
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${room.club}🏘'.toUpperCase(),
                  style: Theme.of(context).textTheme.overline!.copyWith(
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1.0,
                      fontSize: 12.0),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  room.name,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(fontSize: 15.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 12.0,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        height: 100.0,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 28.0,
                              top: 20.0,
                              child: UserProfileImage(
                                imageUrl: room.speakers[1].imageUrl,
                                size: 48.0,
                              ),
                            ),
                            UserProfileImage(
                              imageUrl: room.speakers[0].imageUrl,
                              size: 48.0,
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ...room.speakers.map(
                            (e) => Text(
                              '${e.givenName} ${e.familyName}',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(fontSize: 16.0),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 4.0),
                            child: Text.rich(
                              TextSpan(children: [
                                TextSpan(
                                    text:
                                        '${room.speakers.length + room.followedBySpeakers.length + room.others.length}'),
                                const WidgetSpan(
                                  child: Icon(
                                    CupertinoIcons.person_fill,
                                    size: 18.0,
                                    color: Colors.grey,
                                  ),
                                ),
                                TextSpan(text: '/ ${room.speakers.length}'),
                                const WidgetSpan(
                                    child: Icon(
                                  CupertinoIcons.chat_bubble_fill,
                                  size: 18.0,
                                  color: Colors.grey,
                                ))
                              ]),
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
