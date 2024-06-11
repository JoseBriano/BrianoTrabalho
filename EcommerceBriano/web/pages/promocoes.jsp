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
      <link rel="preconnect" href="https://fonts.googleapis.com">
      <link href="https://fonts.googleapis.com/css2?family=Whisper&display=swap" rel="stylesheet">
      <link href="https://fonts.googleapis.com/css2?family=Lexend:wght@100..900&display=swap" rel="stylesheet">
      <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
      <link href="https://fonts.googleapis.com/css2?family=Poetsen+One&display=swap" rel="stylesheet">
      <link rel="stylesheet" href="styles/home.css">
      <link rel="stylesheet" href="styles/cards.css">
      <link rel="icon" href="assets/logo.png">


  <title>Promoções</title>
</head>

<body>
  <header>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
      <a class="navbar-brand" href="#"> <img src="assets/logo.png" alt=""></a>
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
          <li class="nav-item">
            <a class="nav-link" href="./Promocoes"><i class="fa-solid fa-fire" style="color: #ea3434;"></i> Promoções</a>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
              aria-haspopup="true" aria-expanded="false">
              <i class="fa-solid fa-tags" style="color: #307e66;"></i> Categoria
            </a>
            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
              <a class="dropdown-item" href="./Masculina"><i class="fa-solid fa-person" style="color: #005eff;"></i> Masculina</a>
              <a class="dropdown-item" href="./Feminina"><i class="fa-solid fa-person-dress" style="color: #fa00e5;"></i> Feminina</a>
              
            </div>
          </li>

        </ul>
        <form class="form-inline my-2 my-lg-0">
          <input class="form-control mr-sm-2" type="search" placeholder="O que deseja?" aria-label="Pesquisar">
          <button class="btn btn-outline-success my-2 my-sm-0" type="submit"><i
              class="fa-solid fa-magnifying-glass"></i></button>
              <a class="btn btn-outline-succes my-2 my-sm-3" href="#"><i class="fa-solid fa-cart-shopping"></i></a>
          <a href="./Login" class="btn btn-outline-succes my-2 my-sm-1" type="submit"><i
              class="fa-regular fa-user"></i></a>
        </form>
      </div>
    </nav>
  </header>
  <main>
    <h1>Promoções</h1>
  </main>
  <footer>
    <div class="redes">
      <a href="https://www.instagram.com/coe_briano?igsh=c2JweXZ6NHVnODRt" class="btn btn-outline-succes my-2 my-sm-1"
        type="submit"><i class="fa-brands fa-instagram"></i></a>
      <a href="https://www.facebook.com/profile.php?id=100012932593794&locale=pt_BR"
        class="btn btn-outline-succes my-2 my-sm-1" type="submit"><i class="fa-brands fa-facebook"></i></a>
      <a href="https://wa.me/5543996898525" class="btn btn-outline-succes my-2 my-sm-1" type="submit"><i
          class="fa-brands fa-whatsapp"></i></a>
      <a href="https://www.linkedin.com/in/josé-briano-3a363225a" class="btn btn-outline-succes my-2 my-sm-1"
        type="submit"><i class="fa-brands fa-linkedin"></i></a>

    </div>
    &copy; Todos os direitos reservados a Briano
  </footer>
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
  <script src="js/cards.js"></script>
</body>

</html>