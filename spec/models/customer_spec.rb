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

  it "Usando o attributes_for" do # Testa se o attributes_for(:customer) cria um novo customer
    attrs = attributes_for(:customer) # ou attributes_for(:customer_vip)
    customer = Customer.create(attrs) # ou Customer.create(attrs)
    expect(customer.full_name).to start_with("Sr. ") # ou expect(customer[:full_name]).to start_with("Sr. ")
  end

  it "Atributo transitório" do # Testa se o attributes_for(:customer, upcased: true) cria um novo customer com o name em upcase
    customer = create(:customer_default, upcased: true) # ou create(:customer_vip, upcased: true)
    expect(customer.name.upcase).to eq(customer.name)
  end
end
