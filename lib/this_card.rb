class ThisCardMacro
  def initialize(parameters, project, current_user)
    @project = project
    @parameters = parameters
    @current_user = current_user
  end

  def execute
    attribute_query = @parameters['attribute'].strip

    if attribute_query.downcase == "current user"
      user = @project.execute_mql("SELECT 'owner' WHERE 'owner' = CURRENT USER").first
      user['owner']
    elsif attribute_query.downcase == "current date"
      return Time.now.strftime("%d/%m/%Y")
    else
      find_card_property(attribute_query)
    end

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

end

