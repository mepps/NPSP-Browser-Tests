class EPTPage
  include PageObject

  text_field(:template_name, id: /theForm:idName/)
end
