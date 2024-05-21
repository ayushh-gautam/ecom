import 'package:ecom/core/constants/app_color.dart';
import 'package:ecom/features/buy/presentation/pages/home/main_page.dart';
import 'package:ecom/multibloc_provider.dart';
import 'package:ecom/service_locator.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  await setupLocators();

  runApp(const MultiBlocProviderClass(MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: AppColor.scaffoldColor,
          appBarTheme: AppBarTheme(color: AppColor.white)),
      title: 'Ecomm',
      home: const MainPage(),
    );
  }
}


  // import 'package:flutter/material.dart';

  // void main(List<String> args) {
  //   runApp(MaterialApp(
  //     home: MyButton(),
  //   ));
  // }

  // class MyButton extends StatefulWidget {
  //   const MyButton({super.key});

  //   @override
  //   State<MyButton> createState() => _MyButtonState();
  // }

  // List<int> selectedbutton = [];

  // class _MyButtonState extends State<MyButton> {
  //   @override
  //   Widget build(BuildContext context) {
  //     return Scaffold(
  //       body: ListView.builder(
  //         itemCount: 4,
  //         itemBuilder: (context, index) {
  //           final bool isSelected = selectedbutton.contains(index); //checks whether the button is selected or not.
  //           return GestureDetector(
  //             onTap: () {
  //               setState(() {
  //                 isSelected
  //                     ? selectedbutton.remove(index)
  //                     : selectedbutton.add(index);
  //               });
  //             },
  //             child: Container(
  //               margin: const EdgeInsets.symmetric(horizontal: 500, vertical: 5),
  //               padding: const EdgeInsets.all(20),
  //               decoration: BoxDecoration(
  //                   color:
  //                       isSelected ? Colors.red.shade300 : Colors.grey.shade300,
  //                   borderRadius: BorderRadius.circular(20)),
  //               child: const Text('Hola Amigooo'),
  //             ),
  //           );
  //         },
  //       ),
  //     );
  //   }
  // }
