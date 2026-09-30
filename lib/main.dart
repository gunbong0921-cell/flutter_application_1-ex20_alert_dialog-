import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // 대화창에서 입력된 내용 저장
  String _sPersonName = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 버튼을 누르면 대화창 실행
            ElevatedButton(
              child: const Text(
                'show AlertDialog',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
              onPressed: () => _showAlertDialog(context, 'hello~'),
            ),
          ],
        ),
      ),
    );
  }

  // void showAlertDialog() async {
  // 대화창은 비동기 방식으로 동작하도록 설계됨
  Future _showAlertDialog(BuildContext context, String message) async {
    await showDialog(
      context: context,
      /**
      화면의 빈곳을 눌러도 창이 닫히지 않게 설정. true인 경우 창이 닫이게 된다. 
       */
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        // 대화창의 테마 설정
        return Theme(
          data: ThemeData(
            dialogTheme: const DialogThemeData(backgroundColor: Colors.orange),
          ),
          child: AlertDialog(
            // 모서리 부분을 라운딩 처리
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            // 타이틀 설정
            title: Text('AlertDialog Example'),
            content: SizedBox(
              height: 90,
              child: Column(
                children: [
                  //매개변수로 전달받은 텍스트를 출력
                  Text(message),
                  // 입력상자
                  TextField(
                    /**
                    대화창이 열릴때 자동으로 포커싱됨. 이 경우 입력을 위해 키보드가 자동으로 올라온다. 
                     */
                    // autofocus: true,
                    // 입력상자 힌트 설정
                    decoration: InputDecoration(
                      labelText: 'Name',
                      hintText: '홍길동',
                    ),
                    // 내용이 변경될때 를 감지하는 이벤트 핸들러
                    onChanged: (value) {
                      // 입력된 내용을 전역변수에 저장
                      _sPersonName = value;
                    },
                  ),
                ],
              ),
            ),
            // 대화창 우측하단의 버튼
            actions: [
              ElevatedButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.pop(context, 'OK');
                  debugPrint('OK - $_sPersonName');
                },
              ),
              ElevatedButton(
                child: const Text('Cancel'),
                onPressed: () {
                  // 버튼을 누르면 대화창이 닫힘
                  Navigator.pop(context, 'Cancel');
                  // 입력된 내용을 콘솔에 출력
                  debugPrint('Cancel');
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
