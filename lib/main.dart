import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:charcode/html_entity.dart';


const album = './assets/album.jpg';
void main()=> runApp(Spotify());

class Spotify extends StatelessWidget{
  @override
  Widget build (BuildContext context){
    return MaterialApp(
      theme: ThemeData(fontFamily:'Gotham'),
      debugShowCheckedModeBanner: false,
      home: SpotifyScreen()
    );
  }
}

class SpotifyScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(colors: [Colors.red[900].withOpacity(0.81), Color(0x000000).withOpacity(1)],
          center: Alignment(-0.8, -2.5),
          radius: 2)
        ),
        child: Stack(
          children: <Widget>[
            SingleChildScrollView(
              padding: EdgeInsets.only(bottom:120),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Padding(padding: EdgeInsets.only(right:10, top:10), child:Icon(Icons.settings, color: Colors.white, size: 30,))
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(left:15, top:40),
                  child:Text('Bon après-midi', style: TextStyle(fontSize: 22, fontWeight:FontWeight.bold, color:Colors.white),textAlign: TextAlign.left,)),
                  GridView.builder(gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio:155/60),
                  shrinkWrap: true, 
                  primary: false,
                  itemCount: 6,
                  padding: EdgeInsets.only(left:15, right:15, top:10),
                  itemBuilder: (BuildContext context, int index){
                    return Card(
                      color: Color(0x2a2a2a).withOpacity(0.9),
                      child: FlatButton(onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>AlbumScreen())),
                      padding: EdgeInsets.all(0),
                      child: Container(
                        child: Row(
                          children: <Widget>[
                            Container(
                              height: 60,
                              width: 56,
                              decoration: BoxDecoration(
                                image: DecorationImage(image: AssetImage(album), fit:BoxFit.fitHeight)
                              ),
                            ),
                            Padding(padding: EdgeInsets.only(left:5), child:Text('After Hours', style: TextStyle(color:Colors.white, fontSize:12, fontWeight:FontWeight.bold),)),
                          ],
                        ),
                      )),
                    );
                  }),
                  Padding(padding: EdgeInsets.only(left: 15, top:40), child: Text('Écoutés récemment', style:TextStyle(fontSize: 22, color:Colors.white, fontWeight:FontWeight.bold))),
                  Container(
                    height: 180,
                    padding: EdgeInsets.only(top:20),
                    child: ListView.builder(
                      padding: EdgeInsets.only(left:15),
                      shrinkWrap: false,
                      primary: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: 20,
                      itemBuilder: (BuildContext context, int index){
                        return Card(
                          color:Colors.transparent,
                          margin: EdgeInsets.only(right:12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Container(
                                height: 112,
                                width: 112,
                                decoration: BoxDecoration(
                                  image: DecorationImage(image: AssetImage(album), fit:BoxFit.fitHeight)
                                ),
                              ),
                              Padding(padding: EdgeInsets.only(top:8), child:Text('After Hours', style: TextStyle(color:Colors.white, fontSize:12, fontWeight: FontWeight.bold),)),
                            ],
                          ),
                        );
                      }),
                  ),
                  Padding(padding: EdgeInsets.only(left:15, top:25), child:Text('Réécoutez vos anciens favoris', style:TextStyle(color:Colors.white, fontSize: 23, fontWeight: FontWeight.bold))),
                  Container(
                    height:222,
                    padding: EdgeInsets.only(top:20),
                    child: ListView.builder(
                      padding: EdgeInsets.only(left:15),
                      shrinkWrap: false,
                      primary: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: 20,
                      itemBuilder: (BuildContext context, int index){
                        return Card(
                          color:Colors.transparent,
                          margin: EdgeInsets.only(right:12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Container(
                                height: 150,
                                width: 150,
                                decoration: BoxDecoration(
                                  image: DecorationImage(image: AssetImage(album), fit:BoxFit.fitHeight)
                                ),
                              ),
                              Padding(padding: EdgeInsets.only(top:15), child:Text('After Hours', style: TextStyle(color:Colors.white, fontWeight: FontWeight.bold),)),
                              Padding(padding: EdgeInsets.only(top:5), child:Text('The Weeknd', style: TextStyle(color:Colors.white.withOpacity(0.5), fontWeight: FontWeight.bold),)),
                              ]
                          ),
                        );
                      }),
                  ),
                  Padding(padding: EdgeInsets.only(left:15, top:50), child:Text('Dernières sorties populaires', style: TextStyle(color:Colors.white, fontSize:23, fontWeight:FontWeight.bold),)),
                  Container(
                    height:222,
                    padding: EdgeInsets.only(top:20),
                    child: ListView.builder(
                      padding: EdgeInsets.only(left:15),
                      shrinkWrap: false,
                      primary: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: 20,
                      itemBuilder: (BuildContext context, int index){
                        return Card(
                          color:Colors.transparent,
                          margin: EdgeInsets.only(right:12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Container(
                                height: 150,
                                width: 150,
                                decoration: BoxDecoration(
                                  image: DecorationImage(image: AssetImage(album), fit:BoxFit.fitHeight)
                                ),
                              ),
                              Padding(padding: EdgeInsets.only(top:15), child:Text('After Hours', style: TextStyle(color:Colors.white, fontWeight: FontWeight.bold),)),
                              Padding(padding: EdgeInsets.only(top:5), child:Text('The Weeknd', style: TextStyle(color:Colors.white.withOpacity(0.5), fontWeight: FontWeight.bold),)),
                              ]
                          ),
                        );
                      }),
                  ),
                ],
              ),
            ),
            Footer()
          ],
        ),
      ),
    );
  }
}

