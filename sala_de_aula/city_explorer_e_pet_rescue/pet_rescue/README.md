# Atividade Flutter: Pet Rescue

Este projeto é o Exercício 2 da atividade, "Adote um Amigo" [cite: 261-262]. É um mini-app que lista pets para adoção, permite filtrar por porte, ver detalhes, marcar interesse e alternar imagens, tudo com `setState` local.

## Checklist de Requisitos
Abaixo está detalhado onde cada requisito da atividade [cite: 264-272] foi implementado:

### R1. Rotas Nomeadas + Parâmetros
* **`lib/main.dart`:** As rotas (`/` e `/pet_detail`) são definidas.
***`lib/pages/pet_home_page.dart`:** O `onTap` do `ListTile` de cada pet usa `Navigator.pushNamed(context, '/pet_detail', arguments: pet)` para enviar o objeto `Pet` completo para a tela de detalhes.
***`lib/pages/pet_detail_page.dart`:** Os dados são recebidos em `didChangeDependencies` usando `ModalRoute.of(context)!.settings.arguments as Pet`.

### R2. Estado com `setState`
O `setState` foi usado de duas formas principais:
1.  **Filtro por Porte (`lib/pages/pet_home_page.dart`):** A variável de estado `activeFilter` é alterada pelos `ElevatedButton`s ("Pequeno", "Médio", "Grande"). Cada botão chama `setState` e atualiza a string do filtro.Uma lista computada (`filteredPets`) usa esse estado para filtrar a lista [cite: 266, 306-311].
2.  **Marcar Interesse (`lib/pages/pet_detail_page.dart`):** A variável `isInterested` é um `bool` local.O `ElevatedButton` "Marcar Interesse" chama a função `toggleInterest()`, que usa `setState` para alternar o estado e mudar a cor/texto do botão[cite: 266].

### R3. `GestureDetector`
* **`lib/pages/pet_detail_page.dart`:** A imagem principal do pet é envolvida por um `GestureDetector`. O `onTap` chama a função `toggleImage()`.
***`toggleImage()`:** Esta função chama `setState` para alternar o `bool` `showNetworkImage`, que decide se o `Image.network` (com `pet.photoUrl`) ou o `Image.asset` (com `pet.localAssetAlt`) será exibido [cite: 268, 313-322].

### R4. Layout (`Row`, `Column`, `Padding`, etc.)
* **`lib/pages/pet_home_page.dart`:** Usa `Column` para empilhar a `Row` de filtros sobre a `Expanded` `ListView`. `Padding` é usado nos botões e na lista.
* **`lib/pages/pet_detail_page.dart`:** Usa `SingleChildScrollView` > `Column` > `Padding` para a estrutura geral. `Row` é usada para exibir os `Chip`s de "Porte" e "Temperamento" lado a lado.

### R5. Imagens (`network` e `asset`)
***`Image.network`:** Usada em `pet_detail_page.dart` para carregar a `pet.photoUrl`[cite: 270].
***`Image.asset`:** Usada em `pet_detail_page.dart` para carregar a `pet.localAssetAlt` quando a imagem é tocada[cite: 270].

### R6. Pacotes (`google_fonts`, `animated_text_kit`, `shimmer`, `ElevatedButton`)
* **`google_fonts`:** Usado em ambas as telas (`HomePage` e `DetailPage`) para estilizar os textos (ex: `GoogleFonts.poppins()`).
***`animated_text_kit`:** Usado na `AppBar` da `pet_home_page.dart` para o título "Adote um Amigo"[cite: 271].
***`shimmer`:** Implementado no `loadingBuilder` do `Image.network` na `pet_detail_page.dart` para mostrar um skeleton[cite: 271].
***`ElevatedButton`:** Usado para os filtros na `HomePage` e para o botão "Marcar Interesse" na `DetailPage`[cite: 271].

### R7. Desafio (`url_launcher` / `Youtubeer_flutter`)
* **`lib/pages/pet_detail_page.dart`:** Um `OutlinedButton` ("Falar com a ONG") foi adicionado.
***`lib/pages/pet_detail_page.dart`:** O `onPressed` chama a função `_openLink`, que usa o pacote `url_launcher` para abrir um link de WhatsApp (ex: `https://wa.me/...`)[cite: 272].