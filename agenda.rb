

@agenda = [
 {nome: "Sergio", telefone: "958158150"},
{nome: "Ricardo", telefone: "999993333"}
]
def todos_contatos
    @agenda.each do |contato|
        puts "-----------------------------------------------------"
        puts "#{contato[:nome]} - #{contato[:telefone]} "
    end
        puts "-----------------------------------------------------"
   0
end
def adicionar_contato
    print "nome:"
    nome = gets.chomp 
    print "telefone:"
    telefone = gets.chomp
    @agenda << {nome: nome,telefone: telefone}
end
def  ver_contato
    print "qual nome voce deseja editar "
    nome = gets.chomp

    @agenda.each do |contato|
        if contato[:nome].downcase.include?(nome.downcase)
            puts "#{contato[:nome]} - #{contato[:telefone]}"
            
    end
end
puts "-----------------------------------------------------"
end
def editar_contato
    print "Qual nome deseja editar:"
    nome =gets.chomp
    
    @agenda.each do |contato|
        if contato[:nome].downcase.include?(nome.downcase)
        print"nome que voce deseja editar "
        nome_salvo = contato[:nome]


        contato[:nome] = gets.chomp
        contato[:nome] = contato[:nome].empty? ? nome_salvo : contato[:nome]

        print"telefone que voce deseja editar "
        telefone_salvo = contato[:telefone]

        contato[:telefone] = gets.chomp
        contato[:telefone] = contato[:telefone].empty? ? telefone_salvo : contato[:telefone]
        end
    end
    puts "-----------------------------------------------------"
end 
def remover_contato
    print "Qual nome você deseja remover: "
    nome = gets.chomp
  
    @agenda.each do |contato|
      if contato[:nome].downcase.include?(nome.downcase)
        puts "Deseja realmente remover o contato #{contato[:nome]}? (sim/não)"
        resposta = gets.chomp
  
        if resposta.downcase == "sim"
          indice = @agenda.index(contato)
          @agenda.delete_at(indice)
          puts "Contato removido com sucesso."
        else
          puts "Contato não foi removido."
        end
        return  # Saia da função após a confirmação, não há necessidade de continuar procurando.
      end
    end
  
    puts "Nenhum contato com o nome '#{nome}' foi encontrado na agenda."
    puts "-----------------------------------------------------"
  end
  
loop do
    puts "1. Contatos \n2. Adicionar Contato\n3. Ver Contato\n4. Editar Contato\n5. Remover Contato\n0. Sair"
    codigo = gets.chomp.to_i
    
    case
    when codigo == 0
        puts "até mais"
        break 
    when codigo == 1 
        todos_contatos 
    when codigo == 2
        adicionar_contato
    when codigo == 3 
        ver_contato
    when codigo == 4
        editar_contato
    when codigo == 5
        remover_contato
    else
        puts "-----------------------------------------------------"

        puts "funçao invalida! \n Por favor digite uma funçao valida "
        puts "-----------------------------------------------------"
    end
end
