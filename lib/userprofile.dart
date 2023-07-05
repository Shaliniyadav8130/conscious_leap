import 'package:flutter/material.dart';

class Profile {
  String name;
  String email;
  String bio;

  Profile({this.name='', this.email='', this.bio=''});
}

class UpdateProfilePage extends StatefulWidget {
  @override
  _UpdateProfilePageState createState() => _UpdateProfilePageState();
}

class _UpdateProfilePageState extends State<UpdateProfilePage> {
  Profile profile = Profile(name: 'John Doe', email: 'johndoe@example.com', bio: 'A software developer.');

  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController bioController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: profile.name);
    emailController = TextEditingController(text: profile.email);
    bioController = TextEditingController(text: profile.bio);
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    bioController.dispose();
    super.dispose();
  }

  void updateProfile() {
    setState(() {
      profile.name = nameController.text;
      profile.email = emailController.text;
      profile.bio = bioController.text;
    });
  }

  void goToProfilePage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ProfilePage(profile: profile)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Profile'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CircleAvatar(
              radius: 64,
              backgroundImage: AssetImage('assets/images/doctor.jpg'),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Name',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: bioController,
              decoration: InputDecoration(
                labelText: 'Bio',
              ),
              maxLines: 3,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                updateProfile();
                goToProfilePage();
              },
              child: Text('Update'),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  final Profile? profile;

  ProfilePage({this.profile});

  void goToEditProfilePage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EditProfilePage(profile: profile)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () => goToEditProfilePage(context),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CircleAvatar(
              radius: 64,
              backgroundImage: AssetImage('assets/images/doctor.jpg'),
            ),
            SizedBox(height: 16.0),
            Text('Name: ${profile?.name ?? ""}'),
            SizedBox(height: 16.0),
            Text('Email: ${profile?.email ?? ""}'),
            SizedBox(height: 16.0),
            Text('Bio: ${profile?.bio ?? ""}'),
          ],
        ),
      ),
    );
  }
}

class EditProfilePage extends StatefulWidget {
  final Profile? profile;

  EditProfilePage({this.profile});

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController bioController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.profile?.name ?? '');
    emailController = TextEditingController(text: widget.profile?.email ?? '');
    bioController = TextEditingController(text: widget.profile?.bio ?? '');
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    bioController.dispose();
    super.dispose();
  }

  void updateProfile() {
    if (widget.profile != null) {
      widget.profile!.name = nameController.text;
      widget.profile!.email = emailController.text;
      widget.profile!.bio = bioController.text;
    }

    Navigator.pop(context); // Go back to the profile page after updating
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CircleAvatar(
              radius: 64,
              backgroundImage: AssetImage('assets/images/doctor.jpg'),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Name',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: bioController,
              decoration: InputDecoration(
                labelText: 'Bio',
              ),
              maxLines: 3,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: updateProfile,
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
