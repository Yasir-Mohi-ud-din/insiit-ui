import 'package:flutter/material.dart';

class ModularResultCard extends StatefulWidget {
  final Map<String, dynamic> params;
  final Function? parentOnPressed;
  const ModularResultCard({
    super.key,
    required this.params,
    this.parentOnPressed,
  });
  @override
  State<ModularResultCard> createState() => _ModularResultCardState();
}

class _ModularResultCardState extends State<ModularResultCard> {
  bool hasTitle = false;
  bool hasCallback = false;
  Map<String, dynamic> params = {};
  Function? parentOnPressed = () => {};
  @override
  void initState() {
    super.initState();
    params = widget.params;
    hasTitle = params['title'] != null;
    hasCallback = params['callback'] != null;
    parentOnPressed = widget.parentOnPressed;
  }
  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
                        //  final double width = size.width;
                        //  final double height = size.height;
    return TextButton(
        onPressed: hasCallback ? onPressed : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
        ),
        child: SizedBox(
          
          width: double.infinity,
          child: Card(
            margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 1.5),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 10, bottom: 10, left: 10, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  hasTitle
                      ? Container(
                          alignment: Alignment.center,
                          child: Column(
                            children: [
                              Text(
                                params['title'].toUpperCase(),
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'Quicksand',
                                  
                                  // fontWeight: FontWeight.w600,
                                  //center

                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.025,
                              ),
                            ],
                          ),
                        )
                      : Text(''),
                      
                  for (List<String> param in params['items'])
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Text(param[0] + ":", style: TextStyle(fontSize: 11.0)),
                         
                        Image.asset(param[0], height:0.3*size.height , width:2*size.width),
                        Center(child: Text(param[1], style: const TextStyle(fontSize: 16.0))),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02),
                      ],
                    ),
                ],
              ),
            ),
          ),
        ));
  }

  void onPressed() {
    if (hasCallback) {
      parentOnPressed!();
    }
  }
}