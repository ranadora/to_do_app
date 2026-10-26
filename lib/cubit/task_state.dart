part of 'task_cubit.dart';


@immutable
sealed class TaskState extends Equatable {
final List<TaskModel> taskslist;
 TaskState( this.taskslist);

  @override
 List<Object?> get props =>[taskslist];
}

final class TaskInitial extends TaskState {
 TaskInitial():super([]);

}

final class UpdateTask extends TaskState{

UpdateTask(super.taskslist);
}