module ApplicationHelper
  
  def share_text
    "Plebiscito para la dimision de Mariano Rajoy de la Presidencia DimisionRajoy.com"
  end
  
  def display_in_popup
    {onclick: "return !window.open(this.href, 'Twitter', 'width=500,height=500')", target: "_blank"}
  end
  
end
