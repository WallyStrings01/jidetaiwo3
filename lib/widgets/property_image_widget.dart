import 'package:flutter/material.dart';
import 'package:jidetaiwoapp/model/property_image_model.dart';
import 'package:jidetaiwoapp/provider/property_image_provider.dart';
import 'package:provider/provider.dart';

class PropertyImageWidget extends StatelessWidget {
  final String id;
  const PropertyImageWidget({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<String> _getPropertyImages(String id) async {
      final Map<String, PropertyImage> properyImages =
          Provider.of<PropertyImageProvider>(context, listen: false)
              .getpropertyimages;
      if (properyImages[id] == null) {
        return await Provider.of<PropertyImageProvider>(context, listen: false)
            .fetchpropertyimages(id);
      }
      print(properyImages[id]!.imageUrl);
      return properyImages[id]!.imageUrl;
    }

    return FutureBuilder(
        future: _getPropertyImages(id),
        builder: (context, data) {
          if (data.connectionState == ConnectionState.waiting ||
              !data.hasData) {
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
                'http://jidetaiwoandco.com/crmportal/app/webroot/img/propertiesphotos/${data.data.toString()}',
                key: ValueKey(data.data.toString()),
                fit: BoxFit.cover,
              ),
            );
          }
        });
  }
}
