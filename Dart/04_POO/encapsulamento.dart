class ContaBancaria {
  // Atributo privado
  double _saldo = 0.0;

  // Getter para acessar o saldo
  double get saldo => _saldo;

  // Setter para alterar o saldo (com verificação)
  set depositar(double valor) {
    if (valor > 0) {
      _saldo += valor;
    }
  }
}

void main() {
  var conta = ContaBancaria();
  print('Saldo atual ${conta.saldo}');
  conta.depositar = 100.0;
  print('Saldo atual ${conta.saldo}');
}
