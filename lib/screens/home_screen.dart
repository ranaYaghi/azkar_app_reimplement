import 'package:azkar_app_reimplement/screens/faqs_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _counter = 0;
  String _content = 'أستغفر الله';

  @override
  Widget build(BuildContext context) {
    return (
        //طريقة نعرفها وننساها لقلب التطبيق عربي لازم كل واجهة احطها
        // Directionality(
        //   textDirection: TextDirection.rtl,
        //child:
        Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        actionsIconTheme: IconThemeData(color: Color(0xFFECB390)),
        actions: [
          PopupMenuButton<String>(onSelected: (String value) {
            if (_content != value) {
              setState(() {
                _content = value;
                _counter = 0;
              });
            }
          }, itemBuilder: (context) {
            return [
              PopupMenuItem(
                child: Text(
                  'أستغفر الله',
                  style: GoogleFonts.arefRuqaa(),
                ),
                value: 'أستغفر الله',
                height: 10,
              ),
              PopupMenuDivider(),
              PopupMenuItem(
                child: Text(
                  'سبحان الله',
                  style: GoogleFonts.arefRuqaa(),
                ),
                value: 'سبحان الله',
                height: 10,
              ),
              PopupMenuDivider(),
              PopupMenuItem(
                child: Text(
                  'الحمد لله',
                  style: GoogleFonts.arefRuqaa(),
                ),
                value: 'الحمد لله',
                height: 10,
              )
            ];
          }),
          IconButton(
              onPressed: () {
                //   Navigator.pushNamed<Map<String,dynamic>> هاد لنوع المرجع ونا راجع مش ونا رايح
                //حددت نوع المرجع مش المرسل
                // <String, dynamic> ------ map argumnetsحددت انو ال
                Navigator.pushNamed/*<Map<String,dynamic>>*/(
                    context, '/info_screen',
                    arguments: <String, dynamic>{'message': 'Info Screen'});
              },
              icon: Icon(Icons.info)),
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    //  أذا وددت تمرير بيانات دون ان تنتظر ان build تشتغل
                    //نقل بيانات عن طريقconstructor
                    MaterialPageRoute(
                        builder: (context) => FaqsScreen(
                              message: 'FAQs Screen',
                            )));
              },
              icon: Icon(Icons.question_answer))
        ],

        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        //بيفحص ال back stack  هل يوجد واجهات للرجوع لها وبحط زر رجوع لحاله وممكن أشيله
        //automaticallyImplyLeading: false, // زر الرجوع لالغائه
        title: Text(
          'مسبحة الأذكار',
          style: GoogleFonts.arefRuqaa(color: Color(0xFFECB390)),
        ),
      ),
      body: Container(
          decoration: const BoxDecoration(
            gradient:
                LinearGradient(colors: [Color(0xFF94B49F), Color(0xFFCEE5D0)]),
          ),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              width: 70,
              height: 70,
              decoration: const BoxDecoration(
                  //To Make Circle 1)
                  //  shape: BoxShape.rectangle,
                  // borderRadius: BorderRadius.circular(35),
                  // 2)
                  shape: BoxShape.circle,
                  //not allowed to use with borderRaduis
                  color: Color(0xFFECB390),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          'https://i.etsystatic.com/22795080/r/il/a09c19/3289853929/il_340x270.3289853929_jkqr.jpg')),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black45,
                        blurRadius: 5, //درجة تشتت اللون
                        offset: Offset(0, 3)),

                    // BoxShadow(
                    //   color: Colors.pink.withOpacity(.5),
                    //   blurRadius: 5,
                    //   offset: Offset(0,-6)
                    // )
                  ]),
            ),
            Container(
              clipBehavior: Clip.antiAlias,
              //لضبط حواف الأبناء متل الأب
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              height: 60,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black45,
                        blurRadius: 6,
                        offset: Offset(0, 0))
                  ]),

              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      _content,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.arefRuqaa(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    width: 50,
                    height: 60,
                    color: const Color(0xFFCEE5D0),
                    alignment: Alignment.center,
                    child: Text(_counter.toString(),
                        style: GoogleFonts.arefRuqaa(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(children: [
                Expanded(
                    flex: 2,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 8),
                            primary: const Color(0xFFECB390),
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadiusDirectional.only(
                                    topStart: Radius.circular(10)))),
                        onPressed: () {
                          //المحتوى الداخلي الخاص بالواجهة ذاتها
                          //local state not app state
                          //Ephemeral State Management
                          //SingleScreen State Management
                          //Stateful state Management
                          // setState(() =>_counter++ );
                          setState(() {
                            _counter++;
                          });
                        },
                        child: Text(
                          'تسبيح',
                          style: GoogleFonts.arefRuqaa(color: Colors.black45),
                        ))),
                Expanded(
                  flex: 1,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        primary: const Color(0xFFCEE5D0),
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadiusDirectional.only(
                                bottomEnd: Radius.circular(10)))),
                    onPressed: () {
                      setState(() {
                        _counter = 0;
                      });
                    },
                    child: Text(
                      'إعادة',
                      style: GoogleFonts.arefRuqaa(color: Colors.black45),
                    ),
                  ),
                ),
              ]),
            )
          ])),
    ));

    // );
  }
}
