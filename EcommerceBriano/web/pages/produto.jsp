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
      <!-- Font Awesome -->
      <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet" />
      <!-- Google Fonts -->
      <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet" />
      <!-- MDB -->
      <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/7.3.0/mdb.min.css" rel="stylesheet" />
      <link rel="stylesheet" href="styles/produto.css">
      <link rel="icon" href="assets/logo.png">

      <title>Produto</title>
    </head>

    <body>
      <header><!-- Navbar -->
        <nav class="navbar navbar-expand-lg navbar-light bg-body-tertiary">
          <!-- Container wrapper -->
          <div class="container-fluid">
            <!-- Toggle button -->
            <button data-mdb-collapse-init class="navbar-toggler" type="button"
              data-mdb-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
              aria-label="Toggle navigation">
              <i class="fas fa-bars"></i>
            </button>

            <!-- Collapsible wrapper -->
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
              <!-- Navbar brand -->
              <a class="navbar-brand mt-2 mt-lg-0" href="redirect.jsp">
                <img src="assets/logo.png" height="90" alt="MDB Logo" loading="lazy" />
              </a>
              <!-- Left links -->
              <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                  <a class="nav-link" href="redirect.jsp"> Home</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="./Promocoes">Promoções</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="./Masculina">Masculino</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="./Feminina">Feminino</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="./CadastroProd">Cadastro</a>
                </li>
                <style>
                  .nav-link {
                    position: relative;
                    transition: border-bottom 0.4s;
                  }

                  .nav-link::before {
                    content: "";
                    position: absolute;
                    bottom: 0;
                    left: 100%;
                    width: 0;
                    height: 2px;
                    background-color: white;
                    transition: width 0.6s;
                  }

                  .nav-link:hover::before {
                    width: 100%;
                    left: 0;
                  }
                </style>
              </ul>
              <!-- Left links -->
            </div>

            <!-- Collapsible wrapper -->
            <!-- Avatar -->
            <div class="dropdown">
              <a data-mdb-dropdown-init class="dropdown-toggle d-flex align-items-center hidden-arrow" href="#"
                id="navbarDropdownMenuAvatar" role="button" aria-expanded="false">
                <i class="fa-solid fa-circle-user"></i>
              </a>
              <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdownMenuAvatar">
                <li>
                  <a class="dropdown-item" href="#">Seu perfil <i class="fa-solid fa-user"></i></a>
                </li>
                <li>
                  <a class="dropdown-item" href="./Login">Sair <i class="fa-solid fa-right-from-bracket"></i></a>
                </li>
              </ul>
            </div>
          </div>
          <!-- Right elements -->
          </div>
          <!-- Container wrapper -->
        </nav>
      </header>
      <main>
        <div class="container">
          <c:forEach items="${produto}" var="produtos">
            <div id="produto_${produtos.idProdutos}" class="produto">
              <h2>${produtos.nome}</h2>
              <img src="data:image/png;base64,${produtos.imagemBase64}" alt="${produtos.nome}" id="imgPrt">
              <p id="preco">R$ ${produtos.preco}</p>
              <p id="desc">${produtos.descricao}</p>
              <div class="mei">
                <div class="dropdown">
                  <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton"
                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Selecione o tamanho:
                  </button>
                  <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                    <p class="dropdown-item" id="tamanho">38</p>
                    <p class="dropdown-item" id="tamanho">39</p>
                    <p class="dropdown-item" id="tamanho">40</p>
                    <p class="dropdown-item" id="tamanho">41</p>
                    <p class="dropdown-item" id="tamanho">42</p>
                  </div>
                </div>

                <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
                <script>
                  $(document).ready(function () {
                    $('.dropdown-item').click(function () {
                      var selectedValue = $(this).text();
                      $('#dropdownMenuButton').text('Tamanho selecionado: ' + selectedValue);
                    });
                  });
                </script>
                <button type="submit" class="btn btn-comprar" data-id="${produtos.idProdutos}"
                  data-descricao="${produtos.descricao}" data-nome="${produtos.nome}" data-preco="${produtos.preco}"
                  data-imagem="${produtos.imagemBase64}" data-quantidade=1 id="comprar"
                  data-tamanho="${produtos.tamanho}">
                  <a href="#myModal" class="trigger-btn" data-toggle="modal">comprar</a>
                </button>
                
                <div id="myModal" class="modal fade">
                  <div class="modal-dialog modal-confirm">
                    <div class="modal-content">
                      <div class="modal-header">
                        <div class="icon-box">
                          <i class="fa-solid fa-check" style="color: #ffffff;"></i>
                        </div>				
                        <h4 class="modal-title">Sucesso!</h4>	
                      </div>
                      <div class="modal-body">
                        <p class="text-center">Seu produto foi adicionado ao carrinho.</p>
                      </div>
                      <div class="modal-footer">
                        <button class="btn btn-success btn-block" data-dismiss="modal">OK</button>
                      </div>
                    </div>
                  </div>
                </div>     
                </body>
              </div>

            </div>
          </c:forEach>
      </main>
      <form id="form-comprar" action="enviarc" method="post" enctype="multipart/form-data" style="display: none;">
        <input type="hidden" name="idProduto" id="idProduto">
        <input type="hidden" name="descricao" id="descricao">
        <input type="hidden" name="nomeCarrinho" id="nomeCarrinho">
        <input type="hidden" name="preco" id="preco">
        <input type="file" name="imagem" id="imagem">
        <input type="hidden" name="quantidade" id="quantidade">
        <input type="hidden" name="tamanho" id="tamanho">

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
      <!-- MDB -->
      <script type="text/javascript"
        src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/7.3.0/mdb.umd.min.js"></script>
    </body>

    </html>