<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ page import="model.Bean.Produtos" %>
      <%@ page import="model.DAO.ProdutosDAO" %>
        <!DOCTYPE html>
        <html lang="pt-br">

        <head>
          <meta charset="UTF-8">
          <meta name="viewport" content="width=device-width, initial-scale=1.0">

          <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
            integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
          <link rel="preconnect" href="https://fonts.googleapis.com">
          <link href="https://fonts.googleapis.com/css2?family=Whisper&display=swap" rel="stylesheet">
          <link href="https://fonts.googleapis.com/css2?family=Lexend:wght@100..900&display=swap" rel="stylesheet">
          <!-- Font Awesome -->
          <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet" />
          <!-- Google Fonts -->
          <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet" />
          <!-- MDB -->
          <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/7.3.0/mdb.min.css" rel="stylesheet" />
          <link rel="stylesheet" href="styles/home.css">
          <link rel="stylesheet" href="styles/carrinho.css">
          <link rel="icon" href="assets/logo.png">
          <title>Carrinho</title>
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
            <section class="h-100 h-custom" style="background-color: #ffffff;">
              <div class="container py-5 h-100">
                <div class="row d-flex justify-content-center align-items-center h-100">
                  <div class="col-12">
                    <div class="card card-registration card-registration-2" style="border-radius: 15px;">
                      <div class="card-body p-0">
                        <div class="row g-0">
                          <div class="col-lg-8">
                            <div class="p-5">
                              <div class="d-flex justify-content-between align-items-center mb-5">
                                <h1 class="fw-bold mb-0">Carrinho</h1>
                              </div>
                              <hr class="my-4">

                              <div class="row mb-4 d-flex justify-content-between align-items-center">
                                <div class="col-md-3 col-lg-3 col-xl-3">
                                  <h6 class="text-muted">nome</h6>
                                  <h6 class="mb-0">Nome Prod.</h6>
                                </div>
                                <div class="col-md-3 col-lg-3 col-xl-2 d-flex">
                                  <button data-mdb-button-init data-mdb-ripple-init class="btn btn-link px-2"
                                    onclick="this.parentNode.querySelector('input[type=number]').stepDown()">
                                    <i class="fas fa-minus"></i>
                                  </button>

                                  <input id="form1" min="0" name="quantity" value="1" type="number"
                                    class="form-control form-control-sm" />

                                  <button data-mdb-button-init data-mdb-ripple-init class="btn btn-link px-2"
                                    onclick="this.parentNode.querySelector('input[type=number]').stepUp()">
                                    <i class="fas fa-plus"></i>
                                  </button>
                                </div>
                                <div class="col-md-3 col-lg-2 col-xl-2 offset-lg-1">
                                  <h6 class="mb-0">R$133,00</h6>
                                </div>
                                <div class="col-md-1 col-lg-1 col-xl-1 text-end">
                                  <a href="#!" class="text-muted"><i class="fas fa-times"></i></a>
                                </div>
                              </div>
                              <hr class="my-4">
                              <div class="pt-5">
                                <h6 class="mb-0"><a href="redirect.jsp" class="text-body"><i
                                      class="fas fa-long-arrow-alt-left me-2"></i>Voltar as Compras</a></h6>
                              </div>
                            </div>
                          </div>
                          <div class="col-lg-4 bg-body-tertiary">
                            <div class="p-5">
                              <h3 class="fw-bold mb-5 mt-2 pt-1">Summary</h3>
                              <hr class="my-4">
                              <div class="d-flex justify-content-between mb-4">
                                <h5 class="text-uppercase">itens</h5>
                                <h5></h5>
                              </div>
                              <hr class="my-4">
                              <div class="d-flex justify-content-between mb-5">
                                <h5 class="text-uppercase">Total:</h5>
                                <h5></h5>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </section>

            <div class="rowPag">
              <div class="col-lg-7 mx-auto">
                <div class="bg-white rounded-lg shadow-sm p-5">
                  <!-- Credit card form tabs -->
                  <ul role="tablist" class="nav bg-light nav-pills rounded-pill nav-fill mb-3">
                    <li class="nav-item">
                      <a data-toggle="pill" href="#nav-tab-card" class="nav-link active rounded-pill">
                        <i class="fa fa-credit-card"></i>
                        Cartão de Credito
                      </a>
                    </li>
                    <li class="nav-item">
                      <a data-toggle="pill" href="#nav-tab-paypal" class="nav-link rounded-pill">
                        <i class="fa fa-paypal"></i>
                        Pix
                      </a>
                    </li>
                  </ul>
                  <!-- End -->
                  <!-- Crdit card form content -->
                  <div class="tab-content">
                    <!-- credit card info-->
                    <div id="nav-tab-card" class="tab-pane fade show active">
                      <p class="alert alert-success">Revise seus dados antes do Pagamento</p>
                      <form role="form">
                        <div class="form-group">
                          <label for="username">Nome do Cartão</label>
                          <input type="text" name="username" placeholder="ex: Ronaldo" required class="form-control">
                        </div>
                        <div class="form-group">
                          <label for="cardNumber">Número do Cartão</label>
                          <div class="input-group">
                            <input type="text" name="cardNumber" placeholder="ex:1111 1111 1111 1111"
                              class="form-control" required>
                            <div class="input-group-append">
                              <span class="input-group-text text-muted">
                                <i class="fa fa-cc-visa mx-1"></i>
                                <i class="fa fa-cc-mastercard mx-1"></i>
                              </span>
                            </div>
                          </div>
                        </div>
                        <div class="row">
                          <div class="col-sm-8">
                            <div class="form-group">
                              <label><span class="hidden-xs">Validade</span></label>
                              <div class="input-group">
                                <input type="number" placeholder="MM" name="" class="form-control" required>
                                <input type="number" placeholder="AA" name="" class="form-control" required>
                              </div>
                            </div>
                          </div>
                          <div class="col-sm-4">
                            <div class="form-group mb-4">
                              <label data-toggle="tooltip" title="Three-digits code on the back of your card">CVV
                              </label>
                              <input type="text" required class="form-control">
                            </div>
                          </div>
                        </div>
                        <button type="button" class="subscribe btn btn-primary btn-block rounded-pill shadow-sm">
                          Confirmar </button>
                      </form>
                    </div>
                    <!---->
                    <!-- End -->
                    <!-- Paypal info -->
                    <div id="nav-tab-paypal" class="tab-pane fade">
                      <p>Faça o pagamento online sem sair de sua casa com o Pix</p>
                      <p>
                      <div class="inputbox"> <img class="pix" src="assets/pix.png" alt=""></div>
                      </p>
                      <p class="text-muted">Apenas escaneie o codigo a cima
                      </p>
                    </div>
                    <!-- End -->
                  </div>
                </div>
              </div>
            </div>
            
          </main>
          <script src=https://cdnjs.cloudflare.com/ajax/libs/jquery/1.4.4/jquery.min.js type="text/javascript"></script>
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
          <script src="js.car.js"></script>
          <!-- MDB -->
          <script type="text/javascript"
            src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/7.3.0/mdb.umd.min.js"></script>
        </body>

        </html>