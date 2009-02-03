require 'coderay'

class CodeRayExtension < Radiant::Extension
  version "1.0"
  description "Syntax highlighting using the CodeRay ruby gem."
  url "http://github.com/phallstrom/coderay"
  
  def activate
    Page.send :include, CodeRayTags
  end
  
  def deactivate
  end
  
end
