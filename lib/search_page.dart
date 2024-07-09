import 'package:flutter/material.dart';
import 'profile_page.dart';
import 'threads_home.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController _searchController = TextEditingController();
  List<String> _usernames = ['kingbrander_', 'Johanx_90'];

  List<String> _searchResults = [];

  Color homeIconColor = Colors.grey;
  Color searchIconColor = Colors.black;
  Color writeIconColor = Colors.grey;
  Color loveIconColor = Colors.grey;
  Color profileIconColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Container(
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.search, color: Colors.grey),
              ),
              Expanded(
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Search',
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                  style: TextStyle(color: Colors.black),
                  onChanged: (value) {
                    setState(() {
                      _searchResults = _usernames
                          .where((username) => username
                              .toLowerCase()
                              .contains(value.toLowerCase()))
                          .toList();
                    });
                  },
                ),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.home, color: homeIconColor),
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
        ],
      ),
      body: _buildSearchResults(),
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
                      builder: (context) => ProfilePage(username: "")),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchResults() {
    if (_searchResults.isEmpty) {
      return Center(
        child: Text(
          'No results found',
          style: TextStyle(fontSize: 18),
        ),
      );
    } else {
      return ListView.builder(
        itemCount: _searchResults.length,
        itemBuilder: (context, index) {
          return _buildListItem(
            username: _searchResults[index],
            threadText: 'Thread',
            time: '25h',
            avatarImage: 'assets/images/avatar_placeholder.png',
            contentImage: 'assets/images/gambar.jpeg',
            replies: '141 replies . 820 likes',
          );
        },
      );
    }
  }

  Widget _buildListItem({
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
                      Icon(Icons.favorite_border, size: 24),
                      SizedBox(width: 8),
                      Icon(Icons.chat_bubble_outline, size: 24),
                      SizedBox(width: 8),
                      Icon(Icons.share, size: 24),
                      SizedBox(width: 8),
                      Icon(Icons.send, size: 24),
                    ],
                  ),
                  Icon(Icons.bookmark_border, size: 24),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 12,
                        backgroundImage: AssetImage(avatarImage),
                      ),
                      SizedBox(width: 7),
                      Text(
                        replies,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 4),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
