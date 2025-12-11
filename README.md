A sample command-line application with an entrypoint in `bin/`, library code
in `lib/`, and example unit test in `test/`.

//노란줄: 선언을 했는데 굳이 안써도 됨. 파란줄: 더 좋은 버전이 있다 바꿔라


1. 과제


12월 2주차- [Dart 심화] 심화과제 - 성적 분석 프로그램
- 다트 콘솔 프로그램 템플릿 구성하기

과제제출
- Github 링크 Public으로 열어서
- 완성범위 + 도전 기능 구현 리스트
- 어려웠던 점

시나리오
- 컬렉션을 활용하여 데이터 처리하기
- 파일 입출력을 통해 데이터를 불러오고 저장하기
- 객체 지향을 활용한 전체 구조 생각하기

# 필수 정의!
-1. Score 클래스로 점수 표현하기
 - 속성(Property)
 -점수(int)
 - 메서드
 -출력 메서드(showInfo())
  : 현재 점수를 출력
  : 출력 형태: 
  ```
  점수 90
  ```

-2. 학생의 점수를 위한 StudentScore 클래스
 - 속성
 -이름(String)
 -점수(int)
 - 메서드
 -출력 메서드(showInfo())
  : 해당 학생의 정보를 출력합니다.
  : 출력 형태:
  ```
  이름: 홍길동, 점수: 90
  ```

# 필수 문제!
## 1. Score와 StudentScore 클래스를 구성하기 
[ 설명 ]
- 점수를 표현하는 `Score`클래스를 정의하고, 이를 상속받아 학생의 정보를 포함하는 `StudentScore`클래스를 구현하기
- `Score`클래스의 `showInfo()`메서드는 단순히 점수만 출력하지만, `StudentScore`클래스는 학생 이름까지 포함하여 더 구체적인 정보를 출력한다.

[ 조건 ]
- `StudentScore`클래스의 `showInfo()`메서드는 반드시 `@override`로 부모 메서드를 재정의해야 한다.
```
@override
void showInfo() {
    // 코드 구현
}
```

[ 힌트 ]
- 클래스 상속에는 `extends`키워드를 사용한다.
- 메서드를 재정의 할 때는 `@override`어노테이션을 붙여준다.
- 부모 클래스의 기능을 활장할 때는 생성자에서 `super(...)`를 사용하여 부모 
속성을 초기화 할 수 있다.


// 모닝스터디에서 배운 파일을 불러오는 방법을 사용했다.
// 'students.txt' 파일에 있는 정보를 불러옴. 학생의 이름과 점수

void main() async{
  
  File txtFile = File('students.txt');
  String content = await txtFile.readAsString(); // io. 하드디스크 메모리를 불러오는 코드라고 한다.
  List<String> lines = content.split('\n'); // 문자열을 분리해서 List에 담아준다고 한다.
  print(lines);
  // Line한줄씩 가져와서 이름과 점수를 분리해야 함
  List<StudentScore> studentList = []; // tudentScore의 리스트를 불러온다. 제네릭으로 데이터 타입을 명시해준다.
  
  // 파일의 리스트를 반복문으로 불러온다.
  for (var l in lines) {
    List<String> nameAndScore = l.split(','); // 변수이름을 정해주고 리스트 안의 정보에 띄어쓰기를 해준다.
    String name = nameAndScore[0]; // 리스트는 인덱스를 사용. 인덱스는 0부터 시작하기 때문에 0. 리스트 요소 중 첫번째인 이름을 불러온다.
    int score = int.parse(nameAndScore[1]); // 리스트 요소 중 두번째인 점수를 불러온다.
    // 객체를 만들어서
    StudentScore s = StudentScore(name, score);
    studentList.add(s);
   
    // print(nameAndScore); 
    // print(l);
  }

  print(studentList.length); // 실행. [홍길동,90, 김철수,80] 아래에 리스트 속 학생의 수 2가 출력된다. 
  // 여기까지가 1번 과제.

  // studentList를 호출해서 print 함수를 실행했는데 텍스트 파일의 학생 목록 2가지가 전부 출력이 되었다.
  for (var student in studentList) { 
   student.showInfo();
  }
  
}

// 필수정의. 1. 점수를 표현하기 위한 Score클래스
// 1) 학생의 이름과 점수가 담긴 클래스를 먼저 만들어준다.
class Score { // 점수를 표현하는 클래스를 만들어라.
  int scores;
  Score(this.scores); // 기본생성자. 

  void showInfo() {
    print("점수: $scores");
  }

}

// 2) `Score`의 상속을 받은 자식 클래스를 만들어준다.
class StudentScore extends Score {
  // 출력할 메서드를 만듦
  String name;
  StudentScore(this.name,super.scores); // 부모클래스의 기능을 확장할 때 `super.`을 사용해서 부모 속성을 초기화 시켜준다.
  
  @override // 상속받은 클래스에서 부모 메서드를 오버라이드 했다는 표시.
  void showInfo() {
    print("이름: $name, 점수: $scores");
  }
}
// 3) 클래스를 만들었으면 main으로 가서 

-------------트러블슈팅---------------
main에서 print 출력을 시도했으나 반복문 사용을 해야 하는 것에서 헤맸다.

