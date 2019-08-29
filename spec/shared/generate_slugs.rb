RSpec.shared_examples 'Generate slugs' do |field, field_slug|
  before(:example) do
    resource.valid?
  end

  it "must present slug" do
    expect(resource[field_slug]).to be_present
  end

  context 'with cyrillic symbols' do
    before(:example) do
      resource[field] = "кирилические символы"
      resource[field_slug] = nil
      resource.valid?
    end

    it "must present slug" do
      expect(resource[field_slug]).to be_present
    end

    it "must generate correct slug" do
      expect(resource[field_slug]).to eq("kirilicheskie-simvoly")
    end
  end
end
