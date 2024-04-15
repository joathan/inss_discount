# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'proponents/new', type: :view do
  before(:each) do
    assign(:proponent, Proponent.new(
                         name: 'MyString',
                         cpf: 'MyString',
                         address: '',
                         contacts: '',
                         salary: 1,
                         inss_discount: 1
                       ))
  end

  it 'renders new proponent form' do
    render

    assert_select 'form[action=?][method=?]', proponents_path, 'post' do
      assert_select 'input[name=?]', 'proponent[name]'

      assert_select 'input[name=?]', 'proponent[cpf]'

      assert_select 'input[name=?]', 'proponent[address]'

      assert_select 'input[name=?]', 'proponent[contacts]'

      assert_select 'input[name=?]', 'proponent[salary]'

      assert_select 'input[name=?]', 'proponent[inss_discount]'
    end
  end
end
