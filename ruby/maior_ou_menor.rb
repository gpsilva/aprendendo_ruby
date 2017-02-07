#!/usr/bin/env ruby
# encoding: utf-8
def boas_vindas
  puts "Bem vindo ao jogo da adivinhação"
  puts "Qual é o seu nome?"
  nome = gets.strip
  puts "\n\n\n\n\n"
  puts "Começaremos o jogo para você, #{nome}"
  nome
end

def pede_dificuldade
  puts "Qual o nível de dificuldade que deseja? (1 fácil - 5 difícil)"
  dificuldade = gets.to_i
end

def sorteia_numero_secreto(dificuldade)
  case dificuldade
  when 1
    maximo = 30
  when 2
    maximo = 60
  when 3
    maximo = 100
  when 4
    maximo = 150
  else
          maximo = 200
  end

  puts "Escolhendo um número secreto entre 1 e #{maximo}..."
  sorteado = rand(maximo) + 1
  puts "Escolhido... que tal adivinhar hoje nosso número secreto?"
  sorteado
end

def pede_um_numero(chutes, tentativa, limite_de_tentativas)
  puts "\n\n\n\n"
  puts "Tentativa #{tentativa} de #{limite_de_tentativas}"
  puts "Chutes até agora: #{chutes}"
  puts "Digite o número"
  chute = gets.strip
  puts "Será que acertou? Você chutou #{chute}"
  chute.to_i
end

def verifica_se_acertou(numero_secreto, chute)
  acertou = numero_secreto == chute

    if acertou
      puts "Acertou!"
      return true
    end
    maior = numero_secreto > chute.to_i
    if maior
        puts "O número secreto é maior!"
      else
        puts "O número secreto é menor"
      end
      false
end

nome = boas_vindas
dificuldade = pede_dificuldade
numero_secreto = sorteia_numero_secreto dificuldade

pontos_ate_agora = 1000
limite_de_tentativas = 3
chutes = []
total_de_chutes = 0

for tentativa in 1..limite_de_tentativas
      chute = pede_um_numero(chutes, tentativa, limite_de_tentativas)
      chutes << chute

      if nome == "Gilvan"
        puts "Nossa, #{nome} você acertou de primeira, parabéns !"
        break
      end

      pontos_a_perder = (chute - numero_secreto).abs / 2.0
      pontos_ate_agora -= pontos_a_perder

      if verifica_se_acertou(numero_secreto, chute)
        break
      end
  end

puts "O numero secreto é #{numero_secreto}!"
puts "Você ganhou #{pontos_ate_agora} pontos."
