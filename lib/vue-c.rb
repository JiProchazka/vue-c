require 'string'
require 'erb'
require 'fileutils'

class VueC
  def self.generate(args)
    path = args

    name = path.split('/').last.capitalize
    file = "#{name}.vue"
    relative_folder = File.join("src", path.split('/').reverse.drop(1).reverse.join('/'))
    folder = File.join(Dir.getwd, relative_folder)

    @name = name.kebab
    template = File.read("#{__dir__}/template.html.erb")
    ERB.new(template, 0, "", "@content").result(binding)

    create_dir_if_needed folder

    puts "Created files:"
    File.open(File.join(folder, file), 'w') do |f|
      f.write @content
      puts "  #{relative_folder}/#{file}"
    end
  end

  private

  def self.create_dir_if_needed folder
    FileUtils.mkdir_p(folder)
  end
end
