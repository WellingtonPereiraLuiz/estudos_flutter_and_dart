class Animal {
  void fazerSom() => print("Som de animal");
}

class Cachorro extends Animal {
  @override
  void fazerSom() => print("au au");
}

class Gato extends Animal {
  @override
  void fazerSom() => print("Miau");
}

void main() {
  Animal meuCachorro = Cachorro();
  Animal meuGato = Gato();

  meuCachorro.fazerSom();
  meuGato.fazerSom();
}
