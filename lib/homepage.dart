import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/cubit/task_cubit.dart';


class Home extends StatelessWidget {
  TextEditingController input = TextEditingController();
   Home ({super.key});

  @override
  Widget build(BuildContext context) {
    
    return  Scaffold(appBar: AppBar(backgroundColor:  const Color.fromARGB(255, 14, 46, 72),
    title:Text("To Do App",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.white),),
    leading: Icon(Icons.task,size: 40,color: Colors.white,),
    ),
body:BlocProvider(create: (context)=>TaskCubit(),
child: BlocBuilder<TaskCubit, TaskState>(
  builder: (context, state) {
    final cubit=context.read<TaskCubit>();
    return Padding(padding: EdgeInsets.all(18),child:Column( children: [
TextField( decoration: InputDecoration(hintText: "Enter Your Task Here...",hintStyle: TextStyle(color:Colors.grey,fontSize:15 ),
suffixIcon: Icon(Icons.task_alt),
enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 14, 46, 72),),
borderRadius: BorderRadius.circular(30))
,focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:Color.fromARGB(255, 14, 46, 72), ),
borderRadius: BorderRadius.circular(30))),
controller: input,
 ),SizedBox(height: 12,),
ElevatedButton(onPressed: (){ 
  if(input.text.isEmpty)return;
  cubit.addTask(input.text);
  input.clear();
},style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 14, 46, 72)),
child: Text("Add Task",style: TextStyle(fontSize: 22,color:  Colors.white),)
,),
SizedBox(height: 10,),
Expanded(child: ListView.builder(itemCount: state.taskslist.length
  ,itemBuilder:(context,index) {return  Card(child:ListTile(
title:Text(state.taskslist[index].title),
leading: Checkbox(value:state.taskslist[index].iscompleted, onChanged: (value){ 
cubit.toggleTask(state.taskslist[index].id);

},activeColor: Color.fromARGB(255, 14, 46, 72)),
trailing:IconButton(onPressed: (){
cubit.removeTask(state.taskslist[index].id);
}, icon: Icon(Icons.delete,size: 20,color: Color.fromARGB(255, 14, 46, 72),))
  ) ,);

  })


)





],

)

,);
  },
),

)




     );
     
  }
}