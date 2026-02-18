import 'package:flutter/material.dart';
class InactiveusersScreen extends StatefulWidget {
  const InactiveusersScreen({super.key});

  @override
  State<InactiveusersScreen> createState() => _InactiveusersScreenState();
}

class _InactiveusersScreenState extends State<InactiveusersScreen> {
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
          'Inactive Users',
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
            'Activate',
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
                trailing: OutlinedButton(
                    onPressed: (){},
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.all(10),
                      backgroundColor: Colors.purple
                    ),
                    child: Text(
                      'Activate',
                      style: Theme.of(context).textTheme.displayMedium,
                    )
                ),
                minLeadingWidth:150,
                // horizontalTitleGap: 20,
              ),
              SizedBox(height: 10,)
            ],
          ),
      ],
    );
  }

}
