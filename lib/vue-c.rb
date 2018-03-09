require 'string'
require 'erb'

class VueC
  def self.generate(args)
    path = args
    @name = path.split('/').last.kebab
    @content = ""

    template = File.read("#{__dir__}/template.html.erb")
    ERB.new(template, 0, "", "@content").result(binding)

    File.open(File.join(Dir.getwd, "src", "#{path}.vue"), 'w') do |file|
      file.write @content
    end
  end
end
