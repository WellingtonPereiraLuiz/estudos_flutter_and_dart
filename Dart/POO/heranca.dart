// Classe pai
class Animal {
  void dormir() => print("O animal esta dormindo");
}

class Cachorro extends Animal {
  void latir() => print('O cachorro esta latindo');
}

void main() {
  Cachorro dog = Cachorro();
  dog.latir();
  dog.dormir();
}
