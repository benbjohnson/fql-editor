require 'rubygems'
require 'open-uri'
require 'nokogiri'

module FQLEditor
  VERSION = IO.read('build.xml').match(/<property name="version" value="(.+?)"\/>/)[1]
end


#############################################################################
#
# Data tasks
#
#############################################################################

task :schema do
  # Retrieve table and column data
  tables = get_tables()

  # Generate XML schema
  xml = Nokogiri::XML('<schema/>')
  
  # Loop over tables
  tables.each do |table|
    table_xml = *xml.root.add_child('<table/>')
    table_xml['name'] = table[:name]
    
    # Loop over columns
    table[:columns].each do |column|
      column_xml = *table_xml.add_child('<column/>')
      column_xml['name'] = column[:name]
      column_xml['indexable'] = column[:indexable].to_s
      column_xml['type'] = column[:type]
      column_xml['description'] = column[:description].strip
    end
  end
  
  # Write schema file
  filename = File.join(File.dirname(__FILE__), 'src/main/resources/schema.xml')
  File.open(filename, 'w') do |f|
    f.write(xml.to_s)
  end
  
  puts "Schema written out to: #{filename}"
end

def get_tables
  html = Nokogiri::HTML(open('http://developers.facebook.com/docs/reference/fql'))
  html.css('ul#navsubsectionpages a').map do |a|
    table = {}
    table[:name]    = a.content
    table[:columns] = get_columns(a['href'])
    
    puts table[:name]
    table
  end
end

def get_columns(table_url)
  html = Nokogiri::HTML(open("http://developers.facebook.com#{table_url}"))
  html.css('table.params.columns tr')[1..-1].map do |tr|
    column = {}
    column[:indexable] = (tr.at_css('td.indexable').content == '*')
    column[:name] = tr.at_css('td.name').content
    column[:type] = tr.at_css('td.type').content
    column[:description] = tr.css('td').last.content
    column[:description].gsub!(/\.(Note:)/, '. \1')
    column[:description].gsub!(/\s+/, ' ')
    column
  end
end


#############################################################################
#
# Packaging tasks
#
#############################################################################

task :release do
  puts ""
  print "Are you sure you want to relase FQL Editor #{FQLEditor::VERSION}? [y/N] "
  exit unless STDIN.gets.index(/y/i) == 0
  
  unless `git branch` =~ /^\* master$/
    puts "You must be on the master branch to release!"
    exit!
  end
  
  # Commit
  sh "git commit --allow-empty -a -m 'v#{FQLEditor::VERSION}'"
  sh "git tag v#{FQLEditor::VERSION}"
  sh "git push origin master"
  sh "git push origin v#{FQLEditor::VERSION}"
end
