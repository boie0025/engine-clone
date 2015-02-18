module Locomotive::TranslationRepository < Struct.new(:current_site)

  def list
    current_site.translations
  end

  def create(serialized_hash)
    # TODO
    # Questions: tranlationRepository should take care of validations
    current_site.translations.create(serialized_hash)
  end


end
