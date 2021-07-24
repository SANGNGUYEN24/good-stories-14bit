import 'package:good_stories/styles/constant.dart';

import '../styles/image_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

final List<String> imageURL = [
  'https://muanhaanhquoc.com.vn/wp-content/uploads/2021/04/20201126100059760lam-gi-o-london-mien-phi-36-0.jpg',
  'https://muanhaanhquoc.com.vn/wp-content/uploads/2021/04/20201126100059760lam-gi-o-london-mien-phi-36-0.jpg',
  'https://muanhaanhquoc.com.vn/wp-content/uploads/2021/04/20201126100059760lam-gi-o-london-mien-phi-36-0.jpg',
];

class CreateStory extends StatefulWidget {
  const CreateStory({Key? key}) : super(key: key);

  @override
  _CreateStoryState createState() => _CreateStoryState();
}

class _CreateStoryState extends State<CreateStory> {
  @override
  Widget build(BuildContext context) {
    return _handlePickedFiles();
  }

  Widget _handlePickedFiles() {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.navigate_before),
            color: Colors.white,
            onPressed: () {},
          ),
          title: imageURL.length == 1 ? Text('New image') : Text('New album'),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: getGradient(),
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.all(10.0),
              child: ElevatedButton(
                child: Text("Public", style: TextStyle(fontSize: 16)),
                style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                    backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF69B4)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.white)))),
                onPressed: () => null,
              ),
            )
          ],
        ),
        body: Column(
          children: [
            SwitchListTile(
              title: Text('Private'),
              value: false, //TODO: isSwitched,
              onChanged: (value) {
                //TODO
                /*setState(() {
                  isSwitched = value;
                  print(isSwitched);
                });*/
              },
              activeTrackColor: Color(orangeCustom),
              activeColor: Color(pinkCustom),
            ),
            Container(
              margin: EdgeInsets.symmetric(),
              height: 250.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: imageURL.length, //TODO: add image list
                itemBuilder: (context, index) {
                  return Container(
                    child: image_display(imageURL[index]),
                  );
                },
              ),
            ),
            Flexible(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 16),
                child: TextField(
                  controller: null, //TODO: add textcontroller
                  onSubmitted: null, //TODO: add story handler
                  keyboardType: TextInputType.multiline,
                  maxLines: 20,
                  decoration: InputDecoration.collapsed(
                    hintText: 'Add a stoty',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        width: 5,
                        style: BorderStyle.none,
                        color: Color(pinkCustom),

                      ),
                    ),
                    //filled: true,
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
