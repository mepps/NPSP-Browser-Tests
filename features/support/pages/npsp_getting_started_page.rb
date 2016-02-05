class NPSPGettingStartedPage
  include PageObject

  div(:page_contents, class: 'bootstrap')
  a(:salesforce_fundamentals_link, href: 'https://powerofus.force.com/articles/Resource/Salesforce-Fundamentals')
  a(:beginner_admin_trail_link, href: 'https://developer.salesforce.com/trailhead/trail/force_com_admin_beginner')
  a(:this_interactive_learning_path_link, href: 'https://developer.salesforce.com/trailhead/trail/nonprofit_fundraising')
  #MAKE TEST PASS IN SANDBOX ORG. FILED BUG WITH CORE ABOUT THIS
  #a(:this_workbook_link, href: 'https://powerofus.force.com/servlet/fileField?retURL=%2Farticles%2FResource%2FNonprofit-Starter-Pack-Workbook%3Fpopup%3Dfalse&entityId=ka080000000DPGdAAO&field=File__Body__s')
  #a(:guide_link, href: 'https://powerofus.force.com/servlet/fileField?retURL=%2Farticles%2FResource%2FNPSP-Administrators-Guide-to-Importing-Donor-Data&entityId=ka080000000DMSTAA4&field=File__Body__s')

  #a(:this_workbook_link, href: Regexp.escape("https://powerofus.force.com/servlet/fileField?retURL=%2Farticles%2FResource%2FNonprofit-Starter-Pack-Workbook%3Fpopup%3Dfalse&entityId="))
  #a(:guide_link, href: Regexp.escape("https://powerofus.force.com/servlet/fileField?retURL=%2Farticles%2FResource%2FNPSP-Administrators-Guide-to-Importing-Donor-Data&entityId=k"))

  a(:this_workbook_link, href: /Nonprofit-Starter-Pack-Workbook/)
  a(:guide_link, href: /NPSP-Administrators-Guide-to-Importing-Donor-Data/)


  a(:power_of_us_login_link, href: 'https://powerofus.force.com')
  a(:salesforce_success_learn_more_link, href: 'https://powerofus.force.com/articles/Resource/Get-Help-NPSP')
  a(:foundation_office_hours_learn_more_link, href: 'https://powerofus.force.com/articles/Resource/Salesforce-com-Foundation-Weekly-Office-Hours')
end