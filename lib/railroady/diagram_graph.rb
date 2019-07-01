# RailRoady - RoR diagrams generator
# http://railroad.rubyforge.org
#
# Copyright 2007-2008 - Javier Smaldone (http://www.smaldone.com.ar)
# See COPYING for more details

# RailRoady diagram structure
class DiagramGraph
  def initialize
    @diagram_type = ''
    @show_label   = false
    @alphabetize  = false
    @nodes = []
    @edges = []
  end

  def add_node(node)
    @nodes << node
  end

  def add_edge(edge)
    @edges << edge
  end

  attr_writer :diagram_type

  attr_writer :show_label

  attr_writer :alphabetize

  # Generate DOT graph
  def to_dot
    dot_header +
      @nodes.map { |n| dot_node n[0], n[1], n[2], n[3] }.join +
      @edges.map { |e| dot_edge e[0], e[1], e[2], e[3] }.join +
      dot_footer
  end

  # Generate XMI diagram (not yet implemented)
  def to_xmi
    STDERR.print "Sorry. XMI output not yet implemented.\n\n"
    ''
  end

  private

  # Build DOT diagram header
  def dot_header
    result = "@startuml\n"
      result += "\tskinparam linetype ortho\n"
      result += "\tskinparam packageStyle rectangle\n"
      result += "\tskinparam shadowing false\n"
      result += "\tskinparam class {\n"
        result += "\t\tBackgroundColor White\n"
        result += "\t\tBorderColor Black\n"
        result += "\t\tArrowColor Black\n"
      result += "\t}\n"
      result += "\thide members\n"
      result += "\thide circle\n"
    result
  end

  # Build DOT diagram footer
  def dot_footer
    "\n@enduml\n"
  end

  # Build a DOT graph node
  def dot_node(type, name, attributes = nil, custom_options = '')
    options = "\n"
    case type
      when 'model'
        options += attributes.sort_by { |s| @alphabetize ? s : nil }.join("\n")
      when 'model-brief'
        options += ""
      when 'class'
        options += ""
      when 'class-brief'
        options += ""
      when 'controller'
        options += ""
        options += attributes[:public].sort_by    { |s| @alphabetize ? s : nil }.join("\n")
        options += attributes[:protected].sort_by { |s| @alphabetize ? s : nil }.join("\n")
        options += attributes[:private].sort_by   { |s| @alphabetize ? s : nil }.join("\n")
      when 'controller-brief'
        options += ""
      when 'module'
        options += ""
      when 'aasm'
        return "aasm: \n #{attributes.join("\n")}"
    end
    # options = [options, custom_options].compact.reject{|o| o.empty?}.join(', ')
    return "\tclass #{quote(name+options)} as #{noquote(name)}\n"
  end # dot_node

  # Build a DOT graph edge
  def dot_edge(type, from, to, name = '')
    ret = ""
    case type
      when 'one-one'
        ret = "\t#{quote(from)} -- #{quote(to)}\n"
      when 'one-many'
        ret = "\t#{quote(from)} --|{ #{quote(to)}\n"
      when 'many-many'
        ret = "\t#{quote(from)} }|--|{ #{quote(to)}\n"
      when 'belongs-to'
        ret = "\t#{quote(from)} }|--|{ #{quote(to)}\n"
      when 'is-a'
        ret = "\t#{quote(from)} }|--|{ #{quote(to)}\n"
      when 'event'
        ret = "\t#{quote(from)} }|--|{ #{quote(to)}\n"
    end
    ret
  end # dot_edge

  # Quotes a class name
  def quote(name)
    ('"' + name.to_s + '"').gsub(":","")
  end
  def noquote(name)
    name.to_s.gsub(":","")
  end

end # class DiagramGraph
