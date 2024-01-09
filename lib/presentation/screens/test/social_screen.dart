import 'package:flutter/material.dart';

class SocialScreen extends StatelessWidget {
  static const String name = "social_screen";

  const SocialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const itemCount = 7;
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Social"),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.qr_code),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu),
          )
        ],
      ),
      body: DefaultTabController(
        length: 3,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    SizedBox(
                      height: 400,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          CircleAvatar(
                            radius: 100,
                            backgroundColor: colors.primary,
                            child: const CircleAvatar(
                              radius: 97,
                              backgroundImage: NetworkImage("https://media.licdn.com/dms/image/D5603AQE9KXVzS8TOiA/profile-displayphoto-shrink_800_800/0/1700478739094?e=1708560000&v=beta&t=lG-ZWAlCho9a-BBFiKcu0-3z21vAQAtmCPZMgNgVGkM")
                            ),
                          ),
                          const Column(
                            children: [
                              Text(
                                "Kristoffer",
                                style: TextStyle(fontSize: 30),
                              ),
                              Text(
                                "@k1ngg",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          const Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    "$itemCount",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "Posts",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text("450",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  Text("Followers",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                              Column(
                                children: [
                                  Text("60",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  Text("Follow",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ];
          },
          body: Column(
            children: [
              Container(
                color: colors.background,
                child: const TabBar(
                  tabs: <Widget>[
                    Column(
                      children: [
                        Icon(Icons.grid_view_rounded, size: 30),
                        Text("Gallery")
                      ],
                    ),
                    Column(
                      children: [
                        Icon(Icons.person_add_alt_sharp, size: 30),
                        Text("Social")
                      ],
                    ),
                    Column(
                      children: [
                        Icon(Icons.person_2_sharp, size: 30),
                        Text("About me")
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    GridView.builder(
                      itemCount: itemCount,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 2.0,
                        mainAxisSpacing: 2.0,
                      ),
                      itemBuilder: (context, index) {
                        final image = index.toString();
                        return InkWell(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ClipRRect(
                                    clipBehavior: Clip.hardEdge,
                                    borderRadius: BorderRadius.circular(18),
                                    child: Image.network(
                                      "https://picsum.photos/id/$image/600/350",
                                      fit: BoxFit.cover,
                                      height: 500,
                                    
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          child: Ink.image(
                            image: NetworkImage("https://picsum.photos/id/$image/600/350"),
                            height: double.infinity,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                    ),
                    const Text("Hola"),
                    const Text("Hola"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
