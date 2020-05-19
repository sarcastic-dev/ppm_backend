namespace :checklist_data do
  task :init => :environment do
    predefined = YAML.load_file(File.join(File.dirname(__FILE__), "../../db/data/checklist_items.yml"))

    print "Wind Turbine Init"
    predefined['wind_turbine'].each do |wind_turbine|
      WindTurbineChkl.find_or_create_by(title: wind_turbine['name'])
      print "."
    end

    print "Met Mast Init"
    predefined['met_mast'].each do |met_mast|
      MetMastChkl.find_or_create_by(title: met_mast['name'])
      print "."
    end

  end
end