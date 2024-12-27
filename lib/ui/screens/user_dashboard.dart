import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/controller/user_controller.dart';
import 'package:task/network/user_resp.dart';
import 'package:task/ui/screens/profile.dart';
import 'package:task/ui/widgets/user_tile_widget.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.home_outlined),
        title: const Text(
          'DashBoard',
          style: TextStyle(
              color: Colors.black, fontSize: 14, fontWeight: FontWeight.w600),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Get.to(const ProfileScreen());
              },
              icon: const Icon(CupertinoIcons.profile_circled))
        ],
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Expanded(
          child: GetBuilder<UserController>(builder: (logic) {
            return Visibility(
              visible: !logic.isLoading,
              replacement: const Center(
                child: CircularProgressIndicator(),
              ),
              child: logic.userList.isEmpty
                  ? const Center(child: Text('No users found.'))
                  : ListView.separated(
                      itemBuilder: (context, index) {
                        UserObj user = logic.userList[index];
                        return UserInfoTile(user: user);
                      },
                      separatorBuilder: (_, __) => const SizedBox(height: 8),
                      itemCount: logic.userList.length,
                    ),
            );
          }),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    Get.find<UserController>().getUsers();
  }
}
