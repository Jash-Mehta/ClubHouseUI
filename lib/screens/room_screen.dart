import 'dart:math';

import 'package:clubhouse_flutterui/widget/room_user_profile.dart';
import 'package:clubhouse_flutterui/widget/widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../data.dart';

class RoomScreen extends StatelessWidget {
  final Room room;

  const RoomScreen({Key? key, required this.room}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leadingWidth: 120.0,
        leading: TextButton.icon(
          onPressed: () {
            Navigator.pop(context);
          },
          style: TextButton.styleFrom(primary: Colors.black),
          icon: Icon(
            CupertinoIcons.chevron_down,
          ),
          label: const Text("All room"),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              CupertinoIcons.doc,
              size: 28.0,
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: EdgeInsets.fromLTRB(8.0, 10.0, 20.0, 10.0),
              child: UserProfileImage(
                imageUrl: currentUser.imageUrl,
                size: 36.0,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(40.0)),
        child: CustomScrollView(slivers: <Widget>[
          SliverToBoxAdapter(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${room.club}🏘'.toUpperCase(),
                      style: Theme.of(context).textTheme.overline!.copyWith(
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.0,
                          fontSize: 14.0),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: const Icon(CupertinoIcons.ellipsis),
                    )
                  ],
                ),
                Text(
                  room.name,
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.0),
                ),
              ],
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(20.0),
            sliver: SliverGrid.count(
              crossAxisCount: 3,
              mainAxisSpacing: 20.0,
              children: [
                ...room.speakers
                    .map((e) => RoomUserProfile(
                          imageUrl: e.imageUrl,
                          size: 66.0,
                          name: e.givenName,
                          isNew: Random().nextBool(),
                          isMuted: Random().nextBool(),
                        ))
                    .toList()
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                "Followed by speaker",
                style: Theme.of(context)
                    .textTheme
                    .subtitle2!
                    .copyWith(color: Colors.grey, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(20.0),
            sliver: SliverGrid.count(
              crossAxisCount: 4,
              mainAxisSpacing: 20.0,
              childAspectRatio: 0.8,
              children: [
                ...room.followedBySpeakers
                    .map((e) => RoomUserProfile(
                          imageUrl: e.imageUrl,
                          size: 66.0,
                          name: e.givenName,
                          isNew: Random().nextBool(),
                          // isMuted: Random().nextBool(),
                        ))
                    .toList()
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                "Others in room",
                style: Theme.of(context)
                    .textTheme
                    .subtitle2!
                    .copyWith(color: Colors.grey, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(20.0),
            sliver: SliverGrid.count(
              crossAxisCount: 4,
              mainAxisSpacing: 20.0,
              childAspectRatio: 0.8,
              children: [
                ...room.others
                    .map((e) => RoomUserProfile(
                          imageUrl: e.imageUrl,
                          size: 66.0,
                          name: e.givenName,
                          isNew: Random().nextBool(),
                          // isMuted: Random().nextBool(),
                        ))
                    .toList()
              ],
            ),
          ),
          const SliverPadding(padding: EdgeInsets.only(bottom: 100.0)),
        ]),
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
        height: 75.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 6.0, horizontal: 16.0),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(24.0),
                ),
                child: Text.rich(
                  TextSpan(children: [
                    TextSpan(
                      text: '✌',
                      style: TextStyle(fontSize: 20.0),
                    ),
                    TextSpan(
                        text: 'Leave quietly',
                        style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.red,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.0))
                  ]),
                ),
              ),
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey[300],
                    ),
                    child: const Icon(
                      CupertinoIcons.add,
                      size: 30.0,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 16.0,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey[300],
                    ),
                    child: const Icon(
                      CupertinoIcons.hand_raised,
                      size: 30.0,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
