class Propertis {
  List<String> atributtes =[];


  Propertis(this.atributtes);

  factory Propertis.fromJson(List<String> json) {
    List <String> factoryAtributtes =[];
    for(int i = 0;i<json.length;i++){
      factoryAtributtes.add(json[i]);
    }
    return (Propertis(factoryAtributtes));
  }
}
