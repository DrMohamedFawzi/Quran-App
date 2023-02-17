import 'package:flutter/material.dart';
import 'package:quran_app/data.dart';
 import 'package:quran_app/quran_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );

  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

 late PageController pageController ;
  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 1);
  }


  int pageNumber = 1;


  List<String> currentPage = [''] ;

  List<String> allPages = [''];

 Future<QuranModel> getData() async{
   QuranModel quranModel ;
  Map<String,dynamic> data = await DataQuran().getData(pageNumber);
  quranModel = QuranModel.fromJson(data);
   return quranModel ;
  }

  String addAnotherPage(QuranModel quranModel){

    String allAyats = ''  ;
    for(int i =0 ; i<quranModel.data!.ayahs!.length; i++){
      allAyats += quranModel.data!.ayahs![i].text! ;
    }

    return allAyats;
 }

  Widget buildIndicator(){
   return const Center(
     child:  CircularProgressIndicator(
       color: Colors.blue,
     ),
   );
  }

  @override
  Widget build(BuildContext context)  {



    return Scaffold(
      backgroundColor:   const Color(0xfffbf2d6),
      body: SafeArea(
        child: FutureBuilder(
          future: getData(),
          builder: (context , snapshot) {
           if(snapshot.data != null){
          //   isVisible =  ;
             return Column(
               children: [
               const  SizedBox(
                   height: 10,
                 ),
                 Row(
                   children:   [
                    const  SizedBox(
                       width: 20,
                     ),
                    Text('${pageNumber -1  == 0 ? '' : pageNumber -1 } '),
                     const Spacer(),
                    //  Text(snapshot.data!.data!.surahs!.s2!.name!),
                  const    SizedBox(
                       width: 20,
                     )
                   ],
                 ),

                 Container(
                   height: 550,
                   child: PageView.builder(
                     controller: pageController,
                     itemCount: 114,


                     itemBuilder: (c , i){
                       return Text(  pageNumber -1 != 0 ?   currentPage.isNotEmpty ? currentPage[0] : allPages[pageNumber -1]  : 'القران الكريم' , textAlign: TextAlign.justify, style: const TextStyle(
                           fontSize: 22 ,
                           fontFamily: 'Kitab-Regular'
                       ),) ;
                     },
                   ),
                 ),
             const    Spacer(),
                 Row(
                   children: [
                   const  SizedBox(
                       width: 10,
                     ),
                     TextButton(
                       onPressed: () {
                         setState(()   {
                          currentPage.clear();
                             pageNumber++;
                                if(pageNumber >= allPages.length ) {
                                  currentPage.add(addAnotherPage(snapshot.data!));
                                  allPages.add(addAnotherPage(snapshot.data!));
                           }
                         });
                       },
                       child: const Text("الصفحة التالية"),
                     ),
                    const Spacer(),
                     Text('${pageNumber -1  == 0 ? '' : pageNumber -1 }'),
                    const Spacer(),
                     TextButton(
                       onPressed: () {
                         setState(() {
                           if(pageNumber > 0){
                             currentPage.clear();
                             pageNumber--;
                           }
                         });
                       },
                       child: const Text("الصفحة السابقة"),
                     ),
                    const SizedBox(
                       width: 10,
                     )
                   ],
                 ),
               ],
             );
           }else{
             return buildIndicator();
           }
          }
        ),
      ),
    );
  }
}