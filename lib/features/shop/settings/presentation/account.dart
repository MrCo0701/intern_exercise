import 'package:exercise_1/features/shop/home/cubit/product_cubit.dart';
import 'package:exercise_1/features/shop/settings/presentation/widgets/option_setting.dart';
import 'package:exercise_1/widgets/dialog_custom.dart';
import 'package:exercise_1/widgets/line.dart';
import 'package:exercise_1/widgets/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

import '../../../authentication/presentation/screens/login.dart';
import 'cubit/setting_cubit.dart';
import 'cubit/setting_state.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingCubit()..updateUser(),
      child: BlocConsumer<SettingCubit, SettingState>(
        listener: (context, state) {
          if (state.deleteSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBarCustom('Delete success!!!', Colors.green));
            Future.delayed(
              Duration(seconds: 2),
              () => Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
                (Route<dynamic> route) => false,
              ),
            );
          } else {
            SnackBarCustom('Fail to delete!!!', Colors.red);
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // * Avatar & userName
                  BlocBuilder<SettingCubit, SettingState>(
                    builder: (context, state) {
                      return Padding(
                        padding: const EdgeInsets.all(30),
                        child: Row(
                          children: [
                            // * avatar
                            Expanded(
                              flex: 2,
                              child: Container(
                                height: 80,
                                width: 80,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  image: DecorationImage(image: Image.network(state.avatar).image, fit: BoxFit.cover),
                                ),
                              ),
                            ),
                            SizedBox(width: 20),

                            // * userName
                            Expanded(
                              flex: 6,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(state.userName, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                                      SizedBox(width: 10),
                                      Icon(Icons.edit, color: Colors.green),
                                    ],
                                  ),
                                  Text(state.email, overflow: TextOverflow.ellipsis),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),

                  // * Settings
                  Column(
                    children: [
                      OptionSetting(icon: Iconsax.bag, title: 'Orders', onPressed: () {}),
                      OptionSetting(icon: Iconsax.profile_2user, title: 'My Details', onPressed: () {}),
                      OptionSetting(icon: Iconsax.location, title: 'Delivery Address', onPressed: () {}),
                      OptionSetting(icon: Iconsax.card, title: 'Payment Methods', onPressed: () {}),
                      OptionSetting(icon: Iconsax.ticket, title: 'Promo Cord', onPressed: () {}),
                      OptionSetting(icon: Iconsax.notification, title: 'Notifications ', onPressed: () {}),
                      OptionSetting(icon: Iconsax.message_question, title: 'Help ', onPressed: () {}),
                      OptionSetting(icon: Iconsax.warning_2, title: 'About ', onPressed: () {}),
                      LineCustom(),
                    ],
                  ),

                  ElevatedButton(
                    onPressed: () => context.read<SettingCubit>().deleteUser(),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                    child: Text('Delete', style: TextStyle(color: Colors.white)),
                  ),

                  // * Button Logout
                  Container(
                    width: double.infinity,
                    height: 100,
                    color: Colors.transparent,
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                    child: ElevatedButton.icon(
                      icon: Icon(Icons.logout, size: 25),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder:
                              (context) => DialogCustom(
                                title: 'Are you sure want to logout?',
                                onClickNo: () {},
                                onClickYes:
                                    () => Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(builder: (context) => LoginScreen()),
                                      (Route<dynamic> route) => false,
                                    ),
                              ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
                        backgroundColor: Colors.grey.withOpacity(0.2),
                        shadowColor: Colors.transparent,
                        iconColor: Colors.green,
                      ),
                      label: Text(
                        'Log Out',
                        style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
