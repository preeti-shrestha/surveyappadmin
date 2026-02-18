import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:surveyadmin/util/route_settings.dart';
class AddformScreen extends StatefulWidget {
  const AddformScreen({super.key});

  @override
  State<AddformScreen> createState() => _AddformScreenState();
}

class _AddformScreenState extends State<AddformScreen> {
  TextEditingController form_title=TextEditingController();
  TextEditingController form_description=TextEditingController();
  TextEditingController form_link=TextEditingController();
  // TextEditingController form_name=TextEditingController();

  final dbReference=FirebaseFirestore.instance.collection('forms');
  final formkey=GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: Center(
        child: ListView(
          // shrinkWrap: true,
          padding: EdgeInsets.all(40),
          children: [
            Text(
                'Add New Form',
              style: Theme.of(context).textTheme.titleLarge,
            ),

            SizedBox(height: 20,),

            TextFormField(
              // maxLength: 50,
              controller: form_title,
              keyboardType: TextInputType.name,
              style: Theme.of(context).textTheme.bodySmall,
              decoration: InputDecoration(
                labelText: "Title",
                labelStyle: Theme.of(context).textTheme.bodySmall,
                hintText: "Enter form title",
                hintStyle: Theme.of(context).textTheme.bodySmall,

                prefixIcon: Icon(Icons.title_rounded),
                suffixIcon: IconButton(
                  onPressed: (){
                    form_title.clear();
                  },
                  icon: Icon(Icons.close_rounded),
                ),
              ),
              validator: (value){
                if(value==null || value.isEmpty){
                  return "Please enter form title";
                }
                return null;
              },
            ),

            SizedBox(height: 20,),

            TextFormField(
              // maxLength: 50,
              controller: form_description,
              keyboardType: TextInputType.name,
              maxLines: 3,
              style: Theme.of(context).textTheme.bodySmall,
              decoration: InputDecoration(
                labelText: "Description",
                labelStyle: Theme.of(context).textTheme.bodySmall,

                hintText: "Enter form description",
                hintStyle: Theme.of(context).textTheme.bodySmall,

                prefixIcon: Icon(Icons.description_rounded),
                suffixIcon: IconButton(
                  onPressed: (){
                    form_description.clear();
                  },
                  icon: Icon(Icons.close_rounded),
                ),
              ),
              validator: (value){
                if(value==null || value.isEmpty){
                  return "Please enter form description";
                }
                return null;
              },
            ),

            SizedBox(height: 20,),

            TextFormField(
              // maxLength: 50,
              controller: form_link,
              keyboardType: TextInputType.name,
              style: Theme.of(context).textTheme.bodySmall,
              decoration: InputDecoration(
                labelText: "Link",
                labelStyle: Theme.of(context).textTheme.bodySmall,

                hintText: "Enter form URL",
                hintStyle: Theme.of(context).textTheme.bodySmall,

                prefixIcon: Icon(Icons.link_rounded),
                suffixIcon: IconButton(
                  onPressed: (){
                    form_link.clear();
                  },
                  icon: Icon(Icons.close_rounded),
                ),
              ),
              validator: (value){
                if(value==null || value.isEmpty){
                  return "Please enter form URL";
                }
                // if(!value.contains('@')){
                //   return "Invalid name";
                // }
                return null;
              },
            ),

            SizedBox(height: 20),

            ElevatedButton(
                onPressed: () async{
                  final isFormValid=formkey.currentState!.validate();
                  if(isFormValid){
                    String formId=DateTime.now().millisecondsSinceEpoch.toString();
                    await dbReference.doc(formId).set({
                      'id':formId,
                      'form_title':form_title.text,
                      'form_description':form_description.text,
                      'form_link':form_link.text,
                    });
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            titleTextStyle: Theme.of(context).textTheme.titleSmall,
                            contentTextStyle: Theme.of(context).textTheme.bodySmall,
                            title: Text('Success'),
                            content: Text(
                              'Form Added Successfully',
                              // style: Theme.of(context).textTheme.titleSmall,
                            ),
                            actions: [
                              IconButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, RouteHelper.main);
                                },
                                icon: Icon(Icons.check_rounded),
                              ),
                            ],
                          );
                        }
                    );
                  }
                },
                child: Text('Add Form'),
            )

          ],
        ),
      ),
    );
  }
}
