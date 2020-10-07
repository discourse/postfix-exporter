begin
	require 'git-version-bump'
rescue LoadError
	nil
end

Gem::Specification.new do |s|
	s.name = "postfix-exporter"

	s.version = GVB.version rescue "0.0.0.1.NOGVB"
	s.date    = GVB.date    rescue Time.now.strftime("%Y-%m-%d")

	s.platform = Gem::Platform::RUBY

	s.summary  = "Export Prometheus statistics for a Postfix server"

	s.authors  = ["Matt Palmer"]
	s.email    = ["matt.palmer@discourse.org"]
	s.homepage = "https://github.com/discourse/postfix-exporter"

	s.files = `git ls-files -z`.split("\0").reject { |f| f =~ /^(G|spec|Dockerfile|Rakefile)/ }
	s.executables = ["postfix-exporter"]

	s.required_ruby_version = ">= 2.1.0"

	s.add_runtime_dependency 'prometheus-client', '~> 0.7', '< 0.10'
	s.add_runtime_dependency 'rack', '~> 2.0'

	s.add_development_dependency 'bundler'
	s.add_development_dependency 'github-release'
	s.add_development_dependency 'rake'
end
