Redmine::Plugin.register :redmine_wiki_extra_macros do
    name 'Redmine plugin extending macros Wiki.'
    author 'Eugene M.'
    description 'Redmine plugin adds a macro to Wiki Redmine. {{project_id}}, {{project_name}}, {{project_email(example.com)}}, {{current_user_mail}} {{url_with_mail(example.com?mail=)}}'
    version '0.0.2'
    url 'https://github.com/ujin77/redmine_wiki_extra_macros'
    author_url 'mailto:ujin@i.ua'

    module ExtWikiMacros
    Redmine::WikiFormatting::Macros.register do
        desc "This plugin adds a macro to Wiki Redmine. <pre>{{project_id}} {{project_name}} {{project_email(example.com)}} {{current_user_mail}} {{url_with_mail(example.com?mail=)}}</pre>"
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
        macro :current_user_mail do |obj, args|
	    return User.current.mail
        end
        macro :url_with_mail do |obj, args|
	if args.size > 0
	    return link_to(nil, args.first.to_s + User.current.mail)
	else
	    return ''
        end
	end
    end
    end
end
