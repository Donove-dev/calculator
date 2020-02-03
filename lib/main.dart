import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Donove Calculator',
      theme: ThemeData(primarySwatch: Colors.orange),
      home: CalcPage(),
    );
  }
}

///
/// 四则运算页
class CalcPage extends StatefulWidget {
  @override
  _CalcPageState createState() => _CalcPageState();
}

class _CalcPageState extends State<CalcPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Donove 计算器')),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                  // 所占据空间的比重, 这里是382/(382+618),即占据 38.2%的高度
                  flex: 382,
                  child: Column(children: <Widget>[
                    // 历史结果
                    Expanded(child: HistoryDisplay()),
                    // 计算表达式
                    ExpressDisplay(),
                  ])),
              // 分割线
              Divider(color: Colors.black45),
              Expanded(flex: 618, child: Keyboard()),
            ],
          ),
        ),
      ),
    );
  }
}

///
/// 历史结果区
class HistoryDisplay extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HistoryDisplayState();
}

class _HistoryDisplayState extends State<HistoryDisplay> {
  @override
  Widget build(BuildContext context) => ListView(
        children: <Widget>[],
      );
}

///
/// 表达式区
class ExpressDisplay extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ExpressDisplayState();
}

class _ExpressDisplayState extends State<ExpressDisplay> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Text("0", style: TextStyle(fontSize: 45)),
        ],
      ),
    );
  }
}

///
/// 按键区
class Keyboard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _KeyBoardState();
  }
}

class _KeyBoardState extends State<Keyboard> {
  static const List<CalcKey> keys = [
    CalcKey(code: 'AC', color: Colors.deepOrangeAccent),
    CalcKey(
        code: 'del',
        icon: Icon(Icons.backspace, color: Colors.deepOrangeAccent)),
    CalcKey(code: '%', color: Colors.deepOrangeAccent),
    CalcKey(code: '÷', color: Colors.deepOrangeAccent),
    //
    CalcKey(code: '7'),
    CalcKey(code: '8'),
    CalcKey(code: '9'),
    CalcKey(code: 'x', color: Colors.deepOrangeAccent),
    //
    CalcKey(code: '4'),
    CalcKey(code: '5'),
    CalcKey(code: '6'),
    CalcKey(code: '-', color: Colors.deepOrangeAccent),
    //
    CalcKey(code: '1'),
    CalcKey(code: '2'),
    CalcKey(code: '3'),
    CalcKey(code: '+', color: Colors.deepOrangeAccent),
    //
    CalcKey(
      code: 'rotation',
      icon: Icon(Icons.screen_rotation, color: Colors.deepOrangeAccent),
    ),
    CalcKey(code: '0'),
    CalcKey(code: '.'),
    CalcKey(code: '=', color: Colors.deepOrangeAccent),
  ];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.horizontal,
      alignment: WrapAlignment.spaceAround,
      runAlignment: WrapAlignment.spaceAround,
      children: keys,
    );
  }
}

///
/// 按键 Widget
class CalcKey extends StatelessWidget {
  final String code;
  final Icon icon;
  final Color color;

  const CalcKey({Key key, this.code, this.icon, this.color: Colors.black})
      : super(key: key);

  // FractionallySizedBox 可以指定控件占父控件大小的百分比, 下面的0.25即占父控件宽度的25%
  @override
  Widget build(BuildContext context) => FractionallySizedBox(
        widthFactor: 0.25,
        child: icon != null
            ? IconButton(
                onPressed: () {
                  // todo 点击事件
                },
                icon: icon)
            : FlatButton(
                child: Text(
                  '$code',
                  style: TextStyle(
                      color: color, fontSize: 30, fontWeight: FontWeight.w400),
                ),
                onPressed: () {
                  //todo 点击事件
                },
              ),
      );
}
