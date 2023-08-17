require 'csv'

namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Apagando o BD...") { %x(rails db:drop) }
      show_spinner("Criando o BD...") { %x(rails db:create) }
      show_spinner("Migrando o BD...") { %x(rails db:migrate) }
      show_spinner("Cadastrando lista de visitantes") { %x(rails dev:add_visitors_from_csv) }
      show_spinner("Cadastrando vouchers") { %x(rails dev:add_vouchers_from_csv) }
      show_spinner("Cadastrando usuário Administrador") { %x(rails dev:add_admins) }
    else
      puts "Você não está em ambiente de desenvolvimento"
    end
  end

  desc "Adiciona os Visitantes ao Sistema"
  task add_visitors_from_csv: :environment do
    if Rails.env.development?
      csv_file = Rails.root.join('db', 'csv', 'visitors.csv')

      CSV.foreach(csv_file, headers: true) do |row|
        Visitor.create!(
          name: row['name'],
          cpf: row['cpf'],
          visit_sector: row['visit_sector'],
          observation: row['observation']
        )
      end
    else
        puts "Você não está em ambiente de desenvolvimento"
    end
  end

  desc "Adiciona os Vouchers"
  task add_vouchers_from_csv: :environment do
    if Rails.env.development?
      csv_file = Rails.root.join('db', 'csv', 'vouchers.csv')

      CSV.foreach(csv_file, headers: true) do |row|
        Voucher.create!(
          user_name: row['user_name'],
          token: row['token']
        )
      end
    else
      puts "Você não está em ambiente de desenvolvimento"
    end 
  end  

  desc "Adiciona usuários de login no sistema"
  task add_admins: :environment do
    User.create!(
      email: "admin@admin.com", 
      password: "123456", 
      password_confirmation: "123456"
    )
  end

  private

  def show_spinner(msg_start, msg_end = "Concluído")
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin
    yield
    spinner.success("(#{msg_end})")
  end
end