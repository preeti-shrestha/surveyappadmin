import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:surveyadmin/util/route_settings.dart';
import 'package:url_launcher/url_launcher.dart';
class ViewformScreen extends StatefulWidget {
  const ViewformScreen({super.key});

  @override
  State<ViewformScreen> createState() => _ViewformScreenState();
}

class _ViewformScreenState extends State<ViewformScreen> {

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(40),
      children: [
        Text(
          'Forms',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        SizedBox(height: 20,),
        GridView(
          shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 600,
              mainAxisExtent: 150,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20
            ),
          children: [
            for(int i=0;i<20;i++)
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.purple.shade50,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                      style: BorderStyle.solid,
                      color: Colors.purple.shade100,
                      width: 2
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        'Form Title',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    SizedBox(height: 5,),
                    Text(
                      'This is form description. It has details of this form.',
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () async{
                            final url=Uri.parse('https://docs.google.com/spreadsheets/d/1a0TH0uLyWNI7CjDqKeCVlFXfedFooIlK91LWck8v8-Q/edit?usp=sharing');
                            if(await canLaunchUrl(url)){
                              await launchUrl(
                                  url,
                                mode: LaunchMode.externalApplication
                              );
                            }else{
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Could not launch link'),backgroundColor: Colors.red,),
                              );
                            }
                            // Navigator.pushNamed(context, RouteHelper.webView,arguments: 'https://forms.gle/ueB2ivz6imiJ7jTn8');
                          },
                          style: TextButton.styleFrom(
                          ),
                          child: Text(
                            'View Responses',
                            style: Theme.of(context).textTheme.labelSmall!.copyWith(
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
          ],
        ),
      ],
    );
  }
}
