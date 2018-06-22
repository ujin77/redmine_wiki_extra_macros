Redmine::Plugin.register :redmine_wiki_extra_macros do
    name 'Redmine plugin extending macros Wiki.'
    author 'Eugene M'
    description 'Redmine plugin extending macros Wiki.'
    version '0.0.1'
    url 'http://example.com/path/to/plugin'
    author_url 'https://am-bits.com'

    module ExtWikiMacros
	Redmine::WikiFormatting::Macros.register do
	    desc "This plugin adds a macro to Wiki Redmine. Syntax: <pre>{{project_id}}</pre>"
	    macro :project_id do |obj, args|
		return @project.identifier
	    end
	    macro :project_name do |obj, args|
		return @project.name
	    end
	    macro :project_email do |obj, args|
		if args.size > 0
		    return mail_to(@project.identifier + '@' + args.first.to_s)
		else
		    return @project.identifier
		end
	    end
	end
    end
end
