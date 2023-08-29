module Fastlane
  module Actions
    module SharedValues
      PUBLISH_CODE_COVRAGE_CUSTOM_VALUE = :PUBLISH_CODE_COVRAGE_CUSTOM_VALUE
    end

    class PublishCodeCovrageAction < Action

      COVERAGE_FILE_PATH = 'fastlane/code_coverage/index.html'

      def self.run(params)
        UI.message "Generating Slather report"
        Actions::SlatherAction.run(
          scheme: 'calmo',
          proj: 'calmo.xcodeproj',
          output_directory: "fastlane/code_coverage", 
          html: true
      )
        UI.message "Obtaining coverage number"
        code_coverage = get_code_coverage()
        UI.message "Code coverage: #{code_coverage}"
        UI.message "Getting commit SHA"
        commit_sha = get_current_commit_sha()
        UI.message "Current commit SHA: #{commit_sha}"
        UI.message "Publishing coverage on Github"
        code_coverage_number = code_coverage.gsub('%', '')
        code_coverage_number_as_float = code_coverage_number.to_f
        target_coverage  = ENV["TARGET_COVERAGE"].to_f
        publish_to_github(code_coverage_number_as_float,target_coverage,"Code coverage: #{code_coverage} Target coverage: >= #{target_coverage}%", commit_sha)
      end
      

      def self.get_code_coverage
        current_dir = Dir.pwd
        complete_coverage_file_path = "#{current_dir}/#{COVERAGE_FILE_PATH}"
        UI.message "Coverage file path: #{complete_coverage_file_path}"

        first_term = "id=\"total_coverage\">"
        second_term = "</span>"

         # Check file existence and find coverage
        begin
          file = File.open(complete_coverage_file_path)
          file_data = file.read
          first_string = file_data.split(first_term, -1)[1]
          final_string = first_string.split(second_term, -1)[0]
          return final_string
        rescue Errno::ENOENT
          return nil
        end

      end  


      def self.get_current_commit_sha
        commit_info = LastGitCommitAction.run(nil)
        commit_info[:commit_hash]
      end




      def self.publish_to_github(code_coverage_number_as_float,target_coverage,message, commit_sha)

        status = if code_coverage_number_as_float >= target_coverage
          "success"
        else
          "failure"
        end

        GithubApiAction.run(
          server_url: "https://api.github.com",
          api_token: ENV["REPO_ACCESS_TOKEN"],
          http_method: "POST",
          path: "/repos/DedSecTeam17/calmo-ios/statuses/#{commit_sha}",
          raw_body:"{\"state\":\"#{status}\", \"description\": \"#{message}\", \"context\": \"coverage\"}",
          error_handlers: {
            404 => proc do |result|
              UI.message("Couldn't find resource: #{result[:json]}")
            end,
            '*' => proc do |result|
              UI.message("Unknown error: #{result[:json]}")
            end
          }
        ) do |result|
          UI.message("Code coverage updated for commit #{commit_sha}")
        end
      end      

      #####################################################
      # @!group Documentation
      #####################################################

      def self.description
        'A short description with <= 80 characters of what this action does'
      end

      def self.details
        'You can use this action to do cool things...'
      end



      def self.authors
        ['Mohammed Elamin']
      end

      def self.is_supported?(platform)
        platform == :ios
      end
    end
  end
end
