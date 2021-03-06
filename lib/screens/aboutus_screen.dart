import 'package:flutter/material.dart';
import 'package:jidetaiwoapp/hextocolor.dart';
import 'package:jidetaiwoapp/widgets/appbar_widget.dart';

class AboutusScreen extends StatelessWidget {
  static const routename = '/aboutusscreen';

  const AboutusScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: AppBarWidget('PROFILE'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text(
                'About Us',
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontSize: 20,
                    ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage('assets/images/watermarkimage2.png')),
                  color: hextocolor('#FBF9F9')),
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
                child: Text(
                  '''Jide Taiwo & Co. is a professional service firm of Estate Surveyors and Valuers and a corporate member of the Nigerian Institution of Estate Surveyors and Valuers (NIESV). Incorporated in 1980 by the Corporate Affairs Commission [CAC] and commencing operations same year, we have grown to become the sectorial icon in Nigeria.
      
We are recognized by the Estate Surveyors and Valuers Registration Board of Nigeria [ESVARBON] to practice the profession of real estate surveying and valuation nationwide. In our over four decades of existence, we have established our presence not only as a market leader, but our national presence confirms our commitment to the Nigeria real estate market.
      
We deploy the very best of technology to drive our real estate solutions to the benefits of all our stakeholders.we envision to become the technology driven real estate firm of choice to our present and new clients
      
The firm is fortified with over 500 experienced and well-motivated human capital. Amongst these are 300 professional staff and management team. Our range of professional services cut across Agency, Valuation, Property Management, Facility Management, Project Development, Consultancy and Advisory.
      
With our in-depth understanding of the real estate industry in Nigeria, we are able to provide new and existing clients with required support in their real estate dealings.''',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(fontSize: 14,height: 1.5, color: hextocolor('#5E5B5B')),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
