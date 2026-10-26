
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/taskmodel.dart';
import 'package:uuid/uuid.dart';

part 'task_state.dart';
class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(TaskInitial());

addTask(String title){
final  model=TaskModel(title: title, id: Uuid().v4(), iscompleted:false);
emit(UpdateTask([...state.taskslist,model]));

}

removeTask(String id){
final List<TaskModel> newlist = state.taskslist.where((task) => task.id!=id).toList();
emit(UpdateTask(newlist));

}

toggleTask(String id){
final List<TaskModel> newlist = state.taskslist.map((task) { 
  if (task.id==id){ 
    return task.copyWith(iscompleted:!task.iscompleted,);
  } return task;
}).toList();

emit(UpdateTask(newlist));


}
}