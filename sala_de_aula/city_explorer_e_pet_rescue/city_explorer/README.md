# Atividade Flutter: City Explorer

Este projeto é o Exercício 1 da atividade, "Descubra Ariquemes". É um mini-app que lista locais, permite favoritar, registrar visitas e ver detalhes, implementando um gerenciamento de estado global simples entre as telas.

## 🗺️ Checklist de Requisitos
Abaixo está detalhado onde cada requisito da atividade foi implementado:

### R1. Rotas Nomeadas + Parâmetros
* **`lib/main.dart` (ou `app_routes.dart`):** As rotas (`/`, `/detail`, `/favorites`) são definidas usando `onGenerateRoute`.
* **`lib/pages/city_home_page.dart`:** A função `_navigateToDetail` usa `await Navigator.pushNamed(context, '/detail', arguments: place)` para enviar o objeto `Place` para a tela de detalhes.
* **`lib/pages/city_detail_page.dart`:** Os dados são recebidos em `didChangeDependencies` usando `ModalRoute.of(context)!.settings.arguments as Place`.
* **Retorno de Valor:** Para o estado global, a `DetailPage` retorna o status do favorito usando `Navigator.pop(context, isFavorite)` no botão de voltar.

### R2. Estado com `setState`
O `setState` foi usado de 3 formas:
1.  **Contador de Visitas (`lib/pages/city_detail_page.dart`):** A variável `visitCount` é incrementada pela função `_incrementVisits()`, que chama `setState`.
2.  **Toggle de Favorito (`lib/pages/city_detail_page.dart`):** A variável local `isFavorite` é alternada pela função `toggleFavorite()`, que chama `setState` para atualizar a UI do ícone.
3.  **Estado Global (`lib/pages/city_home_page.dart`):** A `HomePage` recebe o `bool` de retorno da `DetailPage` e chama `setState` dentro de `_navigateToDetail` para atualizar a lista principal (`place.isFavorite = newFavoriteState`), garantindo que o estado persista ao voltar.

### R3. `GestureDetector`
* **Navegação (`lib/pages/city_home_page.dart`):** O card inteiro na `buildPlaceCard` é envolvido por um `GestureDetector` para capturar o `onTap` e navegar para os detalhes.
* **Contador (`lib/pages/city_detail_page.dart`):** O container "Registrar Visita" é envolvido por um `GestureDetector` que chama `_incrementVisits` no `onTap`.

### R4. Layout (`Row`, `Column`, `Padding`, etc.)
* **`lib/pages/city_home_page.dart`:** Usa `SingleChildScrollView` > `Padding` > `Column` para criar a lista de cards rolável.
* **`lib/pages/city_home_page.dart` (Card):** O `buildPlaceCard` usa `Container` (para o fundo e bordas) e `Column` (para empilhar a imagem sobre o texto).
* **`lib/pages/city_detail_page.dart`:** Usa `SingleChildScrollView` > `Column` > `Padding` para estruturar a página de detalhes.

### R5. Imagens (`network` e `asset`)
* **`Image.network`:** Usada em `city_home_page.dart` (no card) e `city_detail_page.dart` (imagem de capa) para carregar a `place.coverUrl`.
* **`Image.asset`:** Usada em `city_detail_page.dart` para carregar o mapa fictício (`place.localAssetMap`).

### R6. Pacotes (`google_fonts`, `animated_text_kit`, `shimmer`)
* **`google_fonts`:** Usado em todas as telas (`HomePage` e `DetailPage`) para estilizar os textos (ex: `GoogleFonts.poppins()`).
* **`animated_text_kit`:** Usado na `AppBar` da `city_home_page.dart` para o título animado "Descubra Ariquemes".
* [cite_start]**`shimmer`:** Implementado no `loadingBuilder` do `Image.network` na `city_home_page.dart` para mostrar um skeleton [cite: 199-210] enquanto a imagem carrega.

### R7. Ação (`ElevatedButton` + `url_launcher`)
* **`lib/pages/city_detail_page.dart`:** Um `ElevatedButton` ("Abrir no Maps") foi adicionado.
* **`lib/pages/city_detail_page.dart`:** O `onPressed` do botão chama a função `_openMaps(place.title + ', Ariquemes')`.
* [cite_start]**`lib/pages/city_detail_page.dart`:** A função `_openMaps` usa o pacote `url_launcher` [cite: 230-236] para abrir o Google Maps com uma query de busca.