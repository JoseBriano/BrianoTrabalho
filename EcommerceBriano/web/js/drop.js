// Seleciona o elemento que contém a lista suspensa do perfil
let profileDropdownList = document.querySelector(".profile-dropdown-list");

// Seleciona o botão que aciona a abertura/fechamento da lista suspensa do perfil
let btn = document.querySelector(".profile-dropdown-btn");

// Obtém a lista de classes do elemento da lista suspensa do perfil
let classList = profileDropdownList.classList;

// Função para alternar a classe 'active' na lista suspensa do perfil
const toggle = () => classList.toggle("active");

// Event listener para fechar a lista suspensa do perfil ao clicar fora dela ou no botão
window.addEventListener("click", function (e) {
    if (!btn.contains(e.target)) classList.remove("active");
});