class AlbumScreen extends StatelessWidget{
  List<List> song = [['Alone Again', true],['Too Late',true],['Hardest To Love', true],['Scared To Live',true],['Snowchild', true],
['Escape From LA', true],['Heartless', true],['Faith',true],['Blinding Lights', false],['In Your Eyes', true],['Save Your Tears', true],
['Repeat After Me (Interlude)', true],['After Hours',false],['Until I Bleed Out',true]];
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Color(0x282828).withOpacity(1),
        centerTitle: true,
        title: Text('After Hours', style: TextStyle(color:Colors.white, fontSize:16, fontWeight:FontWeight.bold)),
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Icon(Icons.favorite_border, color:Colors.white, size:30),
              Icon(Icons.more_vert, color:Colors.white, size:30),
            ],
          )
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(colors: [Colors.grey[400].withOpacity(0.81), Color(0x000000).withOpacity(1)],
          center: Alignment(0, -2),
          radius: 2)
        ),
        child: Stack(
          children: <Widget>[
            SingleChildScrollView(
              padding: EdgeInsets.only(bottom:120),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width/2.23,
                    margin: EdgeInsets.only(top:70),
                    decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage(album), fit:BoxFit.fitHeight)
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top:23, bottom:10), child: Text('After Hours', style: TextStyle(color:Colors.white, fontSize:23, fontWeight:FontWeight.bold),textAlign: TextAlign.center,)),
                  Text('Album par The Weeknd '+String.fromCharCode($bull)+' 2020', style: TextStyle(color:Colors.white.withOpacity(0.5),), textAlign: TextAlign.center,),
                  Container(
                    margin: EdgeInsets.only(left:50, right:50, top:20),
                    width: MediaQuery.of(context).size.width,
                    height: 48,
                    decoration: BoxDecoration(
                      color: Color(0x1db954).withOpacity(1),
                      borderRadius: BorderRadius.all(Radius.circular(50))
                    ),
                    child: Align(alignment:Alignment.center, child:Text('Lecture Aléatoire'.toUpperCase(), style: TextStyle(color:Colors.white, fontWeight:FontWeight.bold, letterSpacing: 2),textAlign: TextAlign.center,)),
                  ),
                  Padding(padding: EdgeInsets.only(left:15, right:15, bottom:15), child:Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Télécharger', style: TextStyle(color:Colors.white, fontWeight: FontWeight.bold, fontSize: 16),),
                    Switch(value: false, onChanged: null, inactiveTrackColor: Colors.grey[600],)
                  ],)),
                  ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: song.length,
                    itemBuilder: (BuildContext context, int index){
                        return Padding(padding: EdgeInsets.only(left:15, right:15, bottom:25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text.rich(TextSpan(children: [TextSpan(text:' '+song[index][0]+'\n', style:TextStyle(fontSize: 15)),
                            song[index][1]?WidgetSpan(child:Icon(Icons.explicit, color:Colors.white.withOpacity(0.5), size: 16,)):WidgetSpan(child: Container()),
                            TextSpan(text:' The Weeknd', style: TextStyle(color: Colors.white.withOpacity(0.5), height:1.6))]), textAlign: TextAlign.start, style: TextStyle(color:Colors.white),),
                            Icon(Icons.more_vert, size: 30,color: Colors.white.withOpacity(0.5),)
                          ],
                        ),);
                    }),
                  Container(padding: EdgeInsets.only(left:15),child: Row(
                    children: <Widget>[
                      Text.rich(TextSpan(children: [TextSpan(text:'20 mars 2020\n'), TextSpan(text: '14 titres '+String.fromCharCode($bull)+' 56 min 17 s', style: TextStyle(height:1.2))]), textAlign: TextAlign.left, style: TextStyle(fontSize:16, color:Colors.white),),])),
                    Container(
                        padding: EdgeInsets.only(left:15, top:18), child: Row(
                          children: <Widget>[
                            CircleAvatar(
                              radius: 25,
                              backgroundImage: AssetImage('./assets/artist.jpg'),
                            ),
                            Padding(padding: EdgeInsets.only(left:15), child: Text('The Weeknd', style:TextStyle(color:Colors.white, fontSize:16)),)
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(right:15, left:15, top:30, bottom:20),
                        child: Row(
                          children: <Widget>[
                            Flexible(child: Text('© ℗ 2020 The Weeknd XO, Inc., marketed by Republic Records, a division of UMG Re...', style:TextStyle(color:Colors.white, fontSize:16.5)))
                          ],
                        ),
                      )
                    ],
                  ),),
                  Footer()
                ],
              ),
            ),
    );
  }
}

