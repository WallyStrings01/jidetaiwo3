import 'package:flutter/material.dart';
import 'package:jidetaiwoapp/model/property_image_model.dart';
import 'package:jidetaiwoapp/provider/property_image_provider.dart';
import 'package:provider/provider.dart';

class PropertyImageWidget extends StatefulWidget {
  final String id;
  const PropertyImageWidget({Key? key, required this.id}) : super(key: key);

  @override
  State<PropertyImageWidget> createState() => _PropertyImageWidgetState();
}

class _PropertyImageWidgetState extends State<PropertyImageWidget> {
  Future? _future;

  @override
  void initState() {
    _future = _getPropertyImages(widget.id);
    super.initState();
  }

  Future _getPropertyImages(String id) async {
    final Map<String, PropertyImage> properyImages =
        Provider.of<PropertyImageProvider>(context, listen: false)
            .getpropertyimages;
    if (properyImages[widget.id] == null) {
      return await Provider.of<PropertyImageProvider>(context, listen: false)
          .fetchpropertyimages(widget.id);
    }
    return properyImages[widget.id]!.imageUrl;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _future,
        builder: (context, data) {
          if (!data.hasData) {
            return SizedBox(
              height: 200,
              width: double.infinity,
              child: Center(
                  child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              )),
            );
          } else if (data.hasError) {
            return SizedBox(
              height: 200,
              width: double.infinity,
              child: Center(child: Text(data.error.toString())),
            );
          } else {
            return SizedBox(
              width: double.infinity,
              height: 200,
              child: Image.network(
                'https://jidetaiwoandco.com/crmportal/app/webroot/img/propertiesphotos/${data.data.toString()}',
                fit: BoxFit.cover,
              ),
            );
          }
        });
  }
}
