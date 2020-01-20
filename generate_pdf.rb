## Manually generating PDF versions
# 
# ```
#    sudo apt-get install pandoc
#    sudo apt-get install texlive-latex-base
#    sudo apt-get install texlive-fonts-recommended
# 
#    cd Hickey_Rich
#    pandoc -V geometry:margin=3cm -o simple-made-easy.pdf ./SimpleMadeEasy.md
# ```

markdowns = Dir.glob("./**/*.md").reject {|a| a.end_with?('README.md')}

markdowns.each do |markdown|
  puts "Generating pdf for #{markdown} ..."
  parts = markdown.split('/')
  folder = parts[1]
  file_name = parts[2]

  system "cd #{folder} && pandoc -V geometry:margin=3cm -o #{file_name.gsub('.md','.pdf')} ./#{file_name}"
end
