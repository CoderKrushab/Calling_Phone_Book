import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import '../Model/model.dart';
import '../Variables/variables.dart';

class viewpage extends StatefulWidget {
  const viewpage({Key? key}) : super(key: key);

  @override
  State<viewpage> createState() => _viewpageState();
}

class _viewpageState extends State<viewpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(
                height: 150,
              ),
              Card(
                elevation: 5,
                child: ListTile(
                  title: const Text(
                    "Home",
                    style: TextStyle(fontSize: 20),
                  ),
                  leading: const Icon(
                    Icons.home_rounded,
                    size: 25,
                    color: Colors.black,
                  ),
                  trailing: IconButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return const viewpage();
                          },
                        ));
                      },
                      icon: const Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Colors.black,
                      )),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Card(
                elevation: 5,
                child: ListTile(
                  title: const Text(
                    "Setting",
                    style: TextStyle(fontSize: 20),
                  ),
                  leading: const Icon(
                    Icons.settings,
                    color: Colors.black,
                    size: 25,
                  ),
                  trailing: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Colors.black,
                      )),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Card(
                elevation: 5,
                child: ListTile(
                  title: const Text(
                    "Privacy",
                    style: TextStyle(fontSize: 20),
                  ),
                  leading: const Icon(
                    Icons.privacy_tip_outlined,
                    color: Colors.black,
                    size: 25,
                  ),
                  trailing: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.arrow_forward_ios_outlined,
                          color: Colors.black)),
                ),
              ),
              const Spacer(),
              const Text("Version"),
              const Text("8.5.7:261"),
              const SizedBox(
                height: 50,
              )
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: const Text("Contact"),
        actions: [
          GestureDetector(
            onTap: () {
              setState(() {
                themecolorbool = !themecolorbool;
              });
            },
            child: CircleAvatar(
              radius: 18,
              backgroundColor:
                  (themecolorbool) ? Colors.black12 : Colors.white54,
              child: CircleAvatar(
                radius: 14,
                backgroundColor: Theme.of(context).textTheme.titleMedium?.color,
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert_rounded),
          ),
        ],
      ),
      body: (contactdetail.isEmpty)
          ? Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "images/box.png",
                    height: 150,
                    color: Theme.of(context).textTheme.titleMedium?.color,
                  ),
                  SelectableText(
                    "You have no contacts yet",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                ],
              ),
            )
          : ListView.builder(
              itemCount: contactdetail.length,
              itemBuilder: (val, i) {
                return contactudf(contactdetail[i]);
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed("insert_page");
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget contactudf(e) {
    return ListTile(
      onTap: () {
        setState(() {
          Navigator.of(context).pushNamed("contact_details", arguments: e);
        });
      },
      leading: CircleAvatar(
        radius: 24,
        backgroundImage: (e.img != null)
            ? FileImage(e.img!)
            : (themecolorbool)
                ? const AssetImage("images/profile.png")
                : const AssetImage("images/p.png") as ImageProvider,
        backgroundColor: (themecolorbool) ? Colors.white : Colors.grey,
      ),
      title: Text(
        "${e.firstname} ${e.lastname}",
        style: const TextStyle(fontSize: 18),
      ),
      subtitle: Text(
        "+91 ${e.number}",
        style: const TextStyle(fontSize: 16, color: Colors.grey),
      ),
      trailing: IconButton(
        onPressed: () async {
          await FlutterPhoneDirectCaller.callNumber("+91${e.number}");
        },
        icon: const Icon(
          Icons.call,
          color: Colors.green,
          size: 30,
        ),
      ),
    );
  }
}
