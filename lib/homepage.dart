import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_state/addTask.dart';
import 'task_provider.dart';

class Homepage extends ConsumerStatefulWidget {
  const Homepage({super.key});

  @override
  ConsumerState<Homepage> createState() => _HomepageState();

}
class _HomepageState  extends ConsumerState<Homepage>{
  @override

  Widget build(BuildContext context) {

    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    final taskList = ref.watch(taskListProvider);

    return Scaffold(
      appBar: AppBar(title: const Center(child: Text("TODO APP")), backgroundColor: Colors.black26,),
      backgroundColor: Colors.grey.shade300,
      
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(30.0),
            child: Text("Tasks List", style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold
            ),),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Center(
              child: Container(
                color: Colors.white,
                width: screenWidth * 0.8,
                height: screenHeight * 0.4,

                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 20, left: 10),
                            child: Text("Daily Task", style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 15
                            ),),
                          ),
                          SizedBox(width: screenWidth * 0.39,),
                          Padding(
                            padding: const EdgeInsets.all(7.0),
                            child: FloatingActionButton.small(onPressed: (){
                              showModalBottomSheet(context: context,
                                  isScrollControlled: true,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(top: Radius.circular(20))
                                  ),
                                  builder: (context)=>const Addtask());

                            }, child: const Icon(Icons.add),),
                          ),
                        ],
                      ),
                      const Divider(thickness: 2, color: Colors.black54,),

                      Expanded(child: taskList.isEmpty
                          ? const Center(child: Text('No Tasks yet'))
                          :ListView.builder(
                          itemCount: taskList.length,
                          itemBuilder: (context, index){
                            return ListTile(
                              leading: const Icon (Icons.check_circle_outline),
                              title: Text(taskList[index]),
                            );
                      })

                      )


                    ],
                  ),
                ),


              ),

          )
        ],
      ),

    );
    
  }

}



