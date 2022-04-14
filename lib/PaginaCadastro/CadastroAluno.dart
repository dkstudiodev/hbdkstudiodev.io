// import 'package:flutter/material.dart';
//
// class CadastroAluno extends StatefulWidget {
//   const CadastroAluno({Key? key}) : super(key: key);
//
//   @override
//   _CadastroAlunoState createState() => _CadastroAlunoState();
// }
//
// class _CadastroAlunoState extends State<CadastroAluno> {
//   String? value;
//
//   @override
//   Widget build(BuildContext context) {
//     final professores = [
//       'Marcella',
//       'italo',
//       'Ruan',
//       'Nagao',
//       'Dener',
//       'Lele',
//       'Carol',
//       'Gladson'
//     ];
//     String? value;
//
//     String professorEscolhido;
//     return Scaffold(
//       body: Container(
//         child: DropdownButton<String>(
//             value: value,
//             items: professores.map(buildMenuItem).toList(),
//             onChanged: (value) => setState(() => this.value = value)),
//       ),
//     );
//   }
// }
