class NPSPManageSoftCreditsPage
  include PageObject

  div(:body_content, class: 'myBodyContent')
  radio_button(:percent_button, index: 1)
  checkbox(:allow_check, id: /allowTooManySoftCredits/)
end
