// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:line_awesome_flutter/line_awesome_flutter.dart';

// import '../../../app/services/auth/auth_firebase_storage.dart';
// import '../../../domain/entities/user.dart';
// import '../../controllers/profile/profile_controller.dart';

// class UpdateProfileScreen extends StatelessWidget {
//   const UpdateProfileScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final controller2 = Get.put(AuthFirebaseService());
//     RxBool passwordVisible = false.obs;
//     return Scaffold(
//         appBar: PreferredSize(
//           preferredSize: const Size.fromHeight(50.0),
//           child: AppBar(
//             centerTitle: true,
//             elevation: 0,
//             backgroundColor: const Color(0xFF1AB151).withOpacity(0.3),
//             title: const Text(
//               'Modifier votre profil',
//               style: TextStyle(color: Colors.black),
//             ),
//           ),
//         ),
//         body: SingleChildScrollView(
//             child: Container(
//           decoration: BoxDecoration(
//               color: Colors.white,
//               gradient: LinearGradient(
//                 begin: FractionalOffset.topCenter,
//                 end: FractionalOffset.bottomCenter,
//                 colors: [
//                   const Color(0xFF1AB151).withOpacity(0.3),
//                   // AppColors.colorDegrade,
//                   // HexColor.fromHex(SelectedDayColor).withOpacity(0.40),
//                   const Color.fromARGB(255, 157, 255, 193).withOpacity(0.2),
//                   Colors.white,
//                   Colors.white,
//                 ],
//                 stops: [0.1, 0.2, 0.8, 0.9],
//               )),
//           padding: EdgeInsets.all(30),
//           child: FutureBuilder(
//             future: controller2.isUserLoggedIn(),
//             builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.done) {
//                 if (snapshot.hasData) {
//                   CurrentUser userData = GetStorage().read('CurrentUser');
//                   return Column(children: [
//                     Stack(
//                       children: [
//                         SizedBox(
//                           height: 120,
//                           width: 140,
//                           child: CachedNetworkImage(
//                             imageUrl: userData.image_pp,
//                             imageBuilder: (context, imageProvider) => Container(
//                               width: 180,
//                               height: 180,
//                               decoration: BoxDecoration(
//                                 shape: BoxShape.circle,
//                                 image: DecorationImage(
//                                     image: imageProvider, fit: BoxFit.cover),
//                               ),
//                             ),
//                             placeholder: (context, url) =>
//                                 const CircularProgressIndicator(),
//                             errorWidget: (context, url, error) =>
//                                 const Icon(Icons.error),
//                           ),
//                         ),
//                         Positioned(
//                           bottom: 0,
//                           right: 0,
//                           child: GestureDetector(
//                             onTap: () {},
//                             child: Container(
//                               width: 35,
//                               height: 35,
//                               decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(100),
//                                   color: Colors.green),
//                               child: const Icon(
//                                 LineAwesomeIcons.camera,
//                                 size: 20,
//                                 color: Colors.white,
//                               ),
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     Form(
//                         child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         TextFormField(
//                           decoration: const InputDecoration(
//                               label: Text("Nom Complet"),
//                               prefixIcon: Icon(Icons.person_outline_rounded)),
//                         ),
//                         const SizedBox(height: 30 - 20),
//                         TextFormField(
//                           decoration: const InputDecoration(
//                               label: Text("e-mail"),
//                               prefixIcon: Icon(Icons.email_rounded)),
//                         ),
//                         const SizedBox(height: 30 - 20),
//                         TextFormField(
//                           decoration: const InputDecoration(
//                               label: Text("Telephone"),
//                               prefixIcon: Icon(Icons.numbers_rounded)),
//                         ),
//                         const SizedBox(height: 30 - 20),
//                         Obx(() => TextFormField(
//                               obscureText: !passwordVisible.value,
//                               decoration: InputDecoration(
//                                   label: Text("Mot de passe"),
//                                   prefixIcon: Icon(Icons.fingerprint_rounded),
//                                   suffixIcon: IconButton(
//                                       onPressed: () {
//                                         passwordVisible.value =
//                                             !passwordVisible.value;
//                                       },
//                                       icon: Icon(
//                                         !passwordVisible.value
//                                             ? Icons.visibility
//                                             : Icons.visibility_off,
//                                         color:
//                                             Theme.of(context).primaryColorDark,
//                                       ))),
//                             )),
//                         const SizedBox(height: 30 - 10),
//                         Obx(() => TextFormField(
//                               obscureText: !passwordVisible.value,
//                               decoration: InputDecoration(
//                                   label:
//                                       const Text("Confirmez le mot de passe"),
//                                   prefixIcon: Icon(Icons.check_circle_outlined),
//                                   suffixIcon: IconButton(
//                                       onPressed: () {
//                                         passwordVisible.value =
//                                             !passwordVisible.value;
//                                       },
//                                       icon: Icon(
//                                         !passwordVisible.value
//                                             ? Icons.visibility
//                                             : Icons.visibility_off,
//                                         color:
//                                             Theme.of(context).primaryColorDark,
//                                       ))),
//                             )),
//                         const SizedBox(
//                           height: 30 - 10,
//                         ),
//                         SizedBox(
//                             width: double.infinity,
//                             child: ElevatedButton(
//                                 onPressed: () {},
//                                 child: const Text("Modifier")))
//                       ],
//                     )),
//                   ]);
//                 } else if (snapshot.hasError) {
//                   return Center(child: Text(snapshot.error.toString()));
//                 } else {
//                   return const Center(child: Text("Erreur de chargement"));
//                 }
//               } else {
//                 return const Center(child: Text(""));
//               }
//             },
//           ),
//         )));
//   }
// }
