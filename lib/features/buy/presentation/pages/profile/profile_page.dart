import 'package:ecom/features/buy/presentation/pages/profile/sub_pages/edit_profile.dart';
import 'package:ecom/features/buy/presentation/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'sub_pages/address_page.dart';
import 'sub_pages/order_history.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> iconData = [
      {
        'icon': Icons.person,
        'name': 'Edit Profile',
        'page': const EditProfile()
      },
      {
        'icon': Icons.location_pin,
        'name': 'Shopping Adress',
        'page': const AddrPage()
      },
      {
        'icon': Icons.receipt,
        'name': 'Order History',
        'page': const OrderHistory()
      },
      // Add more pages as necessary
    ];

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomText(text: 'Profile'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Gap(150),
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(300),
                child: Image.network(
                    height: 150,
                    'https://i.pinimg.com/564x/e1/18/40/e1184034f6970df67ff3dfafb70de7f6.jpg'),
              ),
            ),
            const Gap(10),
            CustomText(
              text: 'Thorffin',
            ),
            const Gap(30),
            Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Column(
                    children: List.generate(iconData.length, (index) {
                  return ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return iconData[index]['page'];
                      }));
                    },
                    leading: Icon(
                      iconData[index]['icon'],
                      color: Colors.grey.shade700,
                      size: 30,
                    ),
                    title: CustomText(text: iconData[index]['name']),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey.shade700,
                    ),
                  );
                })))
          ],
        ),
      ),
    );
  }
}
