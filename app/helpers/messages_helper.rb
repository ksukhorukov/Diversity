module MessagesHelper
  def format_greeting(counter)
    if counter == 0 || counter >= 5
      'запросов'
    elsif counter == 1
      'запрос'
    else
      'запроса'
    end
  end
end
