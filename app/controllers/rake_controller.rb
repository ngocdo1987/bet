require 'open3'

class RakeController < ApplicationController
    layout 'mini_tools'
    
    def index
        if params[:task].blank? == false
            rails_cmd = params[:task]
            
            result = []
            
            Open3::popen3(rails_cmd) do |stdin,stdout,stderr|
                begin
                    while line = stdout.readline
                        result << line
                    end
                rescue
                end
            end
            
            check_generate_migration = rails_cmd.scan(/rails generate migration/is)
            if check_generate_migration.blank? == false
                Open3::popen3("rake db:migrate") do |stdin,stdout,stderr|
                    begin
                        while line = stdout.readline
                            result << line
                        end
                    rescue
                    end
                end     
            end    
            @result = result
            #rake_task = params[:task]
            #Rake::Task[rake_task].reenable
            #Rake::Task[rake_task].invoke
        end
        @mt = 'Run Rails command'
    end
end