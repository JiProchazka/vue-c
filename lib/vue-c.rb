require 'string'
require 'erb'
require 'fileutils'
require 'json'

class VueC
  def self.generate(args)
    path = args

    load_configuration

    name = path.split('/').last.capitalize_first}
    file = "#{name}.vue"
    relative_folder_path = File.join("src", path.split('/').reverse.drop(1).reverse.join('/'))
    relative_file_path = File.join("src", path.split('/').reverse.drop(1).reverse.join('/'), file)
    absolute_folder_path = File.join(Dir.getwd, relative_folder_path)
    absolute_file_path = File.join(absolute_folder_path, file)

    @name = "#{@auto_prefix}#{name.kebab}"
    template = File.read("#{__dir__}/template.html.erb")
    ERB.new(template, 0, "", "@content").result(binding)

    create_dir_if_needed absolute_folder_path

    if can_write? absolute_file_path, relative_file_path
      puts "Written files:"
      File.open(absolute_file_path, 'w') do |f|
        f.write @content
        puts "  #{relative_file_path}"
      end
    end
  end

  private

  def self.can_write? absolute_file_path, relative_file_path
    if File.exist?(absolute_file_path)
      puts "File '#{relative_file_path}' already exists!"
      return false
    end
    return true
  end

  def self.create_dir_if_needed folder
    FileUtils.mkdir_p(folder)
  end

  def self.load_configuration
    config_file_path = File.join(Dir.getwd, '.vue-c')
    if File.exists? config_file_path
      json = JSON.parse(File.read(config_file_path))
      @styles_lang = json['style[lang]']
      @auto_prefix = json['auto-prefix']

      unless @auto_prefix.nil?
        @auto_prefix = @auto_prefix.capitalize
        puts "Autoprefixed with '#{@auto_prefix}'"
      end
    end
  end
end
