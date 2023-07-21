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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
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
  bool switchKontrol = false;
  var tfController = TextEditingController();
  bool? kotlinDurum = false;
  bool? dartDurum = false;
  int radioDeger = 0;
  bool progressBarGorun = false;
  String alinanveri= " ";
  double sliderIlerleme = 50.0;
  var tfSaat= TextEditingController();
  var ulkelerListe = <String>[];
  String secilenUlke = "Turkiye";


  @override
  void initState() {
    super.initState();
    ulkelerListe.add("Türkiye");
    ulkelerListe.add("İtalya");
    ulkelerListe.add("Almanya");
    ulkelerListe.add("Rusya");
    ulkelerListe.add("Çin");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
           // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: tfController,
                  //obscureText: true, (şifre)
                  keyboardType: TextInputType.datetime,
                  style: TextStyle(color: Colors.deepOrange),//girilen değerin rengi
                  textAlign: TextAlign.center,//içindeki yazıyı ortaladı
                  maxLength: 4,//karakter sayısı 4ü geçemez
                  decoration: InputDecoration(
                    hintText: "Yazınız",
                    hintStyle: TextStyle(
                      color: Colors.red,//yazınız ın rengi
                    ),
                    labelText: "Email",
                  ),
                ),
              ),
              ElevatedButton(onPressed: (){
                setState(() {
                  alinanveri=tfController.text;
                });
              },
                  child: Text("Veriyi al"),
                style: ElevatedButton.styleFrom(
                  shadowColor: Colors.black,//gölge rengi
                  elevation: 10,//gölge derinliği
                  shape: BeveledRectangleBorder(//köşe şekli
                    borderRadius: BorderRadius.all(Radius.circular(10)),//köşe kıvrım oranı
                    side: BorderSide(color: Colors.red),//çerçeve eklendi
                  ),
                ),
             ), 
              Text("Gelen Veri : $alinanveri",
              style: TextStyle(
                color: Colors.red,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              ),
              Switch(value: switchKontrol, onChanged: (veri){
                setState(() {
                  switchKontrol = veri;
                });
                print("Switch : $veri");
              }),
              CheckboxListTile(
              title: Text("Kotlin"),
              value: kotlinDurum,
                controlAffinity: ListTileControlAffinity.leading,
                onChanged: (newbool){
                print("Kotlin seçildi $newbool");
                setState(() {
                  kotlinDurum = newbool ;
                });
                },
              ),
              CheckboxListTile(
                title: Text("Dart"),
                value: dartDurum,
                controlAffinity: ListTileControlAffinity.leading,
                onChanged: (newbool){
                  print("Dart seçildi $newbool");
                  setState(() {
                    dartDurum = newbool ;
                  });
                },
              ),
              RadioListTile(
                  title: Text("Galatasaray"),
                  value: 1,
                  groupValue: radioDeger,
                  onChanged: (newdeger){
                  setState(() {
                  radioDeger=newdeger!;
                  });
                  print("galatasaray seçildi");

                  }),
              RadioListTile(
                  title: Text("Fenerbahçe"),
                  value: 2,
                  groupValue: radioDeger,
                  onChanged: (newdeger){
                    setState(() {
                      radioDeger=newdeger!;
                    });
                    print("fenerbahçe seçildi");

                  }),
              Visibility(
                visible: progressBarGorun,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.deepPurple),
 ),
              ),
               Text("Slider değer: ${sliderIlerleme.toInt()}"),
               Slider(
            max: 100,
            min: 0,
            value: sliderIlerleme,
            onChanged: (newilerle){
              setState(() {
                sliderIlerleme = newilerle;
              });
            },  ),
                TextField(
                  controller: tfSaat,
                  decoration: InputDecoration(
                    hintText: "Saat Giriniz",
                  ),
                  onTap: (){
                    showTimePicker(context: context,
                        initialTime: TimeOfDay.fromDateTime(DateTime.now()),
                    ).then((alinanSaat){
                      setState(() {
                        tfSaat.text ="${alinanSaat!.hour}:${alinanSaat.minute}";
                      });
                    } );
                  },
                ),
              /*DropdownButton<String>(
                   value: secilenUlke,
                   items: ulkelerListe.map<DropdownMenuItem<String>>((String value){
                     return DropdownMenuItem<String>(
                       value: value,
                       child: Text("Ülke $value",style: TextStyle(color: Colors.deepPurple,fontSize: 20),),
                     );


                     }).toList(),
                   icon: Icon(Icons.arrow_drop_down),
                onChanged: (secilenveri){
                     setState(() {
                       secilenUlke = secilenveri!;
                     });
                },
              ),*/
                     
            ],
          
          ),

        ),
      ),
       floatingActionButton: FloatingActionButton( //Üzerinde yazı olması için FloatingActionButton.extended
         onPressed: (){
           print("Fab1 e tıklandı");
         },
         tooltip: "Fab1",
         child: Icon(Icons.audiotrack),
         backgroundColor: Colors.deepPurple,
         foregroundColor: Colors.pink,
       ),
    );
  }
}
