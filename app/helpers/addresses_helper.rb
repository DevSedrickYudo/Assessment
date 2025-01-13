module AddressesHelper
  def geocomplete_lookup(obj='test',obj_id=0,td_colspan=3,td_class='info',unique_data_container='geo-container',unique_data_name='data-geo',tr_style=nil)
    input_id = a_input_id(obj, obj_id)
    if (request.user_agent =~ /Mobile|webOS/)
      use_style = "height:40px;width:95%;"
    else
      use_style ="width:95%;"
    end
    ans = <<-DOC
      <tr style='#{tr_style}'>
        <td class='#{td_class}' colspan='#{td_colspan}'>
          #{a_input_header('Address Lookup')}
          <input type="text" name="google_address" id="#{input_id}" placeholder="Type here to begin search..." style="#{use_style}" autocomplete="addressid_lookup">
          <script>
            jQuery("##{input_id}").geocomplete({
              details: ".#{unique_data_container}",
              detailsAttribute: "#{unique_data_name}"
            });
          </script>
          <style>
        	.pac-container {
        		z-index:1005 !important;
        	}
          </style>
        </td>
      </tr>
    DOC
    raw(ans)
  end
  
  def a_input_id(input_name, obj_id)
    input_name.to_s.gsub("[", "_").gsub("]", "") + "_#{obj_id}_id"
  end
  
  def a_input_header(input_title)
    "<div class=''><div class='ultrabold inputheader'>#{input_title}</div></div>".html_safe
  end
  
end
