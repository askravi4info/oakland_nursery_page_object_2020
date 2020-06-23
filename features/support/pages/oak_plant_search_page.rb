class OakPlantSearchPage
  include PageObject

  # page_url 'https://plants.oaklandnursery.com/12130001'
  page_url $app_url

  text_field(:search_plant_edit_box, id: 'NetPS-KeywordInput')
  button(:submit, id: 'NetPSSubmit')
  links(:plan_names, class: /NetPS-ResultsP(2|)Link$/)
  checkbox(:choose_first_result, id: 'CheckmP1')
  link(:select_wish_list, text: 'View My Wish List')
  div(:wish_list_header, id: 'NetPS-mPTitle')
  div(:plant_details, class: 'NetPS-ResultsDataSub')


  def search_plant plant_name
    # search_plant_edit_box_element.set plant_name
    self.search_plant_edit_box = plant_name
    submit_element.click
  end

  def get_all_plant_names
    all_results = []
    plan_names_elements.each do |each_result|
      all_results << each_result.text
    end
    all_results
    # plan_names_elements.map(&:text)
  end

  def verify_plant_search_is_correct plant_name
    get_all_plant_names.each do |each_name|
      # p "verifying the plant - #{each_name} has correct value - #{plant_name}"
      fail "Plant Name #{each_name} is not related to #{plant_name}" unless each_name.include? plant_name
    end
  end

  def verify_no_of_plant_search_results exp_count
    fail "No of Results are NOT Same as #{exp_count}" unless plan_names_elements.count == exp_count
  end

  def add_plant_to_wishlist
    # @browser.divs(class: 'NetPS-ResultsData').each do |each_result|
    #   # p each_result.link(class: /NetPS-ResultsP(2|)Link$/).text
    #   each_result.checkbox(id: /CheckmP/).click
    # end
    unless choose_first_result_element.checked?
      choose_first_result_element.when_present(60).set
    end
    select_wish_list_element.click
    fail "You are not on the Wish list page" unless wish_list_header_element.text.eql? 'My Wish List'
  end

  def verify_wishlist_has_plant first_plant_name_from_search_page
    first_plant_name_from_wishlist_page = get_all_plant_names.first
    fail "Wishlist doesnt has the correct plant" unless first_plant_name_from_search_page == first_plant_name_from_wishlist_page
  end

  def get_plant_info
    plant_info_hash = {}
    plant_details_element.text.split("\n").each do |plant_detail_info|
      # plant_detail_info.split(": ")[0]
      plant_info_hash[plant_detail_info.split(": ")[0]] = plant_detail_info.split(": ")[1].strip
    end
    plant_info_hash
  end






end

