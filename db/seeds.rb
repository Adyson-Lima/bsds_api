puts 'Gerando bsds...'

5.times do |i|
  Bsd.create(
    name: ["openbsd", "freebsd", "netbsd"].sample ,
    description: "sistema tipo bsd"
    )
end

puts 'bsds gerados com sucesso!'