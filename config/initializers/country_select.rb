CountrySelect::FORMATS[:with_full_country_name] = lambda do |country|
  [
    country.name,
    country.alpha2,
    {
      'value' => country.name,
    }
  ]
end
