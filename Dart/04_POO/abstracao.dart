abstract class Figura {
  // Metodo abstrato, sem implementacao
  void desenhar();
}

class Circulo extends Figura {
  void desenhar() => print("Desenhanbdo um circulo");
}

void main() {
  Circulo c = Circulo();
  c.desenhar();
}
