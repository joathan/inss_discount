# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'proponents/index', type: :view do
  before(:each) do
    assign(:proponents, [
             Proponent.create!(
               name: 'Name',
               cpf: 'Cpf',
               address: '',
               contacts: '',
               salary: 2,
               inss_discount: 3
             ),
             Proponent.create!(
               name: 'Name',
               cpf: 'Cpf',
               address: '',
               contacts: '',
               salary: 2,
               inss_discount: 3
             )
           ])
  end

  it 'renders a list of proponents' do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new('Name'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('Cpf'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(''.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(''.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(3.to_s), count: 2
  end
end
