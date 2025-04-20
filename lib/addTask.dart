import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'task_provider.dart';


class Addtask extends ConsumerStatefulWidget {
  const Addtask({super.key});

  @override
  ConsumerState<Addtask> createState() => _AddtaskState();
}

class _AddtaskState extends ConsumerState<Addtask> {

final _formKey = GlobalKey<FormState>();
  String? _itemName;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
        top: 30,
        bottom: MediaQuery.of(context).viewInsets.bottom +20,
      ),
       child: SingleChildScrollView(
         child: Form(
           key: _formKey,
           child: Column(
             mainAxisAlignment: MainAxisAlignment.end,

             children: [
               Text("Add Task", style:
                 TextStyle(
                   fontSize: 20, fontWeight: FontWeight.bold
                 ),
               ),
               TextFormField(
                 decoration: InputDecoration(labelText: "Item Name"),
                 onSaved: (value)=> _itemName= value,
                 validator: (value)=>value==null || value.isEmpty? "Please enter item name": null,
               ),
               SizedBox(height: 20,),
               ElevatedButton(onPressed: (){
                 if (_formKey.currentState!.validate()){
                   _formKey.currentState!.save();

                   //Add task using provider

                   final currentList = ref.read(taskListProvider);
                   ref.read(taskListProvider.notifier).state=[...currentList, _itemName!];

                   Navigator.pop(context);
                   print("Item added: $_itemName");
                 }
               }, child: Text("Save"))
             ],
           ),
         ),

       )

    );
  }
}
