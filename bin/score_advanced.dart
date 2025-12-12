import 'dart:io';

void main() async{

  File txtFile = File('students.txt'); // 파일의 객체를 생성
  String content = await txtFile.readAsString(); // 파일을 문자열로 불러옴
  List<String> lines = content.split('\n'); // 문자를 구분해 줌
  // print(lines);

  List<StudentScore> studentList = []; 
  // 3) 파일의 리스트를 반복문으로 불러온다.
  for (var l in lines) {
    List<String> nameAndScore = l.split(','); // 줄이 나뉘었으니 , 단위로 구분한다.
    String name = nameAndScore[0]; 
    int score = int.parse(nameAndScore[1]); 
    StudentScore s = StudentScore(name, score);
    studentList.add(s);
  }
  print("어떤 학생의 점수를 확인하시겠습니까?");
  // print(studentList.length); 

  // 리스트에 담긴 학생 이름과 input이라는 입력값과 비교
  String input = stdin.readLineSync()!; // !: 빈 값이 들어올 수 없다고 명시
  StudentScore? findPerson = null;
  
  for (StudentScore student in studentList) { // var=StudentScore
   // student.showInfo();
   if (input == student.name) {
     findPerson = student;
     break;
   }
  }
  if(findPerson == null) {
    print("잘못된 학생이름을 입력하였습니다.");
  } else {
    print("찾는 학생의 이름: ${findPerson.name}, 찾는 학생의 점수: ${findPerson.scores}");
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
