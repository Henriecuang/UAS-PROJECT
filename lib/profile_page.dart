import 'package:flutter/material.dart';
import 'search_page.dart';
import 'threads_home.dart';

class ProfilePage extends StatefulWidget {
  String username;

  ProfilePage({Key? key, required this.username}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool homeActive = false;
  bool searchActive = false;
  bool writeActive = false;
  bool loveActive = false;
  bool profileActive = true;

  void _editProfile() {
    _showEditProfileDialog();
  }

  void _shareProfile() {
    print('Share Profile');
  }

  void _showEditProfileDialog() {
    String newUsername = widget.username;
    String newProfileImage = 'assets/images/download.jpeg';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              title: Text("Edit Profile"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    decoration: InputDecoration(labelText: "New Username"),
                    onChanged: (value) {
                      setState(() {
                        newUsername = value;
                      });
                    },
                  ),
                  SizedBox(height: 10),
                  TextButton(
                    onPressed: () {
                      print('Change Profile Picture');
                      setState(() {
                        newProfileImage =
                            'assets/images/new_profile_image.jpeg';
                      });
                    },
                    child: Text("Change Profile Picture"),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Cancel"),
                ),
                TextButton(
                  onPressed: () {
                    print('Save Changes');
                    setState(() {
                      widget.username = newUsername;
                    });
                    Navigator.pop(context);
                  },
                  child: Text("Save"),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Spacer(),
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                _editProfile();
              },
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundImage:
                          AssetImage('assets/images/download.jpeg'),
                    ),
                    SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.username,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Followers: 500',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    _editProfile();
                  },
                  child: Text(
                    'Edit Profile',
                    style: TextStyle(color: Colors.black),
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    _shareProfile();
                  },
                  child: Text(
                    'Share Profile',
                    style: TextStyle(color: Colors.black),
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                  ),
                ),
              ],
            ),
          ),
          Divider(
            color: Colors.white,
            thickness: 1,
            height: 0,
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white10,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.home,
                  size: 40, color: homeActive ? Colors.black : Colors.grey),
              onPressed: () {
                setState(() {
                  homeActive = true;
                  searchActive = false;
                  writeActive = false;
                  loveActive = false;
                  profileActive = false;
                });
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ThreadsHomeScreen()),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.search,
                  size: 40, color: searchActive ? Colors.black : Colors.grey),
              onPressed: () {
                setState(() {
                  homeActive = false;
                  searchActive = true;
                  writeActive = false;
                  loveActive = false;
                  profileActive = false;
                });
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SearchPage()),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.create,
                  size: 40, color: writeActive ? Colors.black : Colors.grey),
              onPressed: () {
                setState(() {
                  homeActive = false;
                  searchActive = false;
                  writeActive = true;
                  loveActive = false;
                  profileActive = false;
                });
              },
            ),
            IconButton(
              icon: Icon(Icons.favorite_border,
                  size: 40, color: loveActive ? Colors.black : Colors.grey),
              onPressed: () {
                setState(() {
                  homeActive = false;
                  searchActive = false;
                  writeActive = false;
                  loveActive = true;
                  profileActive = false;
                });
              },
            ),
            IconButton(
              icon: Icon(Icons.account_circle,
                  size: 40, color: profileActive ? Colors.black : Colors.grey),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
