import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task/network/user_resp.dart';

class UserInfoTile extends StatelessWidget {
  final UserObj user;

  const UserInfoTile({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(
              CupertinoIcons.profile_circled,
              size: 48,
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(user.email.toString(),
                    style: const TextStyle(fontSize: 16, color: Colors.black)),
                const SizedBox(height: 2),
                Text('status: ${user.status}',
                    style:
                        const TextStyle(fontSize: 14, color: Colors.blueGrey)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
