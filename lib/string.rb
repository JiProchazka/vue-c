require 'pry'

class String
  def kebab
    self.gsub(/::/, '/').
    gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
    gsub(/([a-z\d])([A-Z])/,'\1_\2').
    tr("_", "-").
    downcase
  end

  def capitalize_first
    self[0] = self[0].capitalize
    self
  end

  def camel
    self.split('_').map(&:capitalize).join
  end
end
