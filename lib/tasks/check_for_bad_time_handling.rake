task :check_for_bad_time_handling do
  directories = Dir.glob(File.join(Rails.root, '**', '*.rb'))
  matching_files = directories.select do |filename|
    match = false
    if filename !~ %r{/vendor/bundle/ruby/} # skip vendored gems
      File.open(filename) do |file|
        match = file.map(&:scrub).grep(%r{Time\.(now|utc|parse)}).any?
      end
    end
    match
  end
  if matching_files.any?
    raise <<-MSG

Avoid issues with daylight-savings time by always building instances of
TimeWithZone and not Time. Use methods like:
    Time.zone.now, Time.zone.parse, n.days.ago, m.hours.from_now, etc

in preference to methods like:
    Time.now, Time.utc, Time.parse, etc

Files that contain bad Time handling:
  #{matching_files.join("\n  ")}

MSG
  end
end
