namespace :projects do
  desc "Delete projects from all models"
  task delete_all: :environment do
    ProjectInfo.destroy_all
    MetMastInfo.destroy_all
    TurbineInfo.destroy_all
    BoomSensorInfo.destroy_all
    ProjectCheckedList.destroy_all
    ProjectNote.destroy_all
    puts "All projects have been deleted"
  end

end
