Given("Eu estou na pagina de usuarios") do
  visit '/usuarios'
  expect(page).to have_content('Usuarios')
end

When("Eu clico em novo usuario") do
  click_link 'Novo Usuario'
end

And("Eu crio um usuario com nome  {string}, cpf {string}, login {string}, senha {string} e cargo {string}") do |nome, cpf, login, senha, cargo|
  fill_in 'usuario[nome]', :with => nome
  fill_in 'usuario[cpf]', :with => cpf
  fill_in 'usuario[login]', :with => login
  fill_in 'usuario[senha]', :with => senha
  fill_in 'usuario[cargo]', :with => cargo
end

And("Eu clico em criar usuario") do
  click_button 'Criar Usuario'
end

Then("Eu vejo que o usuario com nome {string} foi cadastrado corretamente") do |nome|
  expect(page).to have_content(nome)

end

Then("Eu visualizo que o campo cpf esta invalido") do
end

Given("O usuário com nome {string}, cpf {string}, login {string}, senha {string}, cargo {string} existe") do |nome, cpf, login, senha, cargo|
  visit '/usuarios/new'
  expect(page).to have_content('Novo Usuario')
  fill_in 'usuario[nome]', :with => nome
  fill_in 'usuario[cpf]', :with => cpf
  fill_in 'usuario[login]', :with => login
  fill_in 'usuario[senha]', :with => senha
  fill_in 'usuario[cargo]', :with => cargo
  click_button 'Criar Usuario'
  expect(page).to have_content('Usuario criado com sucesso!')
  expect(page).to have_content(cpf)
end

When("Eu clico em remover o usuario com cpf {string}") do |cpf|
  click_link "d-#{cpf}"
end

Then("Eu vejo uma mensagem que o usuario foi removido com sucesso") do
end
