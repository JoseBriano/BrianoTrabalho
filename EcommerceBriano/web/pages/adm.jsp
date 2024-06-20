<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="pt-br">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet"
    href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
    integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
  <link rel="stylesheet"
    href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Whisper&display=swap" rel="stylesheet">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Lexend:wght@100..900&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="styles/home.css">
  <link rel="stylesheet" href="styles/cards.css">
  <link rel="stylesheet" href="styles/cadastro.css">
  <link rel="stylesheet" href="styles/promo.css">
  <link rel="icon" href="assets/logo.png">

  <title>Adm</title>
</head>

<body>
  <header>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
     
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#conteudoNavbarSuportado"
        aria-controls="conteudoNavbarSuportado" aria-expanded="false" aria-label="Alterna navegação">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="conteudoNavbarSuportado">
        <ul class="navbar-nav mr-auto">
          <li class="nav-item active">
            <a class="nav-link" href="redirect.jsp"><i class="fa-solid fa-house"></i> Home <span class="sr-only">(página
                atual)</span></a>
            </li>
            </div>
        </ul>
        
      </div>
    </nav>
  </header>
    <main>
      <div class="cadas">
        <h1>Cadastraro de Prodtos</h1>
        <form action="criarprt" enctype="multipart/form-data" method="post" name="frmProduct">
          <h2>Nome<i class="fa-solid fa-pen"></i>:</h2>
          <input type="text" name="nome">
          <h2>Imagem<i class="fa-solid fa-image"></i>:</h2>
          <input class="img" type="file" name="imagem" id="imagem">
          <h2>Valor<i class="fa-solid fa-dollar-sign"></i>:</h2>
          <input class="preco" type="text" name="preco">
          <h2>Categoria<i class="fa-solid fa-tags"></i>:</h2>
          <input type="text" name="categoria">
          <h2>Descricao<i class="fa-solid fa-audio-description"></i>:</i></h2>
          <input class="descricao" type="text" name="descricao">
          <h2>Tamanho<i class="fa-solid fa-ruler"></i>:</h2>
          <input class="tamanho" type="text" name="tamanho">
          <h2>Quantidade<i class="fa-solid fa-plus"></i>:</h2>
          <input class="qtd" type="text" name="quantidade">
          <br>
          <input class="enviar" type="submit" value="Enviar">
        </form>
      </div>
    </main>


    <script src="https://kit.fontawesome.com/1634f6c9c7.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
      integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
      crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
      integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
      crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
      integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
      crossorigin="anonymous"></script>
</body>

</html>