class MusicScreen extends StatelessWidget{
  @override
  Widget build (BuildContext context){
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(colors: [Colors.red[900].withOpacity(0.81), Color(0x000000).withOpacity(1)],
          center: Alignment(-1, -1),
          radius: 2)
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(padding: EdgeInsets.only(top:30, left:15, right:15),
          child:Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Transform.rotate(angle: 45*math.pi/90, child:IconButton(icon: Icon(Icons.arrow_forward_ios, size:30, color:Colors.white), onPressed: ()=>Navigator.pop(context),)),
            Text.rich(TextSpan(children: <TextSpan>[
              TextSpan(text:"Lecture à partir de l'album\n".toUpperCase(), style:TextStyle(fontSize: 12)),
              TextSpan(text:'After Hours', style:TextStyle(fontWeight: FontWeight.bold))
            ]), textAlign: TextAlign.center, style: TextStyle(color:Colors.white,),),
            Icon(Icons.more_vert, size:30, color:Colors.white)
          ],)),
          Container(
            height:298,
            margin:EdgeInsets.only(left:32, right:32, top:30),
            decoration: BoxDecoration(
              color:Colors.blue,
              image: DecorationImage(image: AssetImage(album), fit:BoxFit.fitHeight)
            ),
          ),
          Padding(padding: EdgeInsets.only(left:32, right:32, top:45), child:Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text.rich(TextSpan(children: <TextSpan>[TextSpan(text: "After Hours\n", style:TextStyle(fontWeight: FontWeight.bold, fontSize:21)),
            TextSpan(text:'The Weeknd', style:TextStyle(color: Colors.white.withOpacity(0.8)))]), textAlign: TextAlign.start, style: TextStyle(color: Colors.white),),
            Icon(Icons.favorite_border, size:28, color: Colors.white,)
          ],)),
          Container(
            padding: EdgeInsets.only(left:32, right:32, top:28),
            child: Column(
              children: <Widget>[
                CustomPaint(
                  painter:  MyProgressLine(),
                  child: Container(width:double.infinity, height:3, padding:EdgeInsets.all(0)),
                ),
                Padding(padding: EdgeInsets.only(top:3), child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('2:40', style: TextStyle(color:Colors.white.withOpacity(0.7), fontSize:12),),
                  Text('6:01', style: TextStyle(color:Colors.white.withOpacity(0.7), fontSize:12),),
                ],))
              ],
            ),
          ),
          Container(padding:EdgeInsets.only(left:32, right:32, top:0), child:Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Icon(Icons.shuffle, size:25, color:Colors.white),
            Icon(Icons.skip_previous, size:45, color:Colors.white),
            Icon(Icons.play_circle_filled, size:70, color:Colors.white),
            Icon(Icons.skip_next, size:45, color:Colors.white),
            Icon(Icons.repeat, size:25, color:Colors.white),
          ],)),
          Container(
            padding: EdgeInsets.only(left:32, right:32, top:15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Icon(Icons.speaker, size:15, color:Colors.white),
                Icon(Icons.queue, size:15, color:Colors.white)
              ],
            ),
          )
        ],),
      ),
    );
  }
}