/* // 1번째 시도. 텍스트 파일 불러오는 방법을 헤매서 정보를 직접 넣어서 출력을 해보았다.
   // 클래스의 구조는 만들었지만, 텍스트파일의 리스트를 출력하기 위한 방법을 찾지 못해서 구조가 맞는지 우선 실행해 보았다.
  Score s1 = Score(90); // ((90) 숫자를 넣으면 '점수: 90'이 정상 출력된다. 그런데 텍스트 파일에서 정보를 넘겨 받아서 출력하려니 어려워졌다.)
  s1.showInfo(); // 실행. 
  StudentScore s2 = StudentScore("홍길동", 90);
  s2.showInfo();
  */

  클래스의 구조는 만들고 값이 주어지면 정상 출력 되는 것 까지는 확인이 완료되었다.





## 2. 파일로부터 데이터 읽어오기 기능
[ 설명 ]
- 프로그램 시작 시 `students.txt`파일에서 학생들 점수 목록을 받아온다.
- **students.txt**
    
    ```dart
    홍길동,90
    김철수,80
    ```
    
- 이때 읽어온 데이터는 이후 3번 문제에서 **학생 점수를 조회**할때 사용됩니다.

[ 조건 ]
- 파일은 CSV 형식이며, 한 줄에 `이름,점수` 형태의 데이터가 저장되어 있다.
    - 각 줄을 읽어 `StudentScore` 객체로 변환하고, 
    이를 `List<StudentScore>`에 저장
- 힌트(예시 코드)
    - `dart:io` 라이브러리의 File 클래스를 사용하여 파일을 읽는다. 
    ([File 클래스 문서](https://api.dart.dev/stable/3.5.3/dart-io/File-class.html))
        
        ```dart
        import 'dart:io';
        
        void loadStudentData(String filePath) {
          try {
            final file = File(filePath);
            final lines = file.readAsLinesSync();
        
            for (var line in lines) {
              final parts = line.split(',');
              if (parts.length != 2) throw FormatException('잘못된 데이터 형식: $line');
        
              String name = parts[0];
              int score = int.parse(parts[1]);
            }
          } catch (e) {
            print("학생 데이터를 불러오는 데 실패했습니다: $e");
            exit(1);
          }
          return;
        }
        ```
        
        - `split()` 메서드를 사용하여 CSV 데이터를 분리한 후 변수(`name`, `score`)에 선언해준다.


## 3. 사용자로부터 입력 받아 학생 점수 확인 기능
[ 설명 ]
    - 프로그램 시작 시 사용자로부터 이름 정보를 입력 받는다.

[ 조건 ]
    - `"어떤 학생의 점수를 확인하시겠습니까?"`라는 메시지를 출력한다.
    - 사용자가 `"홍길동"`, `"김철수"`중 하나를 입력하면 해당 학생의 점수를 계산
        - 출력의 경우 StudentScore 클래스의 `showInfo()` 메서드를 통해 출력하면 됨
    - 다른 값이 입력되면 `"잘못된 학생 이름을 입력하셨습니다. 다시 입력해주세요."`를 출력하고 다시 입력을 받기
        - 이 동작은 올바른 값(홍길동/김철수)이 입력될 때까지 반복된다.


## 4. 프로그램 종료 후, 결과를 파일에 저장하는 기능
[ 설명 ]
    - 3번 기능이 실행된 뒤, 프로그램 종료 시 결과를 `result.txt` 파일에 저장

[ 조건 ]
    - 3번 과정에서 사용자가 올바른 값(`홍길동` 또는 `김철수`)을 입력한 경우, 해당 학생의 이름과 점수를 아래 형식으로 저장
    - 저장 형태
        
        ```dart
        이름: 홍길동, 점수: 90
        ```
        
    - 저장이 완료되면 `"저장이 완료되었습니다."`라는 메시지를 콘솔에 출력하기

[ 힌트 ]
    - `dart:io` 라이브러리의 `writeAsStringSync()` 을 이용하여 파일을 저장할 수 있다.
        
        ```dart
        import 'dart:io';
        
        void saveResults(String filePath, String content) {
          try {
            final file = File(filePath);
            file.writeAsStringSync(content);
            print("저장이 완료되었습니다.");
          } catch (e) {
            print("저장에 실패했습니다: $e");
          }
        }
        ```

## 코드 실행 예시

-> 터미널에서 학생의 이름을 입력하면 정보가 나온다!

어떤 학생의 통계를 확인하시겠습니까? 김영희
잘못된 학생 이름을 입력하셨습니다. 다시 입력해주세요.
어떤 학생의 통계를 확인하시겠습니까? 홍길동
이름: 홍길동, 점수: 90
저장이 완료되었습니다.


## 주의 사항

- 터미널이나 명령 프롬프트 등의 명령줄 인터페이스를 사용하여 구현
- 입력 받는 기능은 `dart:io` 라이브러리의 `stdin.readLineSync()` 를 사용합니다.
    - `stdin.readLineSync()` 는 입력한 값을 `String?` 타입의 값으로 반환하는 메서드입니다.
    - 현재 Windows 환경에서 프로그램을 실행하는 경우, 콘솔 기본 인코딩 문제로 입력값이 정상적으로 표시되지 않고 `?`로 출력될 수 있습니다.
    - 이를 방지하기 위해 `stdin.readLineSync(encoding: utf8);` **사용을 권장드립니다.**


# 도전 문제


## 트러블 슈팅하는 법



