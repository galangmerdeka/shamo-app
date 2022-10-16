import 'package:flutter/material.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});
  static const routeName = '/edit-profile';

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _nameController = TextEditingController();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final _dataName = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.cancel,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.check,
                color: Color.fromARGB(255, 107, 94, 207),
              ),
            ),
          )
        ],
        backgroundColor: Theme.of(context).colorScheme.background,
        title: Center(
          child: Text(
            'Edit Profile',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          // color: Colors.red,
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CircleAvatar(
                  backgroundColor: Color(0xFF38ABBE),
                  radius: 80,
                  child: Icon(
                    Icons.person,
                    size: 150,
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                'Name',
                style: Theme.of(context).textTheme.labelMedium,
              ),
              SizedBox(
                height: 20,
              ),
              FieldText(context, _nameController),
              SizedBox(
                height: 50,
              ),
              Text(
                'Username',
                style: Theme.of(context).textTheme.labelMedium,
              ),
              SizedBox(
                height: 20,
              ),
              FieldText(context, _usernameController),
              SizedBox(
                height: 50,
              ),
              Text(
                'Email Address',
                style: Theme.of(context).textTheme.labelMedium,
              ),
              SizedBox(
                height: 20,
              ),
              FieldText(context, _emailController),
            ],
          ),
        ),
      ),
    );
  }

  TextFormField FieldText(
      BuildContext context, TextEditingController varController) {
    return TextFormField(
      controller: varController,
      style: Theme.of(context).textTheme.labelMedium,
      decoration: InputDecoration(
        hintStyle: TextStyle(color: Colors.grey.shade700),
        fillColor: Colors.grey.shade900,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: Theme.of(context).inputDecorationTheme.enabledBorder,
      ),
    );
  }
}
