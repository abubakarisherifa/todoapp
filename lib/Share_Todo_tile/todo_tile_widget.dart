import 'package:flutter/material.dart';
import 'package:skeleton_text/skeleton_text.dart';
import 'package:todoapp/Home_view/utils.dart';

class Todo_tile_wedge extends StatefulWidget {
  
  Todo_tile_wedge({
    Key? key,
    required this.title,
    required this.description,
    required this.dateTime,
    required this.status,
  }) : super(key: key);
 final String title;
 final String description;
 final String dateTime;
 final bool status;

  @override
  State<Todo_tile_wedge> createState() => _Todo_tile_wedgeState();
}

class _Todo_tile_wedgeState extends State<Todo_tile_wedge> {
  bool ischeked=false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Row(
          children: [
            Icon(
              Icons.check_circle_outline,
              color: custColor(date:  widget.dateTime),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                    const SizedBox(
                      height: 10,
                    ),
                    Text(widget.title),
                    Text(
                      widget.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: (){
                        setState(() {
                          if(ischeked==false){
                            ischeked=true;
                            print(ischeked);
                          }
                        });
                      },
                      child: Icon(
                        widget.status?
                        Icons.check_circle_outline:Icons.check_circle_rounded,
                        color:custColor(date: widget.dateTime),
                        size: 16.0,
                    
                  
                      ),
                    ),
                  ),
                  Text(
                    widget.dateTime,
                    style: TextStyle(
                      color: custColor(date:  widget.dateTime),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
