import 'dart:io';

void main(){
  performTasks();
}

void performTasks() async {
  task1();
  String task2Result =  await task2();
  task3(task2Result);
}

void task1(){
  String result ='Task 1 data';
  print('Task 1 is complete');

}

//task 2 ko string isliye kiye kyuki task 3 ko data chye task 2 se or void me kuch bhi store nhi hota
Future task2() async{

  Duration threeSeconds =  Duration(seconds: 3);

   String result = "result";
    await Future.delayed(threeSeconds, ()
  {
     result = 'task 2 data';
    print('task 2 complete');
  });

  return result;

}

//agr task 3 ko koi data chahye task 2 se tabhi run hoga then kya??
void task3(String task2Data){
   String result = 'task 3 data';
   print('task 3 complete with $task2Data');
}