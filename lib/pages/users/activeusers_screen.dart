import 'package:flutter/material.dart';
class ActiveusersScreen extends StatefulWidget {
  const ActiveusersScreen({super.key});

  @override
  State<ActiveusersScreen> createState() => _ActiveusersScreenState();
}

class _ActiveusersScreenState extends State<ActiveusersScreen> {
  @override
  Widget build(BuildContext context) {
    Map<String,String> userInfo={
      'Preeti Shrestha':'preetistha24@gmail.com',
      'Mamata Khanal':'mamatakhanal@gmail.com',
      'Rabina Khanal':'rabinakhanal@gmail.com',
      'Nabina Lama':'nabinalama@gmail.com',
      'Monica Limbu':'monicalimbu@gmail.com',
    };
    return ListView(
      padding: EdgeInsets.all(40),
      children: [
        Text(
          'Active Users',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        SizedBox(height: 20,),
        ListTile(
          leading: Text(
            'Name',
            style: Theme.of(context).textTheme.labelLarge,
          ),
          title: Text(
            'E-mail',
            style: Theme.of(context).textTheme.labelLarge,
          ),
          trailing: Text(
            'Payment',
            style: Theme.of(context).textTheme.labelLarge,
          ),
          tileColor: Colors.purple,
          minLeadingWidth: 150,
        ),
        SizedBox(height: 20,),

        for(var entries in userInfo.entries)
          Column(
            children: [
              ListTile(
                leading: Text(
                    '${entries.key}',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                title: Text(
                    '${entries.value}',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                trailing: IconButton(
                    onPressed: (){},
                    icon: Icon(Icons.payment_rounded)
                ),
                minLeadingWidth: 150,
              ),
              SizedBox(height: 10,)
            ],
          ),
      ],
    );
  }
}

