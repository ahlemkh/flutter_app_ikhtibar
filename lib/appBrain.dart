import 'question.dart';
class AppBrain {
  int _number=0;
  List<Questions> _questionList = [
    Questions('عدد الكواكب في المجموعة الشمسية هو ثمانية ', 'images/image-1.jpg', true),
    Questions(' القطط هي حيوانات لاحمة ', 'images/image-2.jpg', true),
    Questions(' الصين موجود في القارة الافريقية ', 'images/image-3.jpg', false),
    Questions(' الارض مسطحة و ليست كروية ', 'images/image-4.jpg', false)

  ];
String getQuestion(){
  return _questionList[_number].questionText;
}
String getImage(){
  return _questionList[_number].questionImage;
}
bool getAnswer(){
  return _questionList[_number].answer;
}
bool isFinished()
{
  if(_number<_questionList.length-1)
  {
    return false;

  }
  else {
    return true;
  }
}
void reset(){
  _number=0;

}
void nextQuestion(){
  _number++;
}
int getNumber(){
  return _number;
}
}