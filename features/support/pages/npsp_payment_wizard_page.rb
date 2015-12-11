class PaymentWizardPage
  include PageObject

  button(:calculate_payments, value: 'Calculate Payments')
  button(:create_payments_button, value: 'Create Payments')
  div(:current_opportunity_title, class: 'pbHeader', index: 0)
  div(:create_payment_schedule, class: 'pbHeader', index: 1)
  table(:header_line, id: /theTable/)
  a(:ninth_payment_link, text: /PMT/, index: 8)
  select_list(:number_of_payments, name: /paymentCount/)
  div(:payment_page_amount, id: /_ileinner/, index: 2)
  h1(:payment_page_header, class: 'pageType')
  div(:payments_to_be_created, class: 'pbHeader', index: 2)
  h2(:title_text, class: 'pageDescription')
  text_field(:twelfth_amount_textfield, name: /theTable:11/)
end
