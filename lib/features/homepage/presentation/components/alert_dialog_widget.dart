import 'package:dis_pred/config/routes/route.dart';
import 'package:dis_pred/core/cache/cache_services.dart';
import 'package:dis_pred/features/homepage/domain/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void showAlertDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Logout'),
      content: const Text('Are you sure you want to logout?'),
      actions: [
        TextButton(
            onPressed: () {
              CacheServices.getCacheServicesInstance.clearCacheData();
              context.read<HomeViewModel>().image = null;
              Navigator.of(context).pushNamedAndRemoveUntil(
                  Routes.loginScreen, (route) => false);
            },
            child: const Text('Yes')),
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('No'))
      ],
    ),
  );
}
