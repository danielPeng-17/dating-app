import 'package:duos_ui/screens/profile_creation_game.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:duos_ui/providers/profile_provider.dart';

class ProfileCreationBio extends StatefulWidget {
  const ProfileCreationBio({Key? key}) : super(key: key);

  @override
  State<ProfileCreationBio> createState() => _ProfileCreationBioState();
}

class _ProfileCreationBioState extends State<ProfileCreationBio> {
  final GlobalKey<FormState> _bioForm = GlobalKey<FormState>();
  TextEditingController descInput = TextEditingController();
  TextEditingController hobbiesInput = TextEditingController();
  TextEditingController languagesInput = TextEditingController();
  TextEditingController pronounsInput = TextEditingController();
  TextEditingController datingPrefInput = TextEditingController();
  TextEditingController locationInput = TextEditingController();

  @override
  void dispose() {
    descInput.dispose();
    hobbiesInput.dispose();
    languagesInput.dispose();
    pronounsInput.dispose();
    datingPrefInput.dispose();
    locationInput.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Center(
        child: Form(
          key: _bioForm,
          child: ListView(
            //Listview is a fix in order to prevent overflow, (scrollable) works well needs formatting
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: SizedBox(
                  width: 250,
                  height: 100,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Text.rich(
                  TextSpan(
                    children: <InlineSpan>[
                      WidgetSpan(
                        child: Icon(
                          Icons.create_sharp,
                          color: Colors.black,
                          size: 25,
                        ),
                      ),
                      TextSpan(text: ' Profile Creation'),
                    ],
                  ),
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Text("Write your bio",
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 3),
                child: Text("Description", style: TextStyle(fontSize: 12)),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                child: TextFormField(
                  controller: descInput,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Description is required';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Tell us about yourself',
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 3),
                child: Text("Hobbies", style: TextStyle(fontSize: 12)),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                child: TextFormField(
                  controller: hobbiesInput,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Hobbies field is required';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'E.g. Badminton, Chess, Gaming',
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 3),
                child:
                    Text("Dating Preference", style: TextStyle(fontSize: 12)),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                child: TextFormField(
                  controller: datingPrefInput,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Dating preference field is required';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'E.g. Male, Female, Non-Binary',
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 3),
                child: Text("Languages", style: TextStyle(fontSize: 12)),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                child: TextFormField(
                  controller: languagesInput,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Language field is required';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'E.g. English, French, Spanish',
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 3),
                child: Text("Pronouns", style: TextStyle(fontSize: 12)),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                child: TextFormField(
                  controller: pronounsInput,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Pronouns field is required';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'E.g. She/He/They',
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 3),
                child: Text("Location", style: TextStyle(fontSize: 12)),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                child: TextFormField(
                  controller: locationInput,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Description is required';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'City, Country',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Center(
                    child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black.withOpacity(0),
                          onPrimary: Colors.black.withOpacity(0),
                          elevation: 20, // Elevation
                          shadowColor:
                              Colors.black.withOpacity(0), // Shadow Color
                        ),
                        icon: Image.asset(
                            "assets/images/profile_creation_next.png",
                            width: 100,
                            height: 100),
                        label: Text(""),
                        onPressed: () {
                          if (_bioForm.currentState!.validate()) {
                            context.read<ProfileProvider>().setBio(descInput.text);
                            context
                                .read<ProfileProvider>()
                                .setHobbies(hobbiesInput.text);
                            context
                                .read<ProfileProvider>()
                                .setDatingPref(datingPrefInput.text);
                            context
                                .read<ProfileProvider>()
                                .setLanguages(languagesInput.text);
                            context
                                .read<ProfileProvider>()
                                .setGender(pronounsInput.text);
                            context
                                .read<ProfileProvider>()
                                .setLocation(locationInput.text);

                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    const ProfileCreationGame()));
                          }
                          // Validate returns true if the form is valid, or false otherwise.
                          // if (_formKey.currentState!.validate()) {
                          //   // If the form is valid, display a snackbar. In the real world,
                          //   // you'd often call a server or save the information in a database.
                          //   ScaffoldMessenger.of(context).showSnackBar(
                          //     const SnackBar(content: Text('Processing Data')),
                          //   );
                          // }
                        })),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
