class ContactFixture
  def self.id
    Faker::Number.number(6).to_s
  end

  def self.info custom = {}
    contact = {
      :email       => Faker::Internet.email,
      :voice       => "55.1198765432",
      :postal_info => {
        :org          => Faker::Name.name,
        :name         => Faker::Name.name,
        :addr         => {
          :street       => "Test Suite\n1 Test Avenue",
          # :street       => Faker::Address.street_name,
          :city         => "Sao Paulo",
          :sp           => "SP",
          :pc           => "01201-060",
          :cc           => "BR"
        }
      },
      :auth_info   => {:pw => Faker::Internet.password},
      :disclose    => {"0" => %w(voice email)}
    }

    custom.each do |key, value|
      contact[key] = value
    end

    contact
  end

  def self.change
    {
      chg: {
        postal_info: {
          addr: {
            street: "Rua Bar"
          }
        },
        voice: '55.1198765433',
        email: Faker::Internet.email,
      }
    }
  end
end
