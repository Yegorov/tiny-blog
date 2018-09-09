RSpec.shared_examples 'Generate slugs' do |model_klass|
  let(:user) { FactoryBot.build_stubbed(:user) }
  let(:model) { FactoryBot.build_stubbed(model_klass.model_name.singular.to_sym,
                author: user) }

  it "must generate slug before valid" do
    model.valid?
    expect(model.slug).to be_present
  end

  it "must generate correct cyrillic slug" do
    model.title = "кирилические символы"
    model.valid?
    expect(model.slug).to be_present
    expect(model.slug).to eq("kirilicheskie-simvoly")
  end
end
