import 'package:flower_ecommerce_app_team5/core/bases/base_stateful_widget_state.dart';
import 'package:flower_ecommerce_app_team5/core/colors/app_colors.dart';
import 'package:flutter/material.dart';

class ProfileLayout extends StatefulWidget {
  const ProfileLayout({super.key});

  @override
  State<ProfileLayout> createState() => _ProfileLayoutState();
}

class _ProfileLayoutState extends BaseStatefulWidgetState<ProfileLayout> {
  bool isNotificationOn = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        forceMaterialTransparency: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Image(
                  image: AssetImage('assets/icons/Logo.png'),
                  width: 89,
                  height: 25,
                ),
                Icon(
                  Icons.notifications_none_outlined,
                  size: 24,
                  color: AppColors.gray,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: AssetImage('assets/icons/profile_icon.png'),
                  radius: 70,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Mahmoud',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('mahmoud.mohamed.gamal44@gmail.com',
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium
                        ?.copyWith(color: AppColors.gray, fontSize: 18))
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            const ListTile(
              title: Text('My orders'),
              leading: Icon(Icons.list),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            const ListTile(
              title: Text('Saved address'),
              leading: Icon(Icons.location_on),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            Divider(
              color: AppColors.gray,
            ),
            ListTile(
              leading: Switch(
                value: isNotificationOn,
                onChanged: (value) {
                  setState(() {
                    isNotificationOn = value;
                  });
                },
                activeColor: AppColors.white,
                activeTrackColor: AppColors.mainColor,
                inactiveThumbColor: AppColors.white,
                inactiveTrackColor: AppColors.gray,
              ),
              title: const Text("Notification"),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Optional: Navigate or handle tile tap
              },
            ),
            Divider(
              color: AppColors.gray,
            ),
             ListTile(
              title: Text('Language'),
              leading: Image(image: AssetImage('assets/icons/LanguageIcon.png')),
              trailing: Text('English',style: TextStyle(color: AppColors.mainColor),),
            ),
            const ListTile(
              title: Text('About us'),
              leading: Icon(Icons.newspaper_outlined),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            const ListTile(
              title: Text('Terms & conditions'),
              leading: Icon(Icons.policy),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            Divider(
              color: AppColors.gray,
            ),
            const ListTile(
              title: Text('Logout'),
              leading: Icon(Icons.logout),
              trailing: Icon(Icons.logout),
            ),


          ],
        ),
      ),
    );
  }
}
