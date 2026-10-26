import'package:equatable/equatable.dart';

class TaskModel extends Equatable{

final String title;
final String id;
final  bool iscompleted;

 TaskModel({ required this.title,required this.id,required this.iscompleted});

@override
List<Object?> get props =>[title,id,iscompleted];

TaskModel copyWith({
String? title,
String? id,
bool?iscompleted
})
{
return TaskModel(title: title ?? this.title,
 id: id?? this.id, 
iscompleted: iscompleted?? this.iscompleted);

}



}