import 'package:http/http.dart' as http;

class LibrariesProvider{
  Future<String>  getCurrentLibraires(String packageName)async{
    try{
      final res= await http.get(Uri.parse(
     
       'https://libraries.io/api/search?q=grunt&platforms=$packageName&api_key=bdb36c5d4850690eb25e752b94b0c4a2',
       
      ),
    );
    return res.body;
    }
    catch(e){
      throw e.toString();
    }
  }
}