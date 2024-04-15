# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'proponents/edit', type: :view do
  let(:proponent) do
    Proponent.create!(
      name: 'MyString',
      cpf: 'MyString',
      address: '',
      contacts: '',
      salary: 1,
      inss_discount: 1
    )
  end

  before(:each) do
    assign(:proponent, proponent)
  end

  it 'renders the edit proponent form' do
    render

    assert_select 'form[action=?][method=?]', proponent_path(proponent), 'post' do
      assert_select 'input[name=?]', 'proponent[name]'

      assert_select 'input[name=?]', 'proponent[cpf]'

      assert_select 'input[name=?]', 'proponent[address]'

      assert_select 'input[name=?]', 'proponent[contacts]'

      assert_select 'input[name=?]', 'proponent[salary]'

      assert_select 'input[name=?]', 'proponent[inss_discount]'
    end
  end
end
