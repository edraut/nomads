class FixtureManifest
  def self.template
    @@fixtures ||= {
      :attachments => 1,
      :brands => 1,
      :browse_tags => 1,
      :campaign_templates => 1,
      :campaign_text_blocks => 1,
      :campaigns => 1,
      :item_browse_tags => 1,
      :item_colors => 1,
      :item_fabrics => 1,
      :item_sizes => 1,
      :items => 1,
      :pages => 1,
      :size_groups => 1,
      :sizes => 1,
      :users => 1
    }
  end
  
  def self.list
    self.extract_keys_recursively self.template
  end
  
  def self.extract_keys_recursively(hash)
    ret = hash.keys
    for key,val in hash
      unless val == 1
        ret = ret + self.extract_keys_recursively(val)
      end
    end
    ret
  end
end