import 'package:score_advanced/score_advanced.dart' as score_advanced;
import 'dart:io';

void main() async{

  File txtFile = File('students.txt');
  String content = await txtFile.readAsString(); 
  List<String> lines = content.split('\n');
  print(lines);

  List<StudentScore> studentList = []; 
  
  // 3) 파일의 리스트를 반복문으로 불러온다.
  for (var l in lines) {
    List<String> nameAndScore = l.split(','); 
    String name = nameAndScore[0]; 
    int score = int.parse(nameAndScore[1]); 
    StudentScore s = StudentScore(name, score);
    studentList.add(s);
  }

  print(studentList.length); // 여기까지가 1번 과제. 

  for (var student in studentList) { 
   student.showInfo();
  }
  
}

// 필수정의. 1. 점수를 표현하기 위한 Score클래스
// 1) 학생의 이름과 점수가 담긴 클래스를 먼저 만들어준다.
class Score {
  int scores;
  Score(this.scores);

  void showInfo() {
    print("점수: $scores");
  }

}

// 2) `Score`의 상속을 받은 자식 클래스를 만들어준다.
class StudentScore extends Score {

  String name;
  StudentScore(this.name,super.scores); 
  
  @override 
  void showInfo() {
    print("이름: $name, 점수: $scores");
  }
}


// 12/11 할 것(업로드 전에 지우기)
// 깃허브에 1번문제 풀이까지 업로드. 트러블슈팅 까지 한 뒤 TIL만들어서 제출 12시 전 까지.
// 12일에 오전에 스터디 끝나고 10시 반부터 2번 문제 튜터님과 함께 함.