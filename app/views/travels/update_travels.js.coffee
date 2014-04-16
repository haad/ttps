$("#travels_select").empty().append("<%= escape_javascript(render(:partial => 'travel', :locals => { :travels => @travels })) %>")
