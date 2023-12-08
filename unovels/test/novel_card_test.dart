// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_firebase/view/screens/home_screen.dart';
// import 'package:flutter_firebase/view/screens/novel_description.dart';
// import '../../model/novel_model.dart';

// class NovelCard extends StatefulWidget {
//   const NovelCard({super.key});

//   @override
//   State<NovelCard> createState() => _NovelCardState();
// }

// class _NovelCardState extends State<NovelCard> {
//   Novela? novela;
//   @override
//   void initState() {
//     super.initState();
//     // getNovela();
//   }

//   Future<Novela> getNovela() async {
//     // final response = await Dio().get('http://192.168.1.89:80/api/novelas');
//     final response = await Dio().get('http://10.0.2.2:80/api/novelas');
//     return Novela.fromJson(response.data[0]);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: FutureBuilder(
//         future: getNovela(),
//         builder: (BuildContext context, AsyncSnapshot<Novela> novelita) =>
//             ListView(
//           children: [
//             Container(
//               decoration: BoxDecoration(
//                 border: Border.all(
//                     color: Colors.black,
//                     width: 1.0), // Ajusta el color y el ancho del borde
//                 borderRadius: BorderRadius.all(Radius.circular(
//                     1)), // Ajusta el radio de la esquina del borde
//               ),
//               padding: EdgeInsets.all(10.0),
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Column(
//                     children: [
//                       Image.network(
//                         novelita.requireData.image,
//                         height:
//                             300.0, // Ajusta la altura de la imagen según tus necesidades
//                       ),
//                       SizedBox(
//                         height: 40,
//                       ),
//                       ElevatedButton(
//                         onPressed: () {
//                           // Navegar a otra pantalla al presionar el botón
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) =>
//                                   NovelDescription(), // Reemplaza OtraPantalla() con el nombre de tu clase de pantalla
//                             ),
//                           );
//                         },
//                         style: ElevatedButton.styleFrom(primary: Colors.black),
//                         child: Text(
//                           'LEER NOVELA',
//                           style: TextStyle(color: Colors.white),
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(
//                       width:
//                           10.0), // Ajusta el espacio entre la imagen y el texto
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           novelita.requireData.name,
//                           style: TextStyle(
//                             fontSize: 24.0,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         SizedBox(
//                             height:
//                                 1.0), // Ajusta el espacio entre el nombre y la descripción
//                         Text(
//                           novelita.requireData.description,
//                           style: TextStyle(fontSize: 16.0),
//                         ),
//                         // Agrega aquí otros elementos según sea necesario
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Container(
//               decoration: BoxDecoration(
//                 border: Border.all(
//                     color: Colors.black,
//                     width: 1.0), // Ajusta el color y el ancho del borde
//                 borderRadius: BorderRadius.all(Radius.circular(
//                     1)), // Ajusta el radio de la esquina del borde
//               ),
//               padding: EdgeInsets.all(10.0),
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Column(
//                     children: [
//                       Image.network(
//                         novelita.requireData.image,
//                         height:
//                             300.0, // Ajusta la altura de la imagen según tus necesidades
//                       ),
//                       SizedBox(
//                         height: 40,
//                       ),
//                       ElevatedButton(
//                         onPressed: () {
//                           // Navegar a otra pantalla al presionar el botón
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) =>
//                                   NovelDescription(), // Reemplaza OtraPantalla() con el nombre de tu clase de pantalla
//                             ),
//                           );
//                         },
//                         style: ElevatedButton.styleFrom(primary: Colors.black),
//                         child: Text(
//                           'LEER NOVELA',
//                           style: TextStyle(color: Colors.white),
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(
//                       width:
//                           10.0), // Ajusta el espacio entre la imagen y el texto
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           novelita.requireData.name,
//                           style: TextStyle(
//                             fontSize: 24.0,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         SizedBox(
//                             height:
//                                 1.0), // Ajusta el espacio entre el nombre y la descripción
//                         Text(
//                           novelita.requireData.description,
//                           style: TextStyle(fontSize: 16.0),
//                         ),
//                         // Agrega aquí otros elementos según sea necesario
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Container(
//               decoration: BoxDecoration(
//                 border: Border.all(
//                     color: Colors.black,
//                     width: 1.0), // Ajusta el color y el ancho del borde
//                 borderRadius: BorderRadius.all(Radius.circular(
//                     1)), // Ajusta el radio de la esquina del borde
//               ),
//               padding: EdgeInsets.all(10.0),
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Column(
//                     children: [
//                       Image.network(
//                         novelita.requireData.image,
//                         height:
//                             300.0, // Ajusta la altura de la imagen según tus necesidades
//                       ),
//                       SizedBox(
//                         height: 40,
//                       ),
//                       ElevatedButton(
//                         onPressed: () {
//                           // Navegar a otra pantalla al presionar el botón
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) =>
//                                   NovelDescription(), // Reemplaza OtraPantalla() con el nombre de tu clase de pantalla
//                             ),
//                           );
//                         },
//                         style: ElevatedButton.styleFrom(primary: Colors.black),
//                         child: Text(
//                           'LEER NOVELA',
//                           style: TextStyle(color: Colors.white),
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(
//                       width:
//                           10.0), // Ajusta el espacio entre la imagen y el texto
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           novelita.requireData.name,
//                           style: TextStyle(
//                             fontSize: 24.0,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         SizedBox(
//                             height:
//                                 1.0), // Ajusta el espacio entre el nombre y la descripción
//                         Text(
//                           novelita.requireData.description,
//                           style: TextStyle(fontSize: 16.0),
//                         ),
//                         // Agrega aquí otros elementos según sea necesario
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Container(
//               decoration: BoxDecoration(
//                 border: Border.all(
//                     color: Colors.black,
//                     width: 1.0), // Ajusta el color y el ancho del borde
//                 borderRadius: BorderRadius.all(Radius.circular(
//                     1)), // Ajusta el radio de la esquina del borde
//               ),
//               padding: EdgeInsets.all(10.0),
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Column(
//                     children: [
//                       Image.network(
//                         novelita.requireData.image,
//                         height:
//                             300.0, // Ajusta la altura de la imagen según tus necesidades
//                       ),
//                       SizedBox(
//                         height: 40,
//                       ),
//                       ElevatedButton(
//                         onPressed: () {
//                           // Navegar a otra pantalla al presionar el botón
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) =>
//                                   NovelDescription(), // Reemplaza OtraPantalla() con el nombre de tu clase de pantalla
//                             ),
//                           );
//                         },
//                         style: ElevatedButton.styleFrom(primary: Colors.black),
//                         child: Text(
//                           'LEER NOVELA',
//                           style: TextStyle(color: Colors.white),
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(
//                       width:
//                           10.0), // Ajusta el espacio entre la imagen y el texto
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           novelita.requireData.name,
//                           style: TextStyle(
//                             fontSize: 24.0,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         SizedBox(
//                             height:
//                                 1.0), // Ajusta el espacio entre el nombre y la descripción
//                         Text(
//                           novelita.requireData.description,
//                           style: TextStyle(fontSize: 16.0),
//                         ),
//                         // Agrega aquí otros elementos según sea necesario
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Container(
//               decoration: BoxDecoration(
//                 border: Border.all(
//                     color: Colors.black,
//                     width: 1.0), // Ajusta el color y el ancho del borde
//                 borderRadius: BorderRadius.all(Radius.circular(
//                     1)), // Ajusta el radio de la esquina del borde
//               ),
//               padding: EdgeInsets.all(10.0),
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Column(
//                     children: [
//                       Image.network(
//                         novelita.requireData.image,
//                         height:
//                             300.0, // Ajusta la altura de la imagen según tus necesidades
//                       ),
//                       SizedBox(
//                         height: 40,
//                       ),
//                       ElevatedButton(
//                         onPressed: () {
//                           // Navegar a otra pantalla al presionar el botón
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) =>
//                                   NovelDescription(), // Reemplaza OtraPantalla() con el nombre de tu clase de pantalla
//                             ),
//                           );
//                         },
//                         style: ElevatedButton.styleFrom(primary: Colors.black),
//                         child: Text(
//                           'LEER NOVELA',
//                           style: TextStyle(color: Colors.white),
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(
//                       width:
//                           10.0), // Ajusta el espacio entre la imagen y el texto
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           novelita.requireData.name,
//                           style: TextStyle(
//                             fontSize: 24.0,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         SizedBox(
//                             height:
//                                 1.0), // Ajusta el espacio entre el nombre y la descripción
//                         Text(
//                           novelita.requireData.description,
//                           style: TextStyle(fontSize: 16.0),
//                         ),
//                         // Agrega aquí otros elementos según sea necesario
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Container(
//               decoration: BoxDecoration(
//                 border: Border.all(
//                     color: Colors.black,
//                     width: 1.0), // Ajusta el color y el ancho del borde
//                 borderRadius: BorderRadius.all(Radius.circular(
//                     1)), // Ajusta el radio de la esquina del borde
//               ),
//               padding: EdgeInsets.all(10.0),
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Column(
//                     children: [
//                       Image.network(
//                         novelita.requireData.image,
//                         height:
//                             300.0, // Ajusta la altura de la imagen según tus necesidades
//                       ),
//                       SizedBox(
//                         height: 40,
//                       ),
//                       ElevatedButton(
//                         onPressed: () {
//                           // Navegar a otra pantalla al presionar el botón
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) =>
//                                   NovelDescription(), // Reemplaza OtraPantalla() con el nombre de tu clase de pantalla
//                             ),
//                           );
//                         },
//                         style: ElevatedButton.styleFrom(primary: Colors.black),
//                         child: Text(
//                           'LEER NOVELA',
//                           style: TextStyle(color: Colors.white),
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(
//                       width:
//                           10.0), // Ajusta el espacio entre la imagen y el texto
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           novelita.requireData.name,
//                           style: TextStyle(
//                             fontSize: 24.0,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         SizedBox(
//                             height:
//                                 1.0), // Ajusta el espacio entre el nombre y la descripción
//                         Text(
//                           novelita.requireData.description,
//                           style: TextStyle(fontSize: 16.0),
//                         ),
//                         // Agrega aquí otros elementos según sea necesario
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );

//     //Scaffold(
//     //     body: FutureBuilder(
//     //   future: getNovela(),
//     //   builder: (BuildContext context, AsyncSnapshot<Novela> novelita) =>
//     //       ListView(
//     //     children: [
//     //       Column(
//     //         children: [
//     //           Column(
//     //             crossAxisAlignment: CrossAxisAlignment.start,
//     //             children: [
//     //               Image.network(novelita.requireData.image),
//     //               Container(
//     //                 margin: EdgeInsets.all(8.0),
//     //                 child: Text(novelita.requireData.name),
//     //               ),
//     //               Container(
//     //                 margin: EdgeInsets.all(8.0),
//     //                 child: Text(novelita.requireData.description),
//     //               )
//     //             ],
//     //           )
//     //         ],
//     //       ),
//     //     ],
//     //   ),
//     // ));
//   }
// }
