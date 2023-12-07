require "rails_helper"

RSpec.describe Customer, type: :model do
  it "# full_name" do
    customer = create(:user) # ou create(:customer)
    expect(customer.full_name).to start_with("Sr. ")
  end

  it "# full_name - Sobrescrevendo atributo" do
    customer = create(:customer, name: "Kaique")
    expect(customer.full_name).to eq("Sr. Kaique")
  end

  it "# vip - Herança" do # Testa se o customer é vip
    customer = create(:customer_vip)
    expect(customer.vip).to eq(true) # ou be_truthy
  end

  it "# default - Herança" do # Testa se o customer é default
    customer = create(:customer_default)
    expect(customer.vip).to eq(false) # ou be_falsey
  end
  it { expect { create(:customer) }.to change { Customer.all.size }.by(1) } # Testa se o create(:customer) cria um novo customer
end
