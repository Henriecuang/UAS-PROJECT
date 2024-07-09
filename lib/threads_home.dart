import 'package:flutter/material.dart';
import 'login_page.dart';
import 'search_page.dart';
import 'profile_page.dart';

class ThreadsHomeScreen extends StatefulWidget {
  const ThreadsHomeScreen({Key? key}) : super(key: key);

  @override
  _ThreadsHomeScreenState createState() => _ThreadsHomeScreenState();
}

class _ThreadsHomeScreenState extends State<ThreadsHomeScreen> {
  Color homeIconColor = Colors.black;
  Color searchIconColor = Colors.grey;
  Color writeIconColor = Colors.grey;
  Color loveIconColor = Colors.grey;
  Color profileIconColor = Colors.grey;

  String? username;
  Map<int, List<String>> comments = {}; // Map untuk menyimpan komentar

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/threads_logo.jpeg',
                height: 40,
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.add),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                homeIconColor = Colors.grey;
                searchIconColor = Colors.grey;
                writeIconColor = Colors.grey;
                loveIconColor = Colors.grey;
                profileIconColor = Colors.black;
              });
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfilePage(username: username ?? ""),
                ),
              );
            },
            icon: Icon(Icons.account_circle, color: profileIconColor),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 2,
        itemBuilder: (context, index) {
          if (!comments.containsKey(index)) {
            comments[index] = [];
          }
          return _buildListItem(
            index: index,
            username: index == 0 ? 'kingbrander_' : 'Johanx_90',
            threadText: index == 0 ? 'thread' : 'Wht a life bro ?!!',
            time: index == 0 ? '25h' : '5 h',
            avatarImage: index == 0
                ? 'assets/images/download.jpeg'
                : 'assets/images/logo_dicoding.jpeg',
            contentImage: index == 0
                ? 'assets/images/gambar.jpeg'
                : 'assets/images/user.jpg',
            replies: index == 0
                ? '141 replies . 820 likes'
                : '99 replies . 700 likes',
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white10,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.home, size: 40, color: homeIconColor),
              onPressed: () {
                setState(() {
                  homeIconColor = Colors.black;
                  searchIconColor = Colors.grey;
                  writeIconColor = Colors.grey;
                  loveIconColor = Colors.grey;
                  profileIconColor = Colors.grey;
                });
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ThreadsHomeScreen()),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.search, size: 40, color: searchIconColor),
              onPressed: () {
                setState(() {
                  homeIconColor = Colors.grey;
                  searchIconColor = Colors.black;
                  writeIconColor = Colors.grey;
                  loveIconColor = Colors.grey;
                  profileIconColor = Colors.grey;
                });
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SearchPage()),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.create, size: 40, color: writeIconColor),
              onPressed: () {
                setState(() {
                  homeIconColor = Colors.grey;
                  searchIconColor = Colors.grey;
                  writeIconColor = Colors.black;
                  loveIconColor = Colors.grey;
                  profileIconColor = Colors.grey;
                });
              },
            ),
            IconButton(
              icon: Icon(Icons.favorite_border, size: 40, color: loveIconColor),
              onPressed: () {
                setState(() {
                  homeIconColor = Colors.grey;
                  searchIconColor = Colors.grey;
                  writeIconColor = Colors.grey;
                  loveIconColor = Colors.black;
                  profileIconColor = Colors.grey;
                });
              },
            ),
            IconButton(
              icon:
                  Icon(Icons.account_circle, size: 40, color: profileIconColor),
              onPressed: () {
                setState(() {
                  homeIconColor = Colors.grey;
                  searchIconColor = Colors.grey;
                  writeIconColor = Colors.grey;
                  loveIconColor = Colors.grey;
                  profileIconColor = Colors.black;
                });
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfilePage(username: username ?? ""),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListItem({
    required int index,
    required String username,
    required String threadText,
    required String time,
    required String avatarImage,
    required String contentImage,
    required String replies,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage(avatarImage),
                  ),
                  SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        username,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 4),
                      Text(
                        threadText,
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  Spacer(),
                  Text(
                    time,
                    style: TextStyle(color: Colors.grey),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.more_horiz),
                  ),
                ],
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(contentImage),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          if (username == null) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginPage(),
                              ),
                            );
                          } else {
                            _showCommentDialog(context, index);
                          }
                        },
                        icon: Icon(Icons.chat_bubble_outline, size: 24),
                      ),
                      SizedBox(width: 8),
                      Text(
                        replies,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  Icon(Icons.bookmark_border, size: 24),
                ],
              ),
            ),
            for (var comment in comments[index]!)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(comment),
              ),
          ],
        ),
      ),
    );
  }

  void _showCommentDialog(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Add Comment"),
          content: TextField(
            decoration: InputDecoration(hintText: "Enter your comment"),
            onSubmitted: (comment) {
              setState(() {
                comments[index]!.add(comment);
              });

              Navigator.of(context).pop();
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Cancel"),
            ),
          ],
        );
      },
    );
  }
}
