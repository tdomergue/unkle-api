FactoryBot.define do
  
  factory :user do
    email { "aurelie.peguet@gmail.com" }
    password { "123456" }
  end

  factory :contract do
    number { 1234567890 }
    status { 'active' }
    start_date { Date.parse('19/06/1991') }
    end_date { Date.parse('19/06/2022') }
  end

  factory :subscription do
    user
    contract
  end

  factory :option do
    identifier { '3AFF6IKS97' }
    title { "Tout risque" }
    description { "L’assurance « tout risque » est la formule d’assurance voiture la plus complète, mais aussi la plus chère. Elle s’adresse aux automobilistes qui souhaitent circuler l’esprit tranquille, en étant certains de bénéficier de la meilleure couverture possible contre les risques." }
  end

end
