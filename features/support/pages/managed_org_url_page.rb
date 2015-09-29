class ManagedOrgUrlPage
  include PageObject

  def set_up_managed_org_url
    instance_url = $instance_url.sub("https://", "https://npsp.")
    $managed_org_url = instance_url.sub("salesforce.com", "visual.force.com")
  end
end
