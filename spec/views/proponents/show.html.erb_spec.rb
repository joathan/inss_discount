require 'rails_helper'

RSpec.describe "proponents/show", type: :view do
  before(:each) do
    assign(:proponent, Proponent.create!(
      name: "Name",
      cpf: "Cpf",
      address: "",
      contacts: "",
      salary: 2,
      inss_discount: 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Cpf/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
  end
end
