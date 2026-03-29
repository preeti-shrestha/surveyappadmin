import 'package:flutter/material.dart';
import 'package:surveyadmin/pages/dashboard/dashboard_screen.dart';
import 'package:surveyadmin/pages/forms/addform_screen.dart';
import 'package:surveyadmin/pages/forms/viewform_screen.dart';
import 'package:surveyadmin/pages/users/activeusers_screen.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:surveyadmin/pages/users/inactiveusers_screen.dart';

import '../widgets/logout_dialog.dart';
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _controller=SidebarXController(selectedIndex: 0,extended: true);

  final List<Widget> navigation=[
    DashboardScreen(),
    ViewformScreen(),
    AddformScreen(),
    ActiveusersScreen(),
    InactiveusersScreen()
  ];
  // int currentIndex=0;
  GlobalKey<ScaffoldState> globalKey=GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final width=MediaQuery.of(context).size.width;
    if(width<1000 && _controller.extended){
      _controller.setExtended(false);
    }else if(width>=1000 && !_controller.extended){
      _controller.setExtended(true);
    }
    return Scaffold(
      body: Row(
        children: [
          SidebarX(
            controller: _controller,
            theme: SidebarXTheme(
              width: 70,
              decoration: BoxDecoration(
                color:Colors.purple,
              ),
              textStyle: Theme.of(context).textTheme.displayMedium,
              selectedTextStyle: Theme.of(context).textTheme.bodySmall,
              selectedItemDecoration: BoxDecoration(
                color: Color(0xFFeee6ff),
                borderRadius: BorderRadius.circular(10),
              ),
              hoverIconTheme: IconThemeData(color: Colors.purple.shade50,size: 20),
              hoverTextStyle: Theme.of(context).textTheme.labelLarge,
              iconTheme: IconThemeData(color: Color(0xFFeee6ff),size: 20),
              selectedIconTheme: IconThemeData(color: Colors.purple,size: 20),
              itemPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            ),
            extendedTheme: SidebarXTheme(
              width: 250
            ),
            footerDivider: Divider(color:Color(0xFFeee6ff)),
            headerBuilder: (context,extended){
                return Container(
                  height: 100,
                  alignment: Alignment.center,
                  child: extended?
                    ColorFiltered(
                      colorFilter: ColorFilter.mode(
                        Color(0xFFeee6ff),
                        BlendMode.srcIn,
                      ),
                      child: Image.asset('assets/images/logo/surveylogoappbar.png',height: 40,), // Your original image
                    ):
                    ColorFiltered(
                      colorFilter: ColorFilter.mode(
                        Color(0xFFeee6ff),
                        BlendMode.srcIn,
                      ),
                      child: Image.asset('assets/images/logo/surveylogolauncher.png',height: 40,), // Your original image
                    ),
                );
            },
            items: [
              SidebarXItem(
                icon:Icons.dashboard_rounded,
                label: 'Dashboard',
                onTap: ()=>setState(() {}),
              ),
              SidebarXItem(
                icon:Icons.view_agenda_rounded,
                label: 'View Forms',
                onTap: ()=>setState(() {}),
              ),
              SidebarXItem(
                icon:Icons.add_card_rounded,
                label: 'Add Form',
                onTap: ()=>setState(() {}),
              ),
              SidebarXItem(
                icon:Icons.account_circle_rounded,
                label: 'Active Users',
                onTap: ()=>setState(() {}),
              ),
              SidebarXItem(
                icon:Icons.no_accounts_rounded,
                label: 'Inactive Users',
                onTap: ()=>setState(() {}),
              ),
              SidebarXItem(
                icon:Icons.logout_rounded,
                label: 'Logout',
                onTap: (){
                  showDialog(
                      context: context,
                      builder: (context)=>LogoutDialog()
                  );
                },
              )
            ],
          ),
          Expanded(
              child: navigation[_controller.selectedIndex],
          ),
        ],
      ),
    );
  }
}
