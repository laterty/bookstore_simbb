# frozen_string_literal: true

RSpec.describe AddressForm, type: :model do
  describe 'Create' do
    let!(:current_user) { create(:user) }
    let!(:valid_params) do
      {
        first_name: 'Jesse',
        last_name: 'Pinkman',
        address: 'Address',
        city: 'Albuquerque',
        country: 'US',
        zip: '03068',
        phone: '+1483369',
        type: 'BillingAddress'
      }
    end
    let!(:valid_address) { Address.find_or_initialize_by(user_id: current_user.id, type: valid_params[:type]) }

    context 'when params is valid' do
      let!(:saved_address) { described_class.new(valid_address, valid_params).save }
      let(:expected_class) { BillingAddress }
      let!(:address_save?) { Address.pluck(:id).include?(saved_address.id) }

      it 'stores params attributes in corresponding address attributes' do
        valid_params.each do |key, value|
          expect(saved_address[key]).to eq(value)
        end
      end

      it 'save address' do
        expect(address_save?).to be_truthy
      end

      it 'return address with correct type' do
        expect(saved_address).to be_kind_of(expected_class)
      end
    end

    context 'when params have invalid data' do
      let!(:saved_address) { described_class.new(valid_address, {}).save }

      it 'return nil when invalid params' do
        expect(saved_address).to be_nil
      end
    end
  end

  describe 'Update' do
    let!(:address) { create(:address, :billing_address) }

    context 'when params valid' do
      let!(:valid_params) do
        { first_name: 'testname',
          last_name: address.last_name,
          address: address.address,
          city: address.city,
          country: address.country,
          zip: address.zip,
          phone: address.phone,
          type: address.type }
      end

      let!(:updated_address) { described_class.new(address, valid_params).save }

      it 'update first_name' do
        expect(updated_address.first_name).to eq(valid_params[:first_name])
      end
    end
  end

  describe 'Validation' do
    let!(:current_user) { create(:user) }
    let!(:initialize_address) { Address.find_or_initialize_by(user_id: current_user.id, type: BillingAddress.name) }

    before { address_form.save }

    context 'when bad first_name' do
      let!(:params_invalid_first_name) { { first_name: 'First1' } }
      let!(:address_form) { described_class.new(initialize_address, params_invalid_first_name) }

      let(:has_error) do
        address_form.errors[:first_name].include?(I18n.t('validation.address.names_city_country'))
      end

      it 'validation first_name by regex' do
        expect(has_error).to be_truthy
      end
    end

    context 'when bad last_name' do
      let!(:params_invalid_last_name) { { last_name: 'Last1' } }
      let!(:address_form) { described_class.new(initialize_address, params_invalid_last_name) }

      let(:has_error) do
        address_form.errors[:last_name].include?(I18n.t('validation.address.names_city_country'))
      end

      it 'validation last_name by regex' do
        expect(has_error).to be_truthy
      end
    end

    context 'when bad address' do
      let!(:params_invalid_address) { { address: '4ddres!*' } }
      let!(:address_form) { described_class.new(initialize_address, params_invalid_address) }

      let(:has_error) do
        address_form.errors[:address].include?(I18n.t('validation.address.address'))
      end

      it 'validation address by regex' do
        expect(has_error).to be_truthy
      end
    end

    context 'when bad city' do
      let!(:params_invalid_city) { { city: 'City1231' } }
      let!(:address_form) { described_class.new(initialize_address, params_invalid_city) }

      let(:has_error) do
        address_form.errors[:city].include?(I18n.t('validation.address.names_city_country'))
      end

      it 'validation city by regex' do
        expect(has_error).to be_truthy
      end
    end

    context 'when bad zip' do
      let!(:params_invalid_zip) { { zip: '123!@' } }
      let!(:address_form) { described_class.new(initialize_address, params_invalid_zip) }

      let(:has_error) do
        address_form.errors[:zip].include?(I18n.t('validation.address.zip'))
      end

      it 'validation zip by regex' do
        expect(has_error).to be_truthy
      end
    end

    context 'when bad phone' do
      let!(:params_invalid_phone) { { phone: '12' } }
      let!(:address_form) { described_class.new(initialize_address, params_invalid_phone) }

      let(:has_error) do
        address_form.errors[:phone].include?(I18n.t('validation.address.phone'))
      end

      it 'validation phone by regex' do
        expect(has_error).to be_truthy
      end
    end
  end
end