class MyProgressLine extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size){
    Paint paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 3.0
      ..style = PaintingStyle.stroke;
    
    double endPointRadius = 0.0;
    double width = size.width;

    var totalTime = 6.01;
    var currentTime = 2.4;
    double stepPerDay = width/totalTime;

    canvas.drawLine(Offset(endPointRadius, 0.0), Offset(endPointRadius+stepPerDay*currentTime, 0.0), paint);
    paint.style = PaintingStyle.stroke;
    paint.color = Colors.grey.withOpacity(0.5);
    canvas.drawLine(Offset(endPointRadius+stepPerDay*currentTime, 0.0), Offset(stepPerDay*totalTime, 0.0), paint);
    paint.style = PaintingStyle.fill;
    paint.color = Colors.white;
    canvas.drawCircle(Offset(endPointRadius+stepPerDay*currentTime, 0.0), 3.0, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate)=>false;
}

Route _createRoute(){
  return PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation)=>MusicScreen(),
  transitionsBuilder: (context, animation, secondaryAnimation, child) {
    var begin = Offset(0.0, 1.0);
    var end = Offset.zero;
    var curve = Curves.ease;

    var tween = Tween(begin:begin, end:end).chain(CurveTween(curve: curve));
    return SlideTransition(position: animation.drive(tween),
    child:child);
  },
  );
}

class Footer extends StatelessWidget{
  @override
  Widget build (BuildContext context){
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Container(
          color: Color(0x282828).withOpacity(1),
          child: Column(
            children: <Widget>[
              Container(
                height: 1.5,
                child: LinearProgressIndicator(
                  backgroundColor: Colors.transparent,
                  value:0.4,
                  valueColor: new AlwaysStoppedAnimation<Color>(Colors.white70.withOpacity(0.8)),
                ),
              ),
              FlatButton(onPressed: ()=>Navigator.of(context).push(_createRoute()),
              padding: EdgeInsets.all(0),
              child: Row(children: <Widget>[
                Container(
                  height: 62,
                  width: 62,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage(album), fit:BoxFit.fitHeight)
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left:10),
                  width: MediaQuery.of(context).size.width-150,
                  child: RichText(text: TextSpan(children: <TextSpan>[TextSpan(text: 'After Hours', style: TextStyle(color: Colors.white, fontWeight:FontWeight.bold)),
                  TextSpan(text:String.fromCharCode($bull)+' The Weeknd', style: TextStyle(color:Colors.white.withOpacity(0.5),))])),
                ),
                Icon(Icons.favorite_border, size: 30, color:Colors.white),
                Padding(padding: EdgeInsets.only(left:10, right:15), child:Icon(Icons.pause, size: 30, color:Colors.white))
              ],))
            ],
          ),
        ),
      Container(
        padding: EdgeInsets.only(top:5, bottom:5),
        decoration: BoxDecoration(
          border: Border(top:BorderSide()),
          color:Color(0x282828).withOpacity(1)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Column(
              children: <Widget>[
                Icon(Icons.home, size:30, color:Colors.white),
                Text('Accueil', style: TextStyle(color:Colors.white, fontSize: 12), textAlign: TextAlign.center,)
              ],
            ),
            Column(
              children: <Widget>[
                Icon(Icons.search, size:30, color:Colors.white.withOpacity(0.5)),
                Text('Rechercher', style: TextStyle(color:Colors.white.withOpacity(0.5), fontSize: 12), textAlign: TextAlign.center,)
              ],
            ),
            Column(
              children: <Widget>[
                Icon(Icons.library_music, size:30, color:Colors.white.withOpacity(0.5)),
                Text('Bibliothèque', style: TextStyle(color:Colors.white.withOpacity(0.5), fontSize: 12), textAlign: TextAlign.center,)
              ],
            ),
          ],
        ),
      )
      ],
    );
  }
}