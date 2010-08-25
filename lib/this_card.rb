class ThisCardMacro
  def initialize(parameters, project, current_user)
    @project = project
    @parameters = parameters
    @current_user = current_user
  end

  def execute
    attribute_query = @parameters['attribute']
    attribute       = attribute_query[query_regex, 1]
    method          = attribute_query[query_regex, 2]

    result = find_card_property(attribute)

    case method
    when "username"
      result = username(result)
    when "full_name"
      result = full_name(result)
    when "number"
      result = result[/(\d+)/,1]
    end

    result

  rescue
    "{ There was an error in your attribute param! }"
  end

  def can_be_cached?
    true
  end

  private

  def find_card_property(attribute)
    if card_hash = @project.execute_mql("SELECT '#{attribute}' WHERE '#{attribute}' = THIS CARD.'#{attribute}'").first
      return card_hash[column_name(attribute)]
    end
    return ""
  end

  def column_name(attribute)
    attribute.downcase.gsub(" ", "_")
  end

  def query_regex
    /([^.]*)\.?(.*)?/
  end
  def user_regex
    /([^\(]*) \((.*)\)/
  end
  def username(user_string)
    user_string[user_regex, 2]
  end
  def full_name(user_string)
    user_string[user_regex, 1]
  end
end

