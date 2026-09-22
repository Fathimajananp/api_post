import 'package:api2_pgm_post/api_service.dart';
import 'package:flutter/material.dart';

import 'modal_class/post_modal.dart';

class CreateUserDisplay extends StatefulWidget {
  const CreateUserDisplay({super.key});

  @override
  State<CreateUserDisplay> createState() => _CreateUserDisplayState();
}

class _CreateUserDisplayState extends State<CreateUserDisplay> {
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController jobcontroller = TextEditingController();

  Future<Createuser>? _futureUser;

  void createUser() {
    setState(() {
      _futureUser = ApiService().createUser(
        namecontroller.text,
        jobcontroller.text,
      );
    });
  }

  @override
  void dispose() {
    namecontroller.dispose();
    jobcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: namecontroller,
              decoration: const InputDecoration(
                hintText: 'Enter Name',
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 20),

            TextField(
              controller: jobcontroller,
              decoration: const InputDecoration(
                hintText: 'Enter job',
                labelText: 'job',
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 25),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: createUser,
                child: const Text('Create User'),
              ),
            ),
            SizedBox(height: 25),

            // API Response
            if (_futureUser != null)
            FutureBuilder<Createuser>(
              future: _futureUser,
              builder: (context, snapshot) {

                // Loading
                if (snapshot.connectionState == ConnectionState.waiting){
                  return const CircularProgressIndicator();
                }

                //error
                if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }

                //success
                if (snapshot.hasData) {
                  final user = snapshot.data!;

                  return Column(
                    children: [
                      Text('User Created Successfully',style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),),
                      SizedBox(height: 10,),
                      Text('Name: ${user.name}'),
                      Text('Job: ${user.job}'),
                      Text('ID: ${user.id}'),

                    ],
                  );
                }

                return SizedBox();

              },
            ),
          ],
        ),
      ),
    );
  }
}
