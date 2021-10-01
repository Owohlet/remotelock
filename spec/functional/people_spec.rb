require 'spec_helper'

RSpec.describe 'App Functional Test' do
  describe 'People controller' do
    let(:params) do
      {
        dollar_format: File.read('spec/fixtures/people_by_dollar.txt'),
        percent_format: File.read('spec/fixtures/people_by_percent.txt'),
        order: :city,
      }
    end
    let(:dollar_format) {File.read('spec/fixtures/people_by_dollar.txt')}
    let(:people_controller) { PeopleController.new(params) }


    it 'parses the dollar file and outputs a nested array of file inputs' do
      dollar_array = people_controller.dollar_file_to_array(dollar_format)


      expect(dollar_array).to eq [["city", "birthdate", "last_name", "first_name"], ["LA", "30-4-1974", "Nolan", "Rhiannon"], ["NYC", "5-1-1962", "Bruen", "Rigoberto"]]
    end

    it 'sorts array using passed in parameter' do
      percent_array = people_controller.percent_file_to_array(params[:percent_format])
      percent_array.shift #remove headers
      sorted_array = people_controller.sort_by(params[:order],percent_array)

      expect(sorted_array).to eq [["Mckayla", "Atlanta", "1986-05-29"], ["Elliot", "New York City", "1947-05-04"]]
    end
  end
end
