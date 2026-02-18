import 'package:flutter/material.dart';

import '../util/route_settings.dart';
class LogoutDialog extends StatefulWidget {
  const LogoutDialog({super.key});

  @override
  State<LogoutDialog> createState() => _LogoutDialogState();
}

class _LogoutDialogState extends State<LogoutDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      titleTextStyle: Theme.of(context).textTheme.titleSmall,
      contentTextStyle: Theme.of(context).textTheme.bodySmall,
      title: Text('Logout'),
      content: Text(
        'Are you sure you want to log out?',
        // style: Theme.of(context).textTheme.titleSmall,
      ),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, RouteHelper.main);
          },
          icon: Icon(Icons.close_rounded),
        ),
        IconButton(
          onPressed: () {
            Navigator.pushReplacementNamed(
                context, RouteHelper.login);
          },
          icon: Icon(Icons.check_rounded),
        ),
      ],
    );
  }
}
