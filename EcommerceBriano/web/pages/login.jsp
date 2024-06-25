<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@page contentType="text/html" pageEncoding="UTF-8" %>
        <!DOCTYPE html>
        <html lang="pt-br">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">

            <script src="https://kit.fontawesome.com/560340c572.js" crossorigin="anonymous"></script>
            <link rel="preconnect" href="https://fonts.googleapis.com">
            <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
            <link
                href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
                rel="stylesheet">
            <link rel="stylesheet" href="styles/login.css">
            <link rel="icon" href="assets/logo.png">
            <title>Login</title>
        </head>

        <body>

            <div class="back"> <a href="redirect.jsp"><i class="fa-solid fa-chevron-left">voltar</i></a></div>
            </style>
            <div class="container">
                <div class="signin-signup">

                    <form action="logar" class="sign-in-form" enctype="multipart/form-data" method="get">
                        <h2 class="title">Logar</h2>
                        <div class="input-field">
                            <i class="fas fa-user"></i>
                            <input type="email" placeholder="Email" pattern="[a-z0-9._%+\-]+@[a-z0-9.\-]+\.[a-z]{2,}$"
                                name="email">

                        </div>
                        <div class="input-field">
                            <i class="fas fa-lock"></i>
                            <input type="password" placeholder="Senha" pattern="{8,}" name="senha">
                        </div>
                        <input type="submit" value="Login" class="btn">


                        <p class="account-text">Não possui uma conta?? <a href="#" id="sign-up-btn2">Cadastrar-se</a>
                        </p>
                    </form>
                    <form action="criar" class="sign-up-form" enctype="multipart/form-data" method="post">
                        <h2 class="title">Cadastro</h2>
                        <div class="input-field">
                            <i class="fas fa-user"></i>
                            <input type="text" placeholder="Nome" name="nome">
                        </div>
                        <div class="input-field">
                            <i class="fas fa-envelope"></i>
                            <input type="email" placeholder="Email" pattern="[a-z0-9._%+\-]+@[a-z0-9.\-]+\.[a-z]{2,}$"
                                name="email">
                        </div>
                        <div class="input-field">
                            <i class="fas fa-lock"></i>
                            <input type="password" placeholder="Senha" pattern="{8,}" name="senha">
                        </div>
                        <div class="input-field">
                            <i class="fa-solid fa-id-card"></i>
                            <input type="text" placeholder="CPF" pattern="[0-9]{3}.[0-9]{3}.[0-9]{3}-[0-9]{2}" id="cpf"
                                name="cpf">

                        </div>
                        <div class="input-field">
                            <i class="fa-solid fa-phone"></i>
                            <input type="tel" placeholder="Telefone" pattern="[0-9]{2}[0-9]{5}-[0-9]{4}" id="telefone"
                                name="telefone">
                        </div>
                        <input type="submit" value="Cadastrar" class="btn">

                        <p class="account-text">Ja possui uma conta? <a href="#" id="sign-in-btn2">Logar</a></p>
                    </form>
                </div>
                <div class="panels-container">
                    <div class="panel left-panel">
                        <div class="content">
                            <h3>Ja tem uma conta?</h3>
                            <p>Então faça o seu login e entre novamente!</p>
                            <button class="btn" id="sign-in-btn">Logar</button>
                        </div>

                    </div>
                    <div class="panel right-panel">
                        <div class="content">

                            <h3>Você e novo por aqui?</h3>
                            <p>Crie sua conta e faca parte da melhor loja online de tenis</p>
                            <button class="btn" id="sign-up-btn">Cadastrar</button>
                        </div>

                    </div>
                </div>
            </div>
            <script src="js/login.js"></script>
            <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.16/jquery.mask.js"></script>
            <script src="js/mask.js"></script>
        </body>

        </